import 'package:flutter/material.dart';
import 'package:midterm/models/mock_data.dart';
import 'note_screen.dart';
import '../models/note.dart';

class ListScreen extends StatefulWidget {
  final List<Note> Notes;
  ListScreen(this.Notes);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  var descCheck = true;
  List<bool> buttonsCheck = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes'),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade200,
            child: Text(
              widget.Notes.length.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: widget.Notes.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.blueGrey,
        ),
        itemBuilder: (context, index) => ListTile(
          trailing: SizedBox(
            width: 110.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: buttonsCheck[index]
                  ? [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.Notes.removeAt(index);
                            buttonsCheck.removeAt(index);
                          });
                        },
                      ),
                    ]
                  : [],
            ),
          ),
          title: Text(widget.Notes[index].title),
          subtitle: descCheck ? Text(widget.Notes[index].description) : null,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NoteScreen(
                  currentNote: widget.Notes.elementAt(index), chosen: "view");
            }));
          },
          onLongPress: () {
            setState(() {
              buttonsCheck[index] = !buttonsCheck[index];
            });
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: descCheck
                  ? Icon(Icons.unfold_less)
                  : Icon(Icons.format_align_justify),
              tooltip: 'Show less. Hide notes content',
              onPressed: () {
                setState(() {
                  descCheck = !descCheck;
                });
              }),
          FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: 'Add a new note',
            onPressed: () {
              setState(() {
                widget.Notes.add(Note("new Note", "new note content"));
                buttonsCheck.add(false);
              });
            },
          ),
        ],
      ),
    );
  }
}
