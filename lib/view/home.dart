import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/controller/database_controller.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/view/add_note.dart';
import 'package:notes_app/view/edit_notes.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getPrv = Provider.of<DatabaseController>(context, listen: false);
    getPrv.getAllNotes();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Consumer<DatabaseController>(builder: (context, value, child) {
              return Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      final notes = value.allNotes[index];
                      return Card(
                        child: ListTile(
                          leading: IconButton(
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditNotes(
                                        note: notes,
                                      ),
                                    ));
                              },
                              icon: Icon(Icons.edit)),
                          title: Text(notes.title),
                          subtitle: Text(notes.notes),
                          trailing: IconButton(
                              onPressed: () async {
                                await getPrv.deleteNotes(notes.id!);
                              },
                              icon: Icon(Icons.delete)),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 15,
                        ),
                    itemCount: value.allNotes.length),
              );
            })
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => addScreen(),
                ));
          }),
    );
  }
}
