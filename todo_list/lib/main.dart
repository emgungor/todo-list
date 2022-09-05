import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/color_theme_data.dart';
import 'package:todo_list/models/items_database.dart';
import 'package:todo_list/screens/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ColorThemeData().createPrefObject();
  await ItemDataBase().createPrefObject();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ItemDataBase>(create: (BuildContext context) {
      return ItemDataBase();
    }),
    ChangeNotifierProvider<ColorThemeData>(
        create: (context) => ColorThemeData()),
  ], child: ToDoApp()));
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider.of<ColorThemeData>(context).loadThemeFromSharedPref();
    // Provider.of<ItemDataBase>(context).loadItemsFromSharedPref();

    return Consumer2<ItemDataBase, ColorThemeData>(
        builder: (context, itemData, themeData, child) {
      itemData.loadItemsFromSharedPref();
      themeData.loadThemeFromSharedPref();
      return MaterialApp(
        theme: Provider.of<ColorThemeData>(context).selectedTheme,
        home: HomePage(),
      );
    });
  }
}
