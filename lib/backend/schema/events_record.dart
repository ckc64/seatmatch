import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "eventID" field.
  String? _eventID;
  String get eventID => _eventID ?? '';
  bool hasEventID() => _eventID != null;

  // "interested" field.
  List<DocumentReference>? _interested;
  List<DocumentReference> get interested => _interested ?? const [];
  bool hasInterested() => _interested != null;

  // "dateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "eventNum" field.
  List<String>? _eventNum;
  List<String> get eventNum => _eventNum ?? const [];
  bool hasEventNum() => _eventNum != null;

  void _initializeFields() {
    _eventID = snapshotData['eventID'] as String?;
    _interested = getDataList(snapshotData['interested']);
    _dateCreated = snapshotData['dateCreated'] as DateTime?;
    _eventNum = getDataList(snapshotData['eventNum']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? eventID,
  DateTime? dateCreated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eventID': eventID,
      'dateCreated': dateCreated,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.eventID == e2?.eventID &&
        listEquality.equals(e1?.interested, e2?.interested) &&
        e1?.dateCreated == e2?.dateCreated &&
        listEquality.equals(e1?.eventNum, e2?.eventNum);
  }

  @override
  int hash(EventsRecord? e) => const ListEquality()
      .hash([e?.eventID, e?.interested, e?.dateCreated, e?.eventNum]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
