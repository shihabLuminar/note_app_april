import 'package:flutter/material.dart';
import 'package:note_app_april/dummy_db.dart';
import 'package:note_app_april/view/notes_screen/widget/note_card.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.grey.shade300,
            onPressed: () {
              titleController.clear();
              descController.clear();
              dateController.clear();
              _customBottomSheet(context);
            },
            child: Icon(Icons.add),
          ),
          body: ListView.separated(
              padding: EdgeInsets.all(15),
              itemBuilder: (context, index) => NoteCard(
                    date: DummyDb.notesList[index]["date"],
                    desc: DummyDb.notesList[index]["desc"],
                    title: DummyDb.notesList[index]["title"],
                    onDelete: () {
                      DummyDb.notesList.removeAt(index);
                      setState(() {});
                    },
                    onEdit: () {
                      titleController.text = DummyDb.notesList[index]["title"];
                      dateController.text = DummyDb.notesList[index]["date"];
                      descController.text = DummyDb.notesList[index]["desc"];
                      // titleController = TextEditingController(
                      //     text: DummyDb.notesList[index]["title"]);
                      _customBottomSheet(context,
                          isEdit: true, itemIndex: index);
                    },
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemCount: DummyDb.notesList.length)),
    );
  }

  Future<dynamic> _customBottomSheet(BuildContext context,
      {bool isEdit = false, int? itemIndex}) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => Padding(
              padding: const EdgeInsets.all(20),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                          hintText: "Title",
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: descController,
                      maxLines: 5,
                      decoration: InputDecoration(
                          hintText: "Description",
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                          hintText: "Date",
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              isEdit
                                  ? DummyDb.notesList[itemIndex!] = {
                                      "title": titleController.text,
                                      "desc": descController.text,
                                      "date": dateController.text
                                    }
                                  : DummyDb.notesList.add({
                                      "title": titleController.text,
                                      "desc": descController.text,
                                      "date": dateController.text
                                    });
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                isEdit ? "Update" : "Save",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
