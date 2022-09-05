import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String? title;
  final bool? isDone;
  final Function(bool?)? toggleStatus;
  final void Function(DismissDirection)? deleteItem;

  ItemCard({this.title, this.isDone, this.toggleStatus, this.deleteItem});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: deleteItem,
      key: UniqueKey(),   // Key(title!) --> works like oid.
      child: Card(
        color: isDone! ? Colors.green[100]: Colors.white,
        elevation: isDone! ? 1 : 5,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(
              title!,
              style: TextStyle(color: Colors.black)),
          trailing:
              Checkbox(onChanged: toggleStatus, value: isDone, activeColor: Colors.green),
        ),
      ),
    );
  }
}
