import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/controller/auth_controller.dart';
import 'package:notes_app/controller/database_controller.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:provider/provider.dart';

class EditNotes extends StatefulWidget {
  final NotesModel note;
  EditNotes({required this.note, super.key});

  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  TextEditingController titleController = TextEditingController();

  TextEditingController notesController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    titleController.text = widget.note.title;
    notesController.text = widget.note.notes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final getPrvdr = Provider.of<DatabaseController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Update notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    TextField(
                      controller: titleController,
                      // minLines: 5,
                      decoration: InputDecoration(
                          hintText: 'Title',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: notesController,
                      // minLines: 5,
                      decoration: InputDecoration(
                          hintText: 'Notes',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  const Color.fromARGB(255, 0, 67, 121))),
                          onPressed: () async {
                            final notes = NotesModel(
                                title: titleController.text,
                                notes: notesController.text);
                            await getPrvdr.editNotes(widget.note.id!, notes);
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Update Notes',
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
