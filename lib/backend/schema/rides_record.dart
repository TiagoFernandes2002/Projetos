import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RidesRecord extends FirestoreRecord {
  RidesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "driverId" field.
  DocumentReference? _driverId;
  DocumentReference? get driverId => _driverId;
  bool hasDriverId() => _driverId != null;

  // "isStarted" field.
  bool? _isStarted;
  bool get isStarted => _isStarted ?? false;
  bool hasIsStarted() => _isStarted != null;

  // "passengers" field.
  List<DocumentReference>? _passengers;
  List<DocumentReference> get passengers => _passengers ?? const [];
  bool hasPassengers() => _passengers != null;

  // "travelDate" field.
  DateTime? _travelDate;
  DateTime? get travelDate => _travelDate;
  bool hasTravelDate() => _travelDate != null;

  // "allUsers" field.
  List<DocumentReference>? _allUsers;
  List<DocumentReference> get allUsers => _allUsers ?? const [];
  bool hasAllUsers() => _allUsers != null;

  void _initializeFields() {
    _driverId = snapshotData['driverId'] as DocumentReference?;
    _isStarted = snapshotData['isStarted'] as bool?;
    _passengers = getDataList(snapshotData['passengers']);
    _travelDate = snapshotData['travelDate'] as DateTime?;
    _allUsers = getDataList(snapshotData['allUsers']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rides');

  static Stream<RidesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RidesRecord.fromSnapshot(s));

  static Future<RidesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RidesRecord.fromSnapshot(s));

  static RidesRecord fromSnapshot(DocumentSnapshot snapshot) => RidesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RidesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RidesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RidesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RidesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRidesRecordData({
  DocumentReference? driverId,
  bool? isStarted,
  DateTime? travelDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'driverId': driverId,
      'isStarted': isStarted,
      'travelDate': travelDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class RidesRecordDocumentEquality implements Equality<RidesRecord> {
  const RidesRecordDocumentEquality();

  @override
  bool equals(RidesRecord? e1, RidesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.driverId == e2?.driverId &&
        e1?.isStarted == e2?.isStarted &&
        listEquality.equals(e1?.passengers, e2?.passengers) &&
        e1?.travelDate == e2?.travelDate &&
        listEquality.equals(e1?.allUsers, e2?.allUsers);
  }

  @override
  int hash(RidesRecord? e) => const ListEquality().hash(
      [e?.driverId, e?.isStarted, e?.passengers, e?.travelDate, e?.allUsers]);

  @override
  bool isValidKey(Object? o) => o is RidesRecord;
}
