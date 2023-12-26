import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<DocumentReference> _events = [];
  List<DocumentReference> get events => _events;
  set events(List<DocumentReference> value) {
    _events = value;
  }

  void addToEvents(DocumentReference value) {
    _events.add(value);
  }

  void removeFromEvents(DocumentReference value) {
    _events.remove(value);
  }

  void removeAtIndexFromEvents(int index) {
    _events.removeAt(index);
  }

  void updateEventsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _events[index] = updateFn(_events[index]);
  }

  void insertAtIndexInEvents(int index, DocumentReference value) {
    _events.insert(index, value);
  }

  final _eventQueryManager = FutureRequestManager<List<EventsRecord>>();
  Future<List<EventsRecord>> eventQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<EventsRecord>> Function() requestFn,
  }) =>
      _eventQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearEventQueryCache() => _eventQueryManager.clear();
  void clearEventQueryCacheKey(String? uniqueKey) =>
      _eventQueryManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
