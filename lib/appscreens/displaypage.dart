import 'package:flutter/material.dart';
import 'package:smart_indicator/appscreens/navbar.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({Key? key}) : super(key: key);
  @override
  DisplayPageState createState() => DisplayPageState();
}

class DisplayPageState extends State<DisplayPage> {
  bool inningBool = true;
  bool scoreBool = true;
  bool teamAtBatBool = true;
  bool gameTimerBool = true;
  bool warmupTimerBool = true;
  bool homeAwayTeamsBool = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Display'),
        ),
        drawer: const NavBar(),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: ListView(children: <Widget>[
            Row(children: [
              const Expanded(
                  flex: 1,
                  child: Text("Inning:",
                      style: TextStyle(color: Colors.blue, fontSize: 18))),
              Expanded(
                  flex: 2,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    IconButton(
                        icon: const Icon(Icons.help_outline),
                        color: Colors.grey,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Inning',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                              content: const SingleChildScrollView(child: Text(
                                  'Show or hide the inning on the display.\n\nSlide the switch right to show the inning on the display.\n\nSlide the switch left to hide the inning on the display.',
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
                      value: inningBool, // get value from device
                      onChanged: ((bool value) {
                        setState(() {
                          inningBool = value;
                        });
                      }),
                    ),
                  ]))
            ]),
            const SizedBox(height: 15),
            Row(children: [
              const Expanded(
                  flex: 2,
                  child: Text("Score:",
                      style: TextStyle(color: Colors.blue, fontSize: 18))),
              Expanded(
                  flex: 1,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    IconButton(
                        icon: const Icon(Icons.help_outline),
                        color: Colors.grey,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Score',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                              content: const SingleChildScrollView(child: Text(
                                  'Show or hide the score on the display.\n\nSlide the switch right to show the score on the display.\n\nSlide the switch left to hide the score on the display.',
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
                      value: scoreBool, // get value from device
                      onChanged: ((bool value) {
                        setState(() {
                          scoreBool = value;
                        });
                      }),
                    ),
                  ]))
            ]),
            const SizedBox(height: 15),
            Row(children: [
              const Expanded(
                  flex: 2,
                  child: Text("Team At Bat:",
                      style: TextStyle(color: Colors.blue, fontSize: 18))),
              Expanded(
                  flex: 1,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    IconButton(
                        icon: const Icon(Icons.help_outline),
                        color: Colors.grey,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Inning',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                              content: const SingleChildScrollView(child: Text(
                                  'Show or hide which team is at bat on the display.\n\nSlide the switch right to show the team at bat on the display.\n\nSlide the switch left to hide the team at bat on the display.',
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
                      value: teamAtBatBool, // get value from device
                      onChanged: ((bool value) {
                        setState(() {
                          teamAtBatBool = value;
                        });
                      }),
                    ),
                  ]))
            ]),
            const SizedBox(height: 15),
            Row(children: [
              const Expanded(
                  flex: 2,
                  child: Text("Game Timer:",
                      style: TextStyle(color: Colors.blue, fontSize: 18))),
              Expanded(
                  flex: 1,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    IconButton(
                        icon: const Icon(Icons.help_outline),
                        color: Colors.grey,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Game Timer',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                              content: const SingleChildScrollView(child: Text(
                                  'Show or hide the game timer on the display.\n\nSlide the switch right to show the game timer on the display.\n\nSlide the switch left to hide the game timer on the display.',
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
                      value: gameTimerBool, // get value from device
                      onChanged: ((bool value) {
                        setState(() {
                          gameTimerBool = value;
                        });
                      }),
                    ),
                  ]))
            ]),
            const SizedBox(height: 15),
            Row(children: [
              const Expanded(
                  flex: 2,
                  child: Text("Warmup Timer:",
                      style: TextStyle(color: Colors.blue, fontSize: 18))),
              Expanded(
                  flex: 1,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    IconButton(
                        icon: const Icon(Icons.help_outline),
                        color: Colors.grey,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Warmup Timer',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                              content: const SingleChildScrollView(child: Text(
                                  'Show or hide the warmup timer on the display.\n\nSlide the switch right to show the warmup timer on the display.\n\nSlide the switch left to hide the warmup timer on the display.',
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
                      value: warmupTimerBool, // get value from device
                      onChanged: ((bool value) {
                        setState(() {
                          warmupTimerBool = value;
                        });
                      }),
                    ),
                  ]))
            ]),
            const SizedBox(height: 15),
            Row(children: [
              const Expanded(
                  flex: 2,
                  child: Text("Home/Away Teams:",
                      style: TextStyle(color: Colors.blue, fontSize: 18))),
              Expanded(
                  flex: 1,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    IconButton(
                        icon: const Icon(Icons.help_outline),
                        color: Colors.grey,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Home/Away Teams',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                              content: const SingleChildScrollView(child: Text(
                                  'Show or hide the home and away teams on the display.\n\nSlide the switch right to show the home and away teams on the display.\n\nSlide the switch left to hide the home and away teams on the display.',
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
                      value: homeAwayTeamsBool, // get value from device
                      onChanged: ((bool value) {
                        setState(() {
                          homeAwayTeamsBool = value;
                        });
                      }),
                    ),
                  ]))
            ]),
          ]),
        ));
  }
}
