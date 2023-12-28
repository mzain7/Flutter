// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreService {
//   final CollectionReference notes =
//       FirebaseFirestore.instance.collection('notes');

//   Future<void> addNote(String note) {
//     return notes.add({
//       'note': note,
//       'created': Timestamp.now(),
//       'updated': Timestamp.now(),
//     });
//   }

//   Stream<QuerySnapshot> getNotes() {
//     return notes.orderBy('created', descending: true).snapshots();
//   }

//   Future<void> updateNote(
//     String id,
//     String note,
//   ) {
//     return notes.doc(id).update({
//       'note': note,
//       'updated': Timestamp.now(),
//     });
//   }

//   Future<void> deleteNote(
//     String id,
//   ) {
//     return notes.doc(id).delete();
//   }
// }


import 'package:crud/model/note.dart';
import 'package:firebase_database/firebase_database.dart';

class NoteDatabaseHelper {
  final DatabaseReference _notesRef =
      FirebaseDatabase.instance.ref().child('notes');

  Future<void> addNote(Note note) async {
    await _notesRef.push().set(note.toJson());
  }

  Future<void> updateNote(Note note) async {
    await _notesRef.child(note.key).set(note.toJson());
  }

  Future<void> deleteNote(String key) async {
    await _notesRef.child(key).remove();
  }

  Stream<DatabaseEvent> getNotes() {
    return _notesRef.onValue;
  }
}
