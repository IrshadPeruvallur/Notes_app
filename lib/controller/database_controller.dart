import 'package:flutter/material.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/service/notes_service.dart';

class DatabaseController extends ChangeNotifier {
  final NotesService notesService = NotesService();
  List<NotesModel> allNotes = [];
  addNotes(NotesModel note) async {
    await notesService.addNotes(note);
    getAllNotes();
  }

  editNotes(String id, NotesModel note) async {
    await notesService.editNotes(id, note);
    getAllNotes();
  }

  deleteNotes(String id) async {
    await notesService.deleteNotes(id);
    getAllNotes();
  }

  getAllNotes() async {
    allNotes = await notesService.getAllNotes();
    notifyListeners();
  }
}
