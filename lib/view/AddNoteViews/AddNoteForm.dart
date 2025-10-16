import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:new_notes_app/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:new_notes_app/model/note_model.dart';
import 'package:new_notes_app/widget/CustomTextFields&Butttong/ButtonWidget.dart';
import 'package:new_notes_app/widget/CustomTextFields&Butttong/CustomTextfield.dart';

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
          BlocBuilder<AddNotesCubit, AddNotesState>(
            builder: (context, state) {
              return CustomButtonWidget(
                isLoading: state is AddNotesLoading ? true : false,
                text: "Add Note",
                color: Color(0xffB12E65),
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formatedDate = DateFormat(
                      'dd/mm/yyyy',
                    ).format(currentDate);
                    var noteModel = NoteModel(
                      title: title!,
                      subtitle: subtitle!,
                      date: formatedDate,
                      color: Color(0xffB12E65).value,
                    );
                    BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
                    print("title $title");
                    print("subtitle $subtitle");
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
