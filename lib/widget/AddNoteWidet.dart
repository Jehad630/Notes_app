import 'package:flutter/material.dart';
import 'package:new_notes_app/widget/ButtonWidget.dart';
import 'package:new_notes_app/widget/TextField.dart';

class AddNoteWidet extends StatelessWidget {
  const AddNoteWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Note",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            CustomTextfield(hint: "title", obscureText: false),
            CustomTextfield(hint: "content", obscureText: false, maxLines: 5),
            SizedBox(height: 120),
            ButtonWidget(text: "Add Note", color: Color(0xffB12E65)),
          ],
        ),
      ),
    );
  }
}
