import 'package:flutter/material.dart';
import 'note_page.dart';
import '../models/note_model.dart';
import '../theme/app_theme.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const HomePage({super.key, required this.onToggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = [];
  // crud

  // add
  void addNote(Note note) {
    setState(() {
      notes.add(note);
    });
  }

  // update
  void updateNote(int index, Note note) {
    setState(() {
      notes[index] = note;
    });
  }

  // delete
  // void deleteNote(int index) async {
  //   bool confirm = await showConfirmDialog(context);
  //   if (confirm) {
  //     setState(() {
  //       notes.removeAt(index);
  //     });
  //   }
  // }

  // // navigation'

  // void goToNotePage({Note? note, int? index}) async {
  //   final result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (_) => NotePage(note: note)),
  //   );

  //   // handle result

  //   if (result == "delete" %% index != null) {
  //     deleteNote(index);
  //   } else if (result != null && index != null) {
  //     updateNote(index, result);
  //   } else if (result != null) {
  //     addNote(result);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notes"),
        actions: [
          IconButton(
            onPressed: widget.onToggleTheme,
            icon: const Icon(Icons.dark_mode),
          ),
        ],
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
