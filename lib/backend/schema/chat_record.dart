import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userAuth" field.
  DocumentReference? _userAuth;
  DocumentReference? get userAuth => _userAuth;
  bool hasUserAuth() => _userAuth != null;

  // "userOth" field.
  DocumentReference? _userOth;
  DocumentReference? get userOth => _userOth;
  bool hasUserOth() => _userOth != null;

  // "lastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "messageTime" field.
  DateTime? _messageTime;
  DateTime? get messageTime => _messageTime;
  bool hasMessageTime() => _messageTime != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _userAuth = snapshotData['userAuth'] as DocumentReference?;
    _userOth = snapshotData['userOth'] as DocumentReference?;
    _lastMessage = snapshotData['lastMessage'] as String?;
    _messageTime = snapshotData['messageTime'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRecordData({
  DocumentReference? userAuth,
  DocumentReference? userOth,
  String? lastMessage,
  DateTime? messageTime,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userAuth': userAuth,
      'userOth': userOth,
      'lastMessage': lastMessage,
      'messageTime': messageTime,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRecordDocumentEquality implements Equality<ChatRecord> {
  const ChatRecordDocumentEquality();

  @override
  bool equals(ChatRecord? e1, ChatRecord? e2) {
    return e1?.userAuth == e2?.userAuth &&
        e1?.userOth == e2?.userOth &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.messageTime == e2?.messageTime &&
        e1?.user == e2?.user;
  }

  @override
  int hash(ChatRecord? e) => const ListEquality()
      .hash([e?.userAuth, e?.userOth, e?.lastMessage, e?.messageTime, e?.user]);

  @override
  bool isValidKey(Object? o) => o is ChatRecord;
}
