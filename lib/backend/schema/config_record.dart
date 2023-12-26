import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ConfigRecord extends FirestoreRecord {
  ConfigRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "endDateTime" field.
  DateTime? _endDateTime;
  DateTime? get endDateTime => _endDateTime;
  bool hasEndDateTime() => _endDateTime != null;

  // "useCurrentLocation" field.
  bool? _useCurrentLocation;
  bool get useCurrentLocation => _useCurrentLocation ?? false;
  bool hasUseCurrentLocation() => _useCurrentLocation != null;

  void _initializeFields() {
    _endDateTime = snapshotData['endDateTime'] as DateTime?;
    _useCurrentLocation = snapshotData['useCurrentLocation'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('config');

  static Stream<ConfigRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfigRecord.fromSnapshot(s));

  static Future<ConfigRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConfigRecord.fromSnapshot(s));

  static ConfigRecord fromSnapshot(DocumentSnapshot snapshot) => ConfigRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfigRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfigRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfigRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfigRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfigRecordData({
  DateTime? endDateTime,
  bool? useCurrentLocation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'endDateTime': endDateTime,
      'useCurrentLocation': useCurrentLocation,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfigRecordDocumentEquality implements Equality<ConfigRecord> {
  const ConfigRecordDocumentEquality();

  @override
  bool equals(ConfigRecord? e1, ConfigRecord? e2) {
    return e1?.endDateTime == e2?.endDateTime &&
        e1?.useCurrentLocation == e2?.useCurrentLocation;
  }

  @override
  int hash(ConfigRecord? e) =>
      const ListEquality().hash([e?.endDateTime, e?.useCurrentLocation]);

  @override
  bool isValidKey(Object? o) => o is ConfigRecord;
}
