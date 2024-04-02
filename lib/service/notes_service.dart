import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/model/notes_model.dart';

class NotesService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference<NotesModel> collectionReference;

  NotesService() {
    collectionReference =
        firebaseFirestore.collection('Notes').withConverter<NotesModel>(
      fromFirestore: (snapshot, options) {
        return NotesModel.fromJson(snapshot.id, snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  addNotes(NotesModel note) async {
    try {
      await collectionReference.add(note);

      log('Notes added');
    } catch (e) {
      rethrow;
    }
  }

  editNotes(String id, NotesModel note) async {
    try {
      await collectionReference.doc(id).update(note.toJson());
      log('Notes updated');
    } catch (e) {
      rethrow;
    }
  }

  deleteNotes(String id) async {
    try {
      await collectionReference.doc(id).delete();
      log('Notes deleted');
    } catch (e) {
      rethrow;
    }
  }

  getAllNotes() async {
    try {
      final data = await collectionReference.get();
      return data.docs.map((e) => e.data()).toList();
    } catch (e) {
      log("$e");
    }
  }
}
