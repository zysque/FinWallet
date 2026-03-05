import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_heirarchies_record.g.dart';

abstract class UserHeirarchiesRecord
    implements Built<UserHeirarchiesRecord, UserHeirarchiesRecordBuilder> {
  static Serializer<UserHeirarchiesRecord> get serializer =>
      _$userHeirarchiesRecordSerializer;

  @nullable
  DocumentReference get hierarchyUser;

  @nullable
  String get userEmail;

  @nullable
  BuiltList<DocumentReference> get hierarchicalParents;

  @nullable
  String get parentEmail;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UserHeirarchiesRecordBuilder builder) =>
      builder
        ..userEmail = ''
        ..hierarchicalParents = ListBuilder()
        ..parentEmail = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userHeirarchies');

  static Stream<UserHeirarchiesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UserHeirarchiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  UserHeirarchiesRecord._();
  factory UserHeirarchiesRecord(
          [void Function(UserHeirarchiesRecordBuilder) updates]) =
      _$UserHeirarchiesRecord;

  static UserHeirarchiesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUserHeirarchiesRecordData({
  DocumentReference hierarchyUser,
  String userEmail,
  String parentEmail,
}) =>
    serializers.toFirestore(
        UserHeirarchiesRecord.serializer,
        UserHeirarchiesRecord((u) => u
          ..hierarchyUser = hierarchyUser
          ..userEmail = userEmail
          ..hierarchicalParents = null
          ..parentEmail = parentEmail));
