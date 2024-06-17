import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RewardStoreRecord extends FirestoreRecord {
  RewardStoreRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "pointsCost" field.
  int? _pointsCost;
  int get pointsCost => _pointsCost ?? 0;
  bool hasPointsCost() => _pointsCost != null;

  // "quantityAvailable" field.
  int? _quantityAvailable;
  int get quantityAvailable => _quantityAvailable ?? 0;
  bool hasQuantityAvailable() => _quantityAvailable != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "quantityTotal" field.
  int? _quantityTotal;
  int get quantityTotal => _quantityTotal ?? 0;
  bool hasQuantityTotal() => _quantityTotal != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _name = snapshotData['name'] as String?;
    _pointsCost = castToType<int>(snapshotData['pointsCost']);
    _quantityAvailable = castToType<int>(snapshotData['quantityAvailable']);
    _isActive = snapshotData['isActive'] as bool?;
    _quantityTotal = castToType<int>(snapshotData['quantityTotal']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rewardStore');

  static Stream<RewardStoreRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RewardStoreRecord.fromSnapshot(s));

  static Future<RewardStoreRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RewardStoreRecord.fromSnapshot(s));

  static RewardStoreRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RewardStoreRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RewardStoreRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RewardStoreRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RewardStoreRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RewardStoreRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRewardStoreRecordData({
  String? description,
  String? image,
  String? name,
  int? pointsCost,
  int? quantityAvailable,
  bool? isActive,
  int? quantityTotal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'image': image,
      'name': name,
      'pointsCost': pointsCost,
      'quantityAvailable': quantityAvailable,
      'isActive': isActive,
      'quantityTotal': quantityTotal,
    }.withoutNulls,
  );

  return firestoreData;
}

class RewardStoreRecordDocumentEquality implements Equality<RewardStoreRecord> {
  const RewardStoreRecordDocumentEquality();

  @override
  bool equals(RewardStoreRecord? e1, RewardStoreRecord? e2) {
    return e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.name == e2?.name &&
        e1?.pointsCost == e2?.pointsCost &&
        e1?.quantityAvailable == e2?.quantityAvailable &&
        e1?.isActive == e2?.isActive &&
        e1?.quantityTotal == e2?.quantityTotal;
  }

  @override
  int hash(RewardStoreRecord? e) => const ListEquality().hash([
        e?.description,
        e?.image,
        e?.name,
        e?.pointsCost,
        e?.quantityAvailable,
        e?.isActive,
        e?.quantityTotal
      ]);

  @override
  bool isValidKey(Object? o) => o is RewardStoreRecord;
}
