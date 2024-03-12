import 'package:flutter/material.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      home: NoteListScreen(),
    );
  }
}

class NoteListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Notes"), backgroundColor: Colors.blue[100]),
        body: NoteList(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue[100],
            onPressed: () {},
            child: Icon(Icons.add)));
  }
}

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(title: Text('Note $index'), onTap: () {});
      },
    );
  }
}
