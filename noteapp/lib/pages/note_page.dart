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

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      contentController.text = widget.note!.content;
      authorController.text = widget.note!.author;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    authorController.dispose();
    super.dispose();
  }

  void saveNote() {
    if (_isSaving) return;
    _isSaving = true;

    if (!mounted) return;

    if (titleController.text.trim().isEmpty &&
        contentController.text.trim().isEmpty) {
      Navigator.pop(context);
      return;
    }

    final now = DateTime.now().toIso8601String();

    final note = Note(
      id: widget.note?.id,
      title: titleController.text,
      content: contentController.text,
      author: authorController.text,
      createdAt: widget.note?.createdAt ?? now,
      updatedAt: now,
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

    if (!mounted) return;

    if (confirm == true) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context, "delete");
    }
  }

  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop || _isSaving) return;

        _isSaving = true;

        final navigator = Navigator.of(context);

        saveNote();

        navigator.pop();
      },
      child: Scaffold(
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

        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: titleController,
                autofocus: true,
                style: Theme.of(context).textTheme.titleLarge,
                decoration: InputDecoration(
                  hintText: "Judul",
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 10),

              Expanded(
                child: TextField(
                  controller: contentController,
                  keyboardType: TextInputType.multiline,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    hintText: "Tulis catatan...",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Divider(
                color: Theme.of(context).dividerColor.withValues(alpha: 0.3),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: authorController,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                  hintText: "Ditulis oleh...",
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
