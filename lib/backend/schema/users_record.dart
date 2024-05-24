import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "globalRating" field.
  double? _globalRating;
  double get globalRating => _globalRating ?? 0.0;
  bool hasGlobalRating() => _globalRating != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  bool hasPoints() => _points != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "zone" field.
  String? _zone;
  String get zone => _zone ?? '';
  bool hasZone() => _zone != null;

  // "driverInfo_carBrand" field.
  String? _driverInfoCarBrand;
  String get driverInfoCarBrand => _driverInfoCarBrand ?? '';
  bool hasDriverInfoCarBrand() => _driverInfoCarBrand != null;

  // "driverInfo_carModel" field.
  String? _driverInfoCarModel;
  String get driverInfoCarModel => _driverInfoCarModel ?? '';
  bool hasDriverInfoCarModel() => _driverInfoCarModel != null;

  // "driverInfo_carPhoto" field.
  String? _driverInfoCarPhoto;
  String get driverInfoCarPhoto => _driverInfoCarPhoto ?? '';
  bool hasDriverInfoCarPhoto() => _driverInfoCarPhoto != null;

  // "driverInfo_carPlate" field.
  String? _driverInfoCarPlate;
  String get driverInfoCarPlate => _driverInfoCarPlate ?? '';
  bool hasDriverInfoCarPlate() => _driverInfoCarPlate != null;

  // "driverInfo_isApproved" field.
  bool? _driverInfoIsApproved;
  bool get driverInfoIsApproved => _driverInfoIsApproved ?? false;
  bool hasDriverInfoIsApproved() => _driverInfoIsApproved != null;

  // "driverInfo_licensePhoto" field.
  String? _driverInfoLicensePhoto;
  String get driverInfoLicensePhoto => _driverInfoLicensePhoto ?? '';
  bool hasDriverInfoLicensePhoto() => _driverInfoLicensePhoto != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "email_utad" field.
  String? _emailUtad;
  String get emailUtad => _emailUtad ?? '';
  bool hasEmailUtad() => _emailUtad != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _globalRating = castToType<double>(snapshotData['globalRating']);
    _location = snapshotData['location'] as LatLng?;
    _points = castToType<int>(snapshotData['points']);
    _role = snapshotData['role'] as String?;
    _zone = snapshotData['zone'] as String?;
    _driverInfoCarBrand = snapshotData['driverInfo_carBrand'] as String?;
    _driverInfoCarModel = snapshotData['driverInfo_carModel'] as String?;
    _driverInfoCarPhoto = snapshotData['driverInfo_carPhoto'] as String?;
    _driverInfoCarPlate = snapshotData['driverInfo_carPlate'] as String?;
    _driverInfoIsApproved = snapshotData['driverInfo_isApproved'] as bool?;
    _driverInfoLicensePhoto =
        snapshotData['driverInfo_licensePhoto'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _emailUtad = snapshotData['email_utad'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? photoUrl,
  double? globalRating,
  LatLng? location,
  int? points,
  String? role,
  String? zone,
  String? driverInfoCarBrand,
  String? driverInfoCarModel,
  String? driverInfoCarPhoto,
  String? driverInfoCarPlate,
  bool? driverInfoIsApproved,
  String? driverInfoLicensePhoto,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? emailUtad,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'globalRating': globalRating,
      'location': location,
      'points': points,
      'role': role,
      'zone': zone,
      'driverInfo_carBrand': driverInfoCarBrand,
      'driverInfo_carModel': driverInfoCarModel,
      'driverInfo_carPhoto': driverInfoCarPhoto,
      'driverInfo_carPlate': driverInfoCarPlate,
      'driverInfo_isApproved': driverInfoIsApproved,
      'driverInfo_licensePhoto': driverInfoLicensePhoto,
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'email_utad': emailUtad,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.globalRating == e2?.globalRating &&
        e1?.location == e2?.location &&
        e1?.points == e2?.points &&
        e1?.role == e2?.role &&
        e1?.zone == e2?.zone &&
        e1?.driverInfoCarBrand == e2?.driverInfoCarBrand &&
        e1?.driverInfoCarModel == e2?.driverInfoCarModel &&
        e1?.driverInfoCarPhoto == e2?.driverInfoCarPhoto &&
        e1?.driverInfoCarPlate == e2?.driverInfoCarPlate &&
        e1?.driverInfoIsApproved == e2?.driverInfoIsApproved &&
        e1?.driverInfoLicensePhoto == e2?.driverInfoLicensePhoto &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.emailUtad == e2?.emailUtad;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.globalRating,
        e?.location,
        e?.points,
        e?.role,
        e?.zone,
        e?.driverInfoCarBrand,
        e?.driverInfoCarModel,
        e?.driverInfoCarPhoto,
        e?.driverInfoCarPlate,
        e?.driverInfoIsApproved,
        e?.driverInfoLicensePhoto,
        e?.displayName,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.emailUtad
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
