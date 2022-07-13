import 'package:flutter/material.dart';
import 'package:smart_indicator/appscreens/navbar.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({Key? key}) : super(key: key);
  @override
  TeamsPageState createState() => TeamsPageState();
}

class TeamsPageState extends State<TeamsPage> {
  String? selectedDugout = "Left";
  List<String> dugout = ["Left", "Right"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Teams'),
        ),
        drawer: const NavBar(),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              Row(children: [
                const Expanded(
                    flex: 3,
                    child: Text("Home team dugout is on left or right?",
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
                                    title: const Text('Home team dugout is on left or right?',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                    content: const SingleChildScrollView(child: Text(
                                        'Specify which dugout the home team is located in.\n\nThis will determine which side of your screen the H and V are located on.\n\nUsing the drop-down list, select the location of the "Home" team. The "Away" team will automatically be placed in the opposite dugout.\n\nThis feature must be set for the "Score" and "Team At Bat" features to work properly.',
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
                                selectedDugout = value;
                              });
                            },
                            value: selectedDugout,
                            items: dugout
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
