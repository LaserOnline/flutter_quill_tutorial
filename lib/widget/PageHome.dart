import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHome();
}

class _PageHome extends State<PageHome> {
  final _controller = quill.QuillController.basic();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Quill Editor",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          quill.QuillToolbar.basic(
            controller: _controller,
            toolbarIconSize: 30,
            iconTheme: const quill.QuillIconTheme(
              borderRadius: 16,
              iconSelectedFillColor: Colors.black87,
              iconSelectedColor: Colors.red,
            ),
            customButtons: [
              quill.QuillCustomButton(
                  icon: Icons.add, onTap: () => print("Add")),
              quill.QuillCustomButton(
                  icon: Icons.delete, onTap: () => print("Delete")),
            ],
            // multiRowsDisplay: false,
          ),
          Expanded(
            child: Container(
              color: Colors.grey[300],
              padding: const EdgeInsets.all(16),
              child: quill.QuillEditor.basic(
                  controller: _controller, readOnly: false),
            ),
          )
        ],
      ),
    );
  }
}
