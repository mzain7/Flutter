import 'package:crud/model/note.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud/services/firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final TextEditingController _noteController = TextEditingController();
  final NoteDatabaseHelper databaseHelper = NoteDatabaseHelper();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  // final FirestoreService _firestoreService = FirestoreService();

  void openDialogBox({String? docId}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              title: docId == null
                  ? const Text('Add note')
                  : const Text('Edit note'),
              content: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                    ),
                  ),
                  TextField(
                    controller: contentController,
                    minLines: 2,
                    maxLines: 8, //or null
                    decoration: const InputDecoration.collapsed(
                        hintText: "Enter your text here"),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      if (docId != null) {
                        // _firestoreService.updateNote(
                        //   docId,
                        //   _noteController.text,
                        // );
                        databaseHelper.updateNote(
                          Note(
                            docId,
                            titleController.text.trim(),
                            contentController.text.trim(),
                          ),
                        );
                      } else {
                        // _firestoreService.addNote(
                        //   _noteController.text,
                        // );
                        databaseHelper.addNote(
                          Note(
                            '',
                            titleController.text.trim(),
                            contentController.text.trim(),
                          ),
                        );
                      }
                      // _noteController.clear();

                      titleController.clear();
                      contentController.clear();

                      Navigator.pop(context);
                    },
                    child: docId == null
                        ? const Text('Add')
                        : const Text('Update')),
                ElevatedButton(
                    onPressed: () {
                      // _noteController.clear();

                      titleController.clear();
                      contentController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Notepad')),
          // elevation: 0,
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.add),
          //     onPressed: () {
          //       openDialogBox();
          //     },
          //   )
          // ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            openDialogBox();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: StreamBuilder(
              stream: databaseHelper.getNotes(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Note> notes = [];
                  Map<String, dynamic> notesMap = snapshot.data!.snapshot.value as Map<String, dynamic>;

                  notesMap.forEach((key, value) {
                    notes.add(Note.fromSnapshot(DataSnapshot(key, value)));
                  });
                
                  return ListView.builder(
                      itemBuilder: (context, index) {
                        // get individual note
                        DocumentSnapshot note = notes[index];
                        String docId = note.id;

                        Map<String, dynamic> noteData =
                            note.data() as Map<String, dynamic>;
                        String noteContent = noteData['note'];

                        return Container(
                          height: 70.0, // Adjust the height as needed
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.1), // Reduced shadow opacity
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  noteContent,
                                  style: const TextStyle(
                                    fontSize: 18.0, // Increased text size
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                  width:
                                      16.0), // Add some spacing between icons
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  _noteController.text = noteContent;
                                  openDialogBox(docId: docId);
                                },
                                color:
                                    Colors.grey, // Set button color to purple
                              ),
                              const SizedBox(
                                  width: 8.0), // Adjust the gap between icons
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  _firestoreService.deleteNote(docId);
                                },
                                color:
                                    Colors.grey, // Set button color to purple
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: notes.length);
                }

                if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong'));
                }

                return const Center(child: CircularProgressIndicator());
              }),
        ));
  }
}
