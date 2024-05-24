import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RatingsRecord extends FirestoreRecord {
  RatingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "fromUserId" field.
  DocumentReference? _fromUserId;
  DocumentReference? get fromUserId => _fromUserId;
  bool hasFromUserId() => _fromUserId != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "rideId" field.
  DocumentReference? _rideId;
  DocumentReference? get rideId => _rideId;
  bool hasRideId() => _rideId != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "toUserId" field.
  DocumentReference? _toUserId;
  DocumentReference? get toUserId => _toUserId;
  bool hasToUserId() => _toUserId != null;

  void _initializeFields() {
    _comment = snapshotData['comment'] as String?;
    _fromUserId = snapshotData['fromUserId'] as DocumentReference?;
    _rating = castToType<int>(snapshotData['rating']);
    _rideId = snapshotData['rideId'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _toUserId = snapshotData['toUserId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ratings');

  static Stream<RatingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RatingsRecord.fromSnapshot(s));

  static Future<RatingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RatingsRecord.fromSnapshot(s));

  static RatingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RatingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RatingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RatingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RatingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RatingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRatingsRecordData({
  String? comment,
  DocumentReference? fromUserId,
  int? rating,
  DocumentReference? rideId,
  DateTime? timestamp,
  DocumentReference? toUserId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment': comment,
      'fromUserId': fromUserId,
      'rating': rating,
      'rideId': rideId,
      'timestamp': timestamp,
      'toUserId': toUserId,
    }.withoutNulls,
  );

  return firestoreData;
}

class RatingsRecordDocumentEquality implements Equality<RatingsRecord> {
  const RatingsRecordDocumentEquality();

  @override
  bool equals(RatingsRecord? e1, RatingsRecord? e2) {
    return e1?.comment == e2?.comment &&
        e1?.fromUserId == e2?.fromUserId &&
        e1?.rating == e2?.rating &&
        e1?.rideId == e2?.rideId &&
        e1?.timestamp == e2?.timestamp &&
        e1?.toUserId == e2?.toUserId;
  }

  @override
  int hash(RatingsRecord? e) => const ListEquality().hash([
        e?.comment,
        e?.fromUserId,
        e?.rating,
        e?.rideId,
        e?.timestamp,
        e?.toUserId
      ]);

  @override
  bool isValidKey(Object? o) => o is RatingsRecord;
}
