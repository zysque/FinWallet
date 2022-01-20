import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'delinked_user_record.g.dart';

abstract class DelinkedUserRecord
    implements Built<DelinkedUserRecord, DelinkedUserRecordBuilder> {
  static Serializer<DelinkedUserRecord> get serializer =>
      _$delinkedUserRecordSerializer;

  @nullable
  String get email;

  @nullable
  DocumentReference get userRef;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DelinkedUserRecordBuilder builder) =>
      builder..email = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('delinkedUser');

  static Stream<DelinkedUserRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DelinkedUserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  DelinkedUserRecord._();
  factory DelinkedUserRecord(
          [void Function(DelinkedUserRecordBuilder) updates]) =
      _$DelinkedUserRecord;

  static DelinkedUserRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDelinkedUserRecordData({
  String email,
  DocumentReference userRef,
}) =>
    serializers.toFirestore(
        DelinkedUserRecord.serializer,
        DelinkedUserRecord((d) => d
          ..email = email
          ..userRef = userRef));
