import 'package:flutter/material.dart';
import 'package:smart_indicator/appscreens/navbar.dart';

class GameSettingsPage extends StatefulWidget {
  const GameSettingsPage({Key? key}) : super(key: key);
  @override
  GameSettingsPageState createState() => GameSettingsPageState();
}

class GameSettingsPageState extends State<GameSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Game Settings'),
        ),
        drawer: const NavBar(),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: const Text("Coming Soon")));
  }
}
