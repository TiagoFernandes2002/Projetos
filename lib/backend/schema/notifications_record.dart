import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "fromUser" field.
  DocumentReference? _fromUser;
  DocumentReference? get fromUser => _fromUser;
  bool hasFromUser() => _fromUser != null;

  // "toUser" field.
  DocumentReference? _toUser;
  DocumentReference? get toUser => _toUser;
  bool hasToUser() => _toUser != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "chatRef" field.
  DocumentReference? _chatRef;
  DocumentReference? get chatRef => _chatRef;
  bool hasChatRef() => _chatRef != null;

  // "travelRef" field.
  DocumentReference? _travelRef;
  DocumentReference? get travelRef => _travelRef;
  bool hasTravelRef() => _travelRef != null;

  // "isRead" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  // "messageContent" field.
  String? _messageContent;
  String get messageContent => _messageContent ?? '';
  bool hasMessageContent() => _messageContent != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _fromUser = snapshotData['fromUser'] as DocumentReference?;
    _toUser = snapshotData['toUser'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _chatRef = snapshotData['chatRef'] as DocumentReference?;
    _travelRef = snapshotData['travelRef'] as DocumentReference?;
    _isRead = snapshotData['isRead'] as bool?;
    _messageContent = snapshotData['messageContent'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  DateTime? date,
  DocumentReference? fromUser,
  DocumentReference? toUser,
  String? type,
  DocumentReference? chatRef,
  DocumentReference? travelRef,
  bool? isRead,
  String? messageContent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'fromUser': fromUser,
      'toUser': toUser,
      'type': type,
      'chatRef': chatRef,
      'travelRef': travelRef,
      'isRead': isRead,
      'messageContent': messageContent,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.fromUser == e2?.fromUser &&
        e1?.toUser == e2?.toUser &&
        e1?.type == e2?.type &&
        e1?.chatRef == e2?.chatRef &&
        e1?.travelRef == e2?.travelRef &&
        e1?.isRead == e2?.isRead &&
        e1?.messageContent == e2?.messageContent;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.date,
        e?.fromUser,
        e?.toUser,
        e?.type,
        e?.chatRef,
        e?.travelRef,
        e?.isRead,
        e?.messageContent
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
