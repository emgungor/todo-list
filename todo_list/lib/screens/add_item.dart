import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/items_database.dart';

class Add_Item extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom), // Giving proper space to keyboard.
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextField(
                minLines: 1,
                maxLines: 3,
                controller: textController,
                onChanged: (input) {
                  print(textController.text);
                },
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Add Task",
                    hintText: "..."),
                autofocus: true,
              ),
            ),
            ElevatedButton(
              child: Text("ADD"),
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                Provider.of<ItemDataBase>(context, listen: false)
                    .addItem(textController.text);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
