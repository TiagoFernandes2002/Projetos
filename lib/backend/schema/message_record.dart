import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageRecord extends FirestoreRecord {
  MessageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "msgOwner" field.
  DocumentReference? _msgOwner;
  DocumentReference? get msgOwner => _msgOwner;
  bool hasMsgOwner() => _msgOwner != null;

  // "chatRef" field.
  DocumentReference? _chatRef;
  DocumentReference? get chatRef => _chatRef;
  bool hasChatRef() => _chatRef != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "msgTime" field.
  DateTime? _msgTime;
  DateTime? get msgTime => _msgTime;
  bool hasMsgTime() => _msgTime != null;

  void _initializeFields() {
    _msgOwner = snapshotData['msgOwner'] as DocumentReference?;
    _chatRef = snapshotData['chatRef'] as DocumentReference?;
    _message = snapshotData['message'] as String?;
    _image = snapshotData['image'] as String?;
    _msgTime = snapshotData['msgTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('message');

  static Stream<MessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessageRecord.fromSnapshot(s));

  static Future<MessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessageRecord.fromSnapshot(s));

  static MessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessageRecordData({
  DocumentReference? msgOwner,
  DocumentReference? chatRef,
  String? message,
  String? image,
  DateTime? msgTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'msgOwner': msgOwner,
      'chatRef': chatRef,
      'message': message,
      'image': image,
      'msgTime': msgTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessageRecordDocumentEquality implements Equality<MessageRecord> {
  const MessageRecordDocumentEquality();

  @override
  bool equals(MessageRecord? e1, MessageRecord? e2) {
    return e1?.msgOwner == e2?.msgOwner &&
        e1?.chatRef == e2?.chatRef &&
        e1?.message == e2?.message &&
        e1?.image == e2?.image &&
        e1?.msgTime == e2?.msgTime;
  }

  @override
  int hash(MessageRecord? e) => const ListEquality()
      .hash([e?.msgOwner, e?.chatRef, e?.message, e?.image, e?.msgTime]);

  @override
  bool isValidKey(Object? o) => o is MessageRecord;
}
