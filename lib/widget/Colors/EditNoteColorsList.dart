import 'package:flutter/material.dart';
import 'package:new_notes_app/model/note_model.dart';
import 'package:new_notes_app/services/constants.dart';
import 'package:new_notes_app/widget/Colors/Colors_ListView.dart';

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.note});

  final NoteModel note;
  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kcolors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kcolors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = kcolors[index].value;

                setState(() {});
              },
              child: ColorItem(
                isSelected: currentIndex == index,
                color: kcolors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
