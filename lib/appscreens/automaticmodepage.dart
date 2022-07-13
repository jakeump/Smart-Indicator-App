import 'package:flutter/material.dart';
import 'package:smart_indicator/appscreens/navbar.dart';

class AutomaticModePage extends StatefulWidget {
  const AutomaticModePage({Key? key}) : super(key: key);
  @override
  AutomaticModePageState createState() => AutomaticModePageState();
}

class AutomaticModePageState extends State<AutomaticModePage> {
  bool automaticBool = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Automatic Mode'),
        ),
        drawer: const NavBar(),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              Row(children: [
                const Expanded(
                    flex: 2,
                    child: Text("Automatic Mode:",
                        style: TextStyle(color: Colors.blue, fontSize: 18))),
                Expanded(
                    flex: 1,
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
                                    title: const Text('Automatic Mode',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                    content: const SingleChildScrollView(child: Text(
                                        'Let your Smart-Indicator do the work by enabling the "Automatic Mode"\n\nWhen the "Automatic Mode" is turned on, your Smart-Indicator will do the following:\n• Reset the count on ball 4.\n• Reset the count and add an out on strike 3.\n• Reset the count and outs and advance the inning on out 3.\n• Prompt you before recording ball 4, strike 3, and out 3.\n• Prompt you to start the pitcher warmup timer.\n• Assign runs to the team that is at bat.\n• Charge visits to the team that is on defense.\n• Alert you when a pending visit will require a pitching change.',
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
                          Switch(
                            inactiveThumbColor: Colors.grey,
                            inactiveTrackColor:
                                const Color.fromARGB(255, 207, 207, 207),
                            activeColor: Colors.white,
                            activeTrackColor: Colors.blue,
                            value: automaticBool, // get value from device
                            onChanged: ((bool value) {
                              setState(() {
                                automaticBool = value;
                              });
                            }),
                          ),
                        ]))
              ]),
            ])));
  }
}
