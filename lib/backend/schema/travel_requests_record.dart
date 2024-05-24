import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TravelRequestsRecord extends FirestoreRecord {
  TravelRequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "passengerId" field.
  DocumentReference? _passengerId;
  DocumentReference? get passengerId => _passengerId;
  bool hasPassengerId() => _passengerId != null;

  // "isAccepted" field.
  bool? _isAccepted;
  bool get isAccepted => _isAccepted ?? false;
  bool hasIsAccepted() => _isAccepted != null;

  // "travelDate" field.
  DateTime? _travelDate;
  DateTime? get travelDate => _travelDate;
  bool hasTravelDate() => _travelDate != null;

  void _initializeFields() {
    _passengerId = snapshotData['passengerId'] as DocumentReference?;
    _isAccepted = snapshotData['isAccepted'] as bool?;
    _travelDate = snapshotData['travelDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('travelRequests');

  static Stream<TravelRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TravelRequestsRecord.fromSnapshot(s));

  static Future<TravelRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TravelRequestsRecord.fromSnapshot(s));

  static TravelRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TravelRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TravelRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TravelRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TravelRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TravelRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTravelRequestsRecordData({
  DocumentReference? passengerId,
  bool? isAccepted,
  DateTime? travelDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'passengerId': passengerId,
      'isAccepted': isAccepted,
      'travelDate': travelDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class TravelRequestsRecordDocumentEquality
    implements Equality<TravelRequestsRecord> {
  const TravelRequestsRecordDocumentEquality();

  @override
  bool equals(TravelRequestsRecord? e1, TravelRequestsRecord? e2) {
    return e1?.passengerId == e2?.passengerId &&
        e1?.isAccepted == e2?.isAccepted &&
        e1?.travelDate == e2?.travelDate;
  }

  @override
  int hash(TravelRequestsRecord? e) =>
      const ListEquality().hash([e?.passengerId, e?.isAccepted, e?.travelDate]);

  @override
  bool isValidKey(Object? o) => o is TravelRequestsRecord;
}
