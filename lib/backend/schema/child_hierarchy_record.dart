import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'child_hierarchy_record.g.dart';

abstract class ChildHierarchyRecord
    implements Built<ChildHierarchyRecord, ChildHierarchyRecordBuilder> {
  static Serializer<ChildHierarchyRecord> get serializer =>
      _$childHierarchyRecordSerializer;

  @nullable
  DocumentReference get childRef;

  @nullable
  DocumentReference get parentRef;

  @nullable
  String get parentLeg;

  @nullable
  String get childEmail;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ChildHierarchyRecordBuilder builder) => builder
    ..parentLeg = ''
    ..childEmail = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('childHierarchy');

  static Stream<ChildHierarchyRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ChildHierarchyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ChildHierarchyRecord._();
  factory ChildHierarchyRecord(
          [void Function(ChildHierarchyRecordBuilder) updates]) =
      _$ChildHierarchyRecord;

  static ChildHierarchyRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createChildHierarchyRecordData({
  DocumentReference childRef,
  DocumentReference parentRef,
  String parentLeg,
  String childEmail,
}) =>
    serializers.toFirestore(
        ChildHierarchyRecord.serializer,
        ChildHierarchyRecord((c) => c
          ..childRef = childRef
          ..parentRef = parentRef
          ..parentLeg = parentLeg
          ..childEmail = childEmail));
