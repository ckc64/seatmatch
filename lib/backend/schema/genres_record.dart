import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class GenresRecord extends FirestoreRecord {
  GenresRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "param" field.
  String? _param;
  String get param => _param ?? '';
  bool hasParam() => _param != null;

  // "ticketmasterID" field.
  String? _ticketmasterID;
  String get ticketmasterID => _ticketmasterID ?? '';
  bool hasTicketmasterID() => _ticketmasterID != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _param = snapshotData['param'] as String?;
    _ticketmasterID = snapshotData['ticketmasterID'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('genres');

  static Stream<GenresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GenresRecord.fromSnapshot(s));

  static Future<GenresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GenresRecord.fromSnapshot(s));

  static GenresRecord fromSnapshot(DocumentSnapshot snapshot) => GenresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GenresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GenresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GenresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GenresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGenresRecordData({
  String? name,
  bool? isActive,
  String? param,
  String? ticketmasterID,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'isActive': isActive,
      'param': param,
      'ticketmasterID': ticketmasterID,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class GenresRecordDocumentEquality implements Equality<GenresRecord> {
  const GenresRecordDocumentEquality();

  @override
  bool equals(GenresRecord? e1, GenresRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.isActive == e2?.isActive &&
        e1?.param == e2?.param &&
        e1?.ticketmasterID == e2?.ticketmasterID &&
        e1?.image == e2?.image;
  }

  @override
  int hash(GenresRecord? e) => const ListEquality()
      .hash([e?.name, e?.isActive, e?.param, e?.ticketmasterID, e?.image]);

  @override
  bool isValidKey(Object? o) => o is GenresRecord;
}
