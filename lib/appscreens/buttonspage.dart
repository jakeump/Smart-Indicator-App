import 'package:flutter/material.dart';
import 'package:smart_indicator/appscreens/navbar.dart';

class ButtonsPage extends StatefulWidget {
  const ButtonsPage({Key? key}) : super(key: key);
  @override
  ButtonsPageState createState() => ButtonsPageState();
}

class ButtonsPageState extends State<ButtonsPage> {
  String? selectedBalls = "Left";
  List<String> balls = ["Left", "Right"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Buttons'),
        ),
        drawer: const NavBar(),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              Row(children: [
                const Expanded(
                    flex: 3,
                    child: Text("Balls on left or right?",
                        style: TextStyle(color: Colors.blue, fontSize: 18))),
                Expanded(
                    flex: 2,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              icon: const Icon(Icons.help_outline),
                              color: Colors.grey,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Balls on left or right?',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                    content: const SingleChildScrollView(child: Text(
                                        'You can swap the ball and strike buttons. These are the top-left and top-right buttons on your Smart-Indicator.\n\nUsing the drop-down list, select the location of the "Balls" button. The strike button will automatically be placed on the opposite button.',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black))),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'OK',
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          DropdownButton(
                            onChanged: (String? value) {
                              setState(() {
                                selectedBalls = value;
                              });
                            },
                            value: selectedBalls,
                            items: balls
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          e,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ]))
              ]),
            ])));
  }
}
