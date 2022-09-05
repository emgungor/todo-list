import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/items_database.dart';
import 'package:todo_list/screens/settings.dart';
import 'package:todo_list/widgets/item_card.dart';

import 'add_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                    "${Provider.of<ItemDataBase>(context).items.length} Tasks to Done!",
                    style: Theme.of(context).textTheme.headline3),
              ),
            ),
          ),
          Expanded(
            flex: 6 ,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Consumer<ItemDataBase>(
                      builder: (context, itemData, child) => Align(
                        alignment: Alignment.topCenter,
                        child: ListView.builder(
                            reverse: true,
                            shrinkWrap: true,
                            itemCount: itemData.items.length,
                            //Provider.of<ItemDataBase>(context).items.length,
                            itemBuilder: (context, index) => ItemCard(
                                  title: itemData.items[index].title,
                                  isDone: itemData.items[index].isDone,
                                  toggleStatus: (bool) {
                                    itemData.toggleStatus(index);
                                  },
                                  deleteItem: (_) {
                                    itemData.deleteItem(index);
                                  },
                                )),
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              context: context,
              builder: (context) => Add_Item());
        },
        child: Icon(Icons.add));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("To Do List"),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.settings, size: 25),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Settings()));
            },
          ),
        ),
      ],
    );
  }
}
