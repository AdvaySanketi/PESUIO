import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      debugShowCheckedModeBanner: false,
      home: NoteListScreen(),
    );
  }
}

class NoteListScreen extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteListScreen> {
  List<String> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        backgroundColor: Colors.blue[100],
      ),
      body: Container(
          child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(color: Colors.blue[100 * index]),
                    child: ListTile(title: Center(child: Text(notes[index]))));
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddNoteScreen(
                  onNoteAdded: (note) {
                    setState(() {
                      notes.add(note);
                    });
                  },
                );
              });
        },
        backgroundColor: Colors.blue[100],
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddNoteScreen extends StatelessWidget {
  final Function(String) onNoteAdded;

  const AddNoteScreen({Key? key, required this.onNoteAdded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    double dialogHeight = isLandscape ? screenHeight * 0.7 : screenHeight * 0.3;

    String note = '';

    return Dialog(
        child: SizedBox(
            width: screenWidth * 0.8,
            height: dialogHeight,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                child: Scaffold(
                    appBar: AppBar(title: Text("Add Note")),
                    body: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              decoration:
                                  InputDecoration(labelText: 'Enter Note'),
                              onChanged: (value) {
                                note = value;
                              },
                            ),
                            MaterialButton(
                                color: Colors.blue[100],
                                child: Text('Save'),
                                onPressed: () {
                                  onNoteAdded(note);
                                  Navigator.pop(context);
                                })
                          ],
                        ))))));
  }
}
