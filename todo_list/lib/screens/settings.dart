import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/color_theme_data.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Theme Settings")),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SwitchCard(),
    );
  }
}

//needs a state management because of that we build a stful widget here.
// after a bug in toggletheme button, we cancel the stful widget due to "value" had default value.
  class SwitchCard extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    bool _value = Provider.of<ColorThemeData>(context).isGreen;
    Text greenText = Text(
        "Green Theme",
        style: TextStyle(color: Colors.green));
    Text redText = Text(
        "Red Theme",
        style: TextStyle(color: Colors.red));

    return Card(
      child: SwitchListTile(
        title: Text("Change Theme Color",
            style: TextStyle(color: Colors.black, fontSize: 20)),
        subtitle: _value ? greenText : redText,
        value: _value,
        onChanged: (bool value) {
          Provider.of<ColorThemeData>(context, listen: false).changeTheme(value);
        },
      ),
    );
  }
}
