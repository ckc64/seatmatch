// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsStruct extends FFFirebaseStruct {
  EventsStruct({
    DateTime? dateCreated,
    String? eventID,
    List<DocumentReference>? interested,
    List<String>? eventNum,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dateCreated = dateCreated,
        _eventID = eventID,
        _interested = interested,
        _eventNum = eventNum,
        super(firestoreUtilData);

  // "dateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  set dateCreated(DateTime? val) => _dateCreated = val;
  bool hasDateCreated() => _dateCreated != null;

  // "eventID" field.
  String? _eventID;
  String get eventID => _eventID ?? '';
  set eventID(String? val) => _eventID = val;
  bool hasEventID() => _eventID != null;

  // "interested" field.
  List<DocumentReference>? _interested;
  List<DocumentReference> get interested => _interested ?? const [];
  set interested(List<DocumentReference>? val) => _interested = val;
  void updateInterested(Function(List<DocumentReference>) updateFn) =>
      updateFn(_interested ??= []);
  bool hasInterested() => _interested != null;

  // "eventNum" field.
  List<String>? _eventNum;
  List<String> get eventNum => _eventNum ?? const [];
  set eventNum(List<String>? val) => _eventNum = val;
  void updateEventNum(Function(List<String>) updateFn) =>
      updateFn(_eventNum ??= []);
  bool hasEventNum() => _eventNum != null;

  static EventsStruct fromMap(Map<String, dynamic> data) => EventsStruct(
        dateCreated: data['dateCreated'] as DateTime?,
        eventID: data['eventID'] as String?,
        interested: getDataList(data['interested']),
        eventNum: getDataList(data['eventNum']),
      );

  static EventsStruct? maybeFromMap(dynamic data) =>
      data is Map ? EventsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'dateCreated': _dateCreated,
        'eventID': _eventID,
        'interested': _interested,
        'eventNum': _eventNum,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dateCreated': serializeParam(
          _dateCreated,
          ParamType.DateTime,
        ),
        'eventID': serializeParam(
          _eventID,
          ParamType.String,
        ),
        'interested': serializeParam(
          _interested,
          ParamType.DocumentReference,
          true,
        ),
        'eventNum': serializeParam(
          _eventNum,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static EventsStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventsStruct(
        dateCreated: deserializeParam(
          data['dateCreated'],
          ParamType.DateTime,
          false,
        ),
        eventID: deserializeParam(
          data['eventID'],
          ParamType.String,
          false,
        ),
        interested: deserializeParam<DocumentReference>(
          data['interested'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['users'],
        ),
        eventNum: deserializeParam<String>(
          data['eventNum'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'EventsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EventsStruct &&
        dateCreated == other.dateCreated &&
        eventID == other.eventID &&
        listEquality.equals(interested, other.interested) &&
        listEquality.equals(eventNum, other.eventNum);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([dateCreated, eventID, interested, eventNum]);
}

EventsStruct createEventsStruct({
  DateTime? dateCreated,
  String? eventID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventsStruct(
      dateCreated: dateCreated,
      eventID: eventID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EventsStruct? updateEventsStruct(
  EventsStruct? events, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    events
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEventsStructData(
  Map<String, dynamic> firestoreData,
  EventsStruct? events,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (events == null) {
    return;
  }
  if (events.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && events.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eventsData = getEventsFirestoreData(events, forFieldValue);
  final nestedData = eventsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = events.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEventsFirestoreData(
  EventsStruct? events, [
  bool forFieldValue = false,
]) {
  if (events == null) {
    return {};
  }
  final firestoreData = mapToFirestore(events.toMap());

  // Add any Firestore field values
  events.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEventsListFirestoreData(
  List<EventsStruct>? eventss,
) =>
    eventss?.map((e) => getEventsFirestoreData(e, true)).toList() ?? [];
