import 'package:flutter/material.dart';
import 'package:smart_indicator/appscreens/navbar.dart';

class VibrationsPage extends StatefulWidget {
  const VibrationsPage({Key? key}) : super(key: key);
  @override
  VibrationsPageState createState() => VibrationsPageState();
}

class VibrationsPageState extends State<VibrationsPage> {
  String? selectedDuration = "Short";
  List<String> durations = ["Short", "Medium", "Long"];
  bool checkswingBool = true;
  bool outsBool = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Vibrations'),
        ),
        drawer: const NavBar(),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              Row(children: [
                const Expanded(
                    flex: 1,
                    child: Text("Duration:",
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
                                    title: const Text('Duration',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                    content: const SingleChildScrollView(child: Text(
                                        'Select how fast or how slow your Smart-Indicator vibrates the count.\n\nThe time it takes for your Smart-Indicator to vibrate 3-Balls, 2-Strikes, and 2-Outs is shown below for each option.\n\nLong = Slowest (About 5 seconds)\n\nMedium = Faster (About 3.75 seconds)\n\nShort = Fastest (About 2.5 seconds)',
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
                                selectedDuration = value;
                              });
                            },
                            value: selectedDuration,
                            items: durations
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
              const SizedBox(height: 15),
              Row(children: [
                const Expanded(
                    flex: 2,
                    child: Text("Checkswing:",
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
                                    title: const Text('Checkswing',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                    content: const SingleChildScrollView(child: Text(
                                        'Automatically vibrate the new (corrected) count after a checkswing is changed from a ball to a strike.\n\nSlide the switch to the right to turn this feature on.\n\nSlide the switch to the left to turn this feature off.',
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
                            value: checkswingBool, // get value from device
                            onChanged: ((bool value) {
                              setState(() {
                                checkswingBool = value;
                              });
                            }),
                          ),
                        ]))
              ]),
              const SizedBox(height: 15),
              Row(children: [
                const Expanded(
                    flex: 2,
                    child: Text("Outs:",
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
                                    title: const Text('Outs',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                    content: const SingleChildScrollView(child: Text(
                                        'Include "Outs" when vibrating the count.\n\nSlide the switch to the right to turn this feature on.\n\nSlide the switch to the left to turn this feature off.',
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
                            value: outsBool, // get value from device
                            onChanged: ((bool value) {
                              setState(() {
                                outsBool = value;
                              });
                            }),
                          ),
                        ]))
              ]),
            ])));
  }
}
