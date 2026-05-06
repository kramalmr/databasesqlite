import 'package:flutter/material.dart';

Future<bool> showConfirmDialog(BuildContext context) async {
  return await showDialog(
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
      ) ??
      false;
}
