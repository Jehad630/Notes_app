import 'package:flutter/material.dart';
import 'package:new_notes_app/widget/TextField.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.check,size: 32,))
        ],
      ),
      body: Column(children: [
        CustomTextfield(hint: "title", obscureText: false),
        CustomTextfield(hint: "content", obscureText: false, maxLines: 5),
      ],),
    );
  }
}