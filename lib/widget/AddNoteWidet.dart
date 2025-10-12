import 'package:flutter/material.dart';
import 'package:new_notes_app/widget/ButtonWidget.dart';
import 'package:new_notes_app/widget/CustomTextfield.dart';

class AddNoteWidet extends StatelessWidget {
  const AddNoteWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SingleChildScrollView(child: AddNoteForm()),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          Text(
            "Note",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          CustomTextfield(
            hint: "title",
            onSaved: (value) {
              title = value;
            },
          ),
          CustomTextfield(
            hint: "content",
            maxLines: 5,
            onSaved: (value) {
              subtitle = value;
            },
          ),
          SizedBox(height: 120),
          ButtonWidget(
            text: "Add Note",
            color: Color(0xffB12E65),
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                print("title $title");
                print("subtitle $subtitle");
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
