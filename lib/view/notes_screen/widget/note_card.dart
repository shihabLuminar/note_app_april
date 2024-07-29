import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard(
      {super.key,
      this.onDelete,
      required this.title,
      required this.desc,
      required this.date,
      this.onEdit});
  final void Function()? onDelete;
  final void Function()? onEdit;
  final String title;
  final String desc;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.red.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
                  onPressed: onEdit,
                  icon: Icon(Icons.edit, color: Colors.black)),
              IconButton(
                  onPressed: onDelete,
                  icon: Icon(Icons.delete, color: Colors.black)),
            ],
          ),
          Text(
            desc,
            maxLines: 4,
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.normal),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                date,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share, color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }
}
