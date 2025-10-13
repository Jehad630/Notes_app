import 'package:flutter/material.dart';
import 'package:new_notes_app/view/EditNotesView/EditNoteView.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteView();
        }));
      },
      child: Container(
        padding: EdgeInsets.only(top: 24, bottom: 24),
        decoration: BoxDecoration(
          color: Color(0xffFFCA42),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                "Flutter Tips",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16.0,bottom: 16),
                child: Text(
                  "Build your career with Flutter",
                  style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 18),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete, color: Colors.black,size: 32,),
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                "October 11 ,2025",
                style: TextStyle(color: Colors.black.withOpacity(0.8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
