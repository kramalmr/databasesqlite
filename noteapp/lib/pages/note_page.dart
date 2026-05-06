import 'package:flutter/material.dart';
import '../models/note_model.dart';

class NotePage extends StatefulWidget {
  final Note? note;

  const NotePage({super.key, required this.note});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final authorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      contentController.text = widget.note!.content;
      authorController.text = widget.note!.author;
    }
  }

  void saveNote() {
    final note = Note(
      title: titleController.text,
      content: contentController.text,
      author: authorController.text,
    );
    Navigator.pop(context, note);
  }

  void deleteNote() async {
    final confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Konfirmasi"),
        content: Text("Yakin ingin menghapus?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("Batal"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text("Hapus"),
          ),
        ],
      ),
    );
    if (confirm) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context, "delete");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: saveNote,
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: deleteNote,
            icon: const Icon(Icons.delete_outline_outlined),
          ),
        ],
      ),
    );
  }
}
