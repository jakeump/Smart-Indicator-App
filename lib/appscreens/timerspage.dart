import 'package:flutter/material.dart';
import 'package:smart_indicator/appscreens/navbar.dart';
import 'package:flutter/cupertino.dart';

class TimersPage extends StatefulWidget {
  const TimersPage({Key? key}) : super(key: key);
  @override
  TimersPageState createState() => TimersPageState();
}

class TimersPageState extends State<TimersPage> {
  int gameHour = 2;
  int gameMin = 0;
  int warningHour = 0;
  int warningMin = 15;
  int warmupMin = 1;
  int warmupSec = 30;
  int visitMin = 0;
  int visitSec = 30;
  int pitchSec = 20;
  bool gameTimerBool = true;
  bool warmupTimerBool = true;
  bool visitTimerBool = true;
  bool pitchTimerBool = true;

  List<Widget> hrs = [
    for (int i = 0; i < 24; i++) ListTile(title: Text(i.toString())),
  ];
  List<Widget> min = [
    for (int i = 0; i < 60; i++) ListTile(title: Text(i.toString())),
  ];
  List<Widget> sec = [
    for (int i = 0; i < 60; i++) ListTile(title: Text(i.toString())),
  ];

  String timeLimit() {
    String output = "";
    output += "${gameHour}hr ";
    output += "${gameMin}min";
    return output;
  }

  String warningLimit() {
    String output = "";
    output += "${warningHour}hr ";
    output += "${warningMin}min";
    return output;
  }

  String warmupLimit() {
    String output = "";
    output += "${warmupMin}min ";
    output += "${warmupSec}sec";
    return output;
  }

  String visitLimit() {
    String output = "";
    output += "${visitMin}min ";
    output += "${visitSec}sec";
    return output;
  }

  String pitchLimit() {
    String output = "";
    output += "${pitchSec}sec";
    return output;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Timers'),
        ),
        drawer: const NavBar(),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              Row(children: [
                const Expanded(
                    flex: 2,
                    child: Text("Game Timer",
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
                                    title: const Text('Game Timer',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                    content: const SingleChildScrollView(child: Text(
                                        'Used for games with time limits.\n\nSlide the switch to turn the game timer on or off.\n\nSet the time hours and minutes to match the time limit of your game.\n\nSet the "Warn me at" hours and minutes to be alerted that you are nearing the time limit.\n\nYou will be alerted (vibrations) when the "Warn me at" time is reached and again when the "Time Limit" is reached.',
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
              gameTimerBool
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.blue,
                      width: double.infinity,
                      child: Column(children: [
                        Row(children: [
                          const Expanded(
                              flex: 1,
                              child: Text("Time Limit:",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16))),
                          TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            onPressed: () {
                              int tempHr = gameHour;
                              int tempMin = gameMin;
                              final gameHourController =
                                  FixedExtentScrollController(
                                      initialItem: gameHour);
                              final gameMinuteController =
                                  FixedExtentScrollController(
                                      initialItem: gameMin);
                              showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                      insetPadding: const EdgeInsets.all(10),
                                      child: Container(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                const Text("Time Limit",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    )),
                                                const SizedBox(height: 30),
                                                Flexible(
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                      SizedBox(
                                                          height: 120,
                                                          width: 70,
                                                          child:
                                                              CupertinoPicker(
                                                            scrollController:
                                                                gameHourController,
                                                            looping: true,
                                                            diameterRatio: 1.25,
                                                            selectionOverlay:
                                                                Column(
                                                                    children: <
                                                                        Widget>[
                                                                  Container(
                                                                      decoration: const BoxDecoration(
                                                                          border: Border(
                                                                              top: BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 2,
                                                                  )))),
                                                                  const SizedBox(
                                                                      height:
                                                                          50),
                                                                  Container(
                                                                      decoration: const BoxDecoration(
                                                                          border: Border(
                                                                              top: BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 2,
                                                                  ))))
                                                                ]),
                                                            itemExtent: 75,
                                                            onSelectedItemChanged:
                                                                (index) => {
                                                              tempHr = index,
                                                            },
                                                            children: hrs,
                                                          )),
                                                      const SizedBox(
                                                        height: 40,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Text("hr ",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                              )),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: 120,
                                                          width: 70,
                                                          child:
                                                              CupertinoPicker(
                                                            scrollController:
                                                                gameMinuteController,
                                                            looping: true,
                                                            diameterRatio: 1.25,
                                                            selectionOverlay:
                                                                Column(
                                                                    children: <
                                                                        Widget>[
                                                                  Container(
                                                                      decoration: const BoxDecoration(
                                                                          border: Border(
                                                                              top: BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 2,
                                                                  )))),
                                                                  const SizedBox(
                                                                      height:
                                                                          50),
                                                                  Container(
                                                                      decoration: const BoxDecoration(
                                                                          border: Border(
                                                                              top: BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 2,
                                                                  ))))
                                                                ]),
                                                            itemExtent: 75,
                                                            onSelectedItemChanged:
                                                                (index) => {
                                                              tempMin = index,
                                                            },
                                                            children: min,
                                                          )),
                                                      const SizedBox(
                                                        height: 40,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Text("min",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                              )),
                                                        ),
                                                      ),
                                                    ])),
                                                const SizedBox(height: 30),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          primary: Colors.blue,
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                        child: const Text(
                                                            "Cancel"),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      const SizedBox(width: 20),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          primary: Colors.blue,
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                        child: const Text("OK"),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          setState(() {
                                                            gameHour = tempHr;
                                                            gameMin = tempMin;
                                                          });
                                                        },
                                                      ),
                                                    ]),
                                              ]))));
                            },
                            child: Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(timeLimit(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 16))),
                          ),
                        ]),
                        const SizedBox(height: 15),
                        Container(
                            color: Colors.blue,
                            width: double.infinity,
                            child: Column(children: [
                              Row(children: [
                                const Expanded(
                                    flex: 1,
                                    child: Text("Warn Me When:",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16))),
                                TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white)),
                                  onPressed: () {
                                    int tempHr = warningHour;
                                    int tempMin = warningMin;
                                    final warningHourController =
                                        FixedExtentScrollController(
                                            initialItem: warningHour);
                                    final warningMinController =
                                        FixedExtentScrollController(
                                            initialItem: warningMin);
                                    showDialog(
                                        context: context,
                                        builder: (context) => Dialog(
                                            insetPadding:
                                                const EdgeInsets.all(10),
                                            child: Container(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      const Text("Warn Me When",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                          )),
                                                      const SizedBox(
                                                          height: 30),
                                                      Flexible(
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <
                                                                  Widget>[
                                                            SizedBox(
                                                                height: 120,
                                                                width: 70,
                                                                child:
                                                                    CupertinoPicker(
                                                                  scrollController:
                                                                      warningHourController,
                                                                  looping: true,
                                                                  diameterRatio:
                                                                      1.25,
                                                                  selectionOverlay:
                                                                      Column(children: <
                                                                          Widget>[
                                                                    Container(
                                                                        decoration: const BoxDecoration(
                                                                            border: Border(
                                                                                top: BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 2,
                                                                    )))),
                                                                    const SizedBox(
                                                                        height:
                                                                            50),
                                                                    Container(
                                                                        decoration: const BoxDecoration(
                                                                            border: Border(
                                                                                top: BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 2,
                                                                    ))))
                                                                  ]),
                                                                  itemExtent:
                                                                      75,
                                                                  onSelectedItemChanged:
                                                                      (index) =>
                                                                          {
                                                                    tempHr =
                                                                        index,
                                                                  },
                                                                  children: hrs,
                                                                )),
                                                            const SizedBox(
                                                              height: 40,
                                                              child: Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topCenter,
                                                                child: Text(
                                                                    "hr ",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                    )),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 120,
                                                                width: 70,
                                                                child:
                                                                    CupertinoPicker(
                                                                  scrollController:
                                                                      warningMinController,
                                                                  looping: true,
                                                                  diameterRatio:
                                                                      1.25,
                                                                  selectionOverlay:
                                                                      Column(children: <
                                                                          Widget>[
                                                                    Container(
                                                                        decoration: const BoxDecoration(
                                                                            border: Border(
                                                                                top: BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 2,
                                                                    )))),
                                                                    const SizedBox(
                                                                        height:
                                                                            50),
                                                                    Container(
                                                                        decoration: const BoxDecoration(
                                                                            border: Border(
                                                                                top: BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 2,
                                                                    ))))
                                                                  ]),
                                                                  itemExtent:
                                                                      75,
                                                                  onSelectedItemChanged:
                                                                      (index) =>
                                                                          {
                                                                    tempMin =
                                                                        index,
                                                                  },
                                                                  children: min,
                                                                )),
                                                            const SizedBox(
                                                              height: 40,
                                                              child: Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topCenter,
                                                                child: Text(
                                                                    "min",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                    )),
                                                              ),
                                                            ),
                                                          ])),
                                                      const SizedBox(
                                                          height: 30),
                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: <Widget>[
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                primary:
                                                                    Colors.blue,
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                              ),
                                                              child: const Text(
                                                                  "Cancel"),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                            const SizedBox(
                                                                width: 20),
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                primary:
                                                                    Colors.blue,
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                              ),
                                                              child: const Text(
                                                                  "OK"),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                setState(() {
                                                                  warningHour =
                                                                      tempHr;
                                                                  warningMin =
                                                                      tempMin;
                                                                });
                                                              },
                                                            ),
                                                          ]),
                                                    ]))));
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Text(warningLimit(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16))),
                                ),
                              ]),
                            ])),
                      ]))
                  : const SizedBox(),
              SizedBox(
                height: gameTimerBool ? 30 : 0,
              ),
              Row(children: [
                const Expanded(
                    flex: 2,
                    child: Text("Warmup Timer",
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
                                    title: const Text('Warmup Timer',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                    content: const SingleChildScrollView(child: Text(
                                        'Used to time pitcher warmup between innings.\n\nSlide the switch to turn the Warmup Timer on or off.\n\nSpecify the number of minutes and seconds you want to allow for pitcher warmups.\n\nYou will be alerted (vibrations) when the timer expires.',
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
              warmupTimerBool
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.blue,
                      width: double.infinity,
                      child: Column(children: [
                        Row(children: [
                          const Expanded(
                              flex: 1,
                              child: Text("Time:",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16))),
                          TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            onPressed: () {
                              int tempMin = warmupMin;
                              int tempSec = warmupSec;
                              final warmupMinController =
                                  FixedExtentScrollController(
                                      initialItem: warmupMin);
                              final warmupSecController =
                                  FixedExtentScrollController(
                                      initialItem: warmupSec);
                              showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                      insetPadding: const EdgeInsets.all(10),
                                      child: Container(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                const Text("Warmup Timer",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    )),
                                                const SizedBox(height: 30),
                                                Flexible(
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                      SizedBox(
                                                          height: 120,
                                                          width: 70,
                                                          child:
                                                              CupertinoPicker(
                                                            scrollController:
                                                                warmupMinController,
                                                            looping: true,
                                                            diameterRatio: 1.25,
                                                            selectionOverlay:
                                                                Column(
                                                                    children: <
                                                                        Widget>[
                                                                  Container(
                                                                      decoration: const BoxDecoration(
                                                                          border: Border(
                                                                              top: BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 2,
                                                                  )))),
                                                                  const SizedBox(
                                                                      height:
                                                                          50),
                                                                  Container(
                                                                      decoration: const BoxDecoration(
                                                                          border: Border(
                                                                              top: BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 2,
                                                                  ))))
                                                                ]),
                                                            itemExtent: 75,
                                                            onSelectedItemChanged:
                                                                (index) => {
                                                              tempMin = index,
                                                            },
                                                            children: min,
                                                          )),
                                                      const SizedBox(
                                                        height: 40,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Text("min ",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                              )),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: 120,
                                                          width: 70,
                                                          child:
                                                              CupertinoPicker(
                                                            scrollController:
                                                                warmupSecController,
                                                            looping: true,
                                                            diameterRatio: 1.25,
                                                            selectionOverlay:
                                                                Column(
                                                                    children: <
                                                                        Widget>[
                                                                  Container(
                                                                      decoration: const BoxDecoration(
                                                                          border: Border(
                                                                              top: BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 2,
                                                                  )))),
                                                                  const SizedBox(
                                                                      height:
                                                                          50),
                                                                  Container(
                                                                      decoration: const BoxDecoration(
                                                                          border: Border(
                                                                              top: BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 2,
                                                                  ))))
                                                                ]),
                                                            itemExtent: 75,
                                                            onSelectedItemChanged:
                                                                (index) => {
                                                              tempSec = index,
                                                            },
                                                            children: sec,
                                                          )),
                                                      const SizedBox(
                                                        height: 40,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Text("sec",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                              )),
                                                        ),
                                                      ),
                                                    ])),
                                                const SizedBox(height: 30),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          primary: Colors.blue,
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                        child: const Text(
                                                            "Cancel"),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      const SizedBox(width: 20),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          primary: Colors.blue,
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                        child: const Text("OK"),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          setState(() {
                                                            warmupMin = tempMin;
                                                            warmupSec = tempSec;
                                                          });
                                                        },
                                                      ),
                                                    ]),
                                              ]))));
                            },
                            child: Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(warmupLimit(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 16))),
                          ),
                        ])
                      ]))
                  : const SizedBox(),
              SizedBox(
                height: warmupTimerBool ? 30 : 0,
              ),
              Row(children: [
                const Expanded(
                    flex: 2,
                    child: Text("Visit Timer",
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
                                    title: const Text('Visit Timer',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                    content: const SingleChildScrollView(child: Text(
                                        'Used to time mound visits.\n\nSlide the switch to turn the Visit Timer on or off.\n\nSpecify the number of minutes and seconds you want to a llow for a visit.\n\nYou will be alerted (vibrations) when the timer expires.',
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
                            value: visitTimerBool, // get value from device
                            onChanged: ((bool value) {
                              setState(() {
                                visitTimerBool = value;
                              });
                            }),
                          ),
                        ]))
              ]),
              visitTimerBool
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.blue,
                      width: double.infinity,
                      child: Column(children: [
                        Row(children: [
                          const Expanded(
                              flex: 1,
                              child: Text("Time:",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16))),
                          TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            onPressed: () {
                              int tempMin = visitMin;
                              int tempSec = visitSec;
                              final visitMinController =
                                  FixedExtentScrollController(
                                      initialItem: visitMin);
                              final visitSecController =
                                  FixedExtentScrollController(
                                      initialItem: visitSec);
                              showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                      insetPadding: const EdgeInsets.all(10),
                                      child: Container(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                const Text("Visit Timer",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    )),
                                                const SizedBox(height: 30),
                                                Flexible(
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                      SizedBox(
                                                          height: 120,
                                                          width: 70,
                                                          child:
                                                              CupertinoPicker(
                                                            scrollController:
                                                                visitMinController,
                                                            looping: true,
                                                            diameterRatio: 1.25,
                                                            selectionOverlay:
                                                                Column(
                                                                    children: <
                                                                        Widget>[
                                                                  Container(
                                                                      decoration: const BoxDecoration(
                                                                          border: Border(
                                                                              top: BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 2,
                                                                  )))),
                                                                  const SizedBox(
                                                                      height:
                                                                          50),
                                                                  Container(
                                                                      decoration: const BoxDecoration(
                                                                          border: Border(
                                                                              top: BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 2,
                                                                  ))))
                                                                ]),
                                                            itemExtent: 75,
                                                            onSelectedItemChanged:
                                                                (index) => {
                                                              tempMin = index,
                                                            },
                                                            children: min,
                                                          )),
                                                      const SizedBox(
                                                        height: 40,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Text("min ",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                              )),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: 120,
                                                          width: 70,
                                                          child:
                                                              CupertinoPicker(
                                                            scrollController:
                                                                visitSecController,
                                                            looping: true,
                                                            diameterRatio: 1.25,
                                                            selectionOverlay:
                                                                Column(
                                                                    children: <
                                                                        Widget>[
                                                                  Container(
                                                                      decoration: const BoxDecoration(
                                                                          border: Border(
                                                                              top: BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 2,
                                                                  )))),
                                                                  const SizedBox(
                                                                      height:
                                                                          50),
                                                                  Container(
                                                                      decoration: const BoxDecoration(
                                                                          border: Border(
                                                                              top: BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 2,
                                                                  ))))
                                                                ]),
                                                            itemExtent: 75,
                                                            onSelectedItemChanged:
                                                                (index) => {
                                                              tempSec = index,
                                                            },
                                                            children: sec,
                                                          )),
                                                      const SizedBox(
                                                        height: 40,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Text("sec",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                              )),
                                                        ),
                                                      ),
                                                    ])),
                                                const SizedBox(height: 30),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          primary: Colors.blue,
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                        child: const Text(
                                                            "Cancel"),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      const SizedBox(width: 20),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          primary: Colors.blue,
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                        child: const Text("OK"),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          setState(() {
                                                            visitMin = tempMin;
                                                            visitSec = tempSec;
                                                          });
                                                        },
                                                      ),
                                                    ]),
                                              ]))));
                            },
                            child: Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(visitLimit(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 16))),
                          ),
                        ])
                      ]))
                  : const SizedBox(),
              SizedBox(
                height: visitTimerBool ? 30 : 0,
              ),
              Row(children: [
                const Expanded(
                    flex: 2,
                    child: Text("Pitch Timer",
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
                                    title: const Text('Pitch Timer',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                    content: const SingleChildScrollView(child: Text(
                                        'Used to enforce the pitch clock rule.\n\nSlide the switch to turn the Pitch Timer functionality on or off.\n\nSpecify the number of seconds your ruleset allows for a pitch.\n\nYou will be alerted (vibrations) when the timer expires.',
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
                            value: pitchTimerBool, // get value from device
                            onChanged: ((bool value) {
                              setState(() {
                                pitchTimerBool = value;
                              });
                            }),
                          ),
                        ]))
              ]),
              pitchTimerBool
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.blue,
                      width: double.infinity,
                      child: Column(children: [
                        Row(children: [
                          const Expanded(
                              flex: 1,
                              child: Text("Time:",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16))),
                          TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            onPressed: () {
                              int tempSec = pitchSec;
                              final pitchSecController =
                                  FixedExtentScrollController(
                                      initialItem: pitchSec);
                              showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                      insetPadding: const EdgeInsets.all(10),
                                      child: Container(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                const Text("Pitch Timer",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    )),
                                                const SizedBox(height: 30),
                                                Flexible(
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                      SizedBox(
                                                          height: 120,
                                                          width: 70,
                                                          child:
                                                              CupertinoPicker(
                                                            scrollController:
                                                                pitchSecController,
                                                            looping: true,
                                                            diameterRatio: 1.25,
                                                            selectionOverlay:
                                                                Column(
                                                                    children: <
                                                                        Widget>[
                                                                  Container(
                                                                      decoration: const BoxDecoration(
                                                                          border: Border(
                                                                              top: BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 2,
                                                                  )))),
                                                                  const SizedBox(
                                                                      height:
                                                                          50),
                                                                  Container(
                                                                      decoration: const BoxDecoration(
                                                                          border: Border(
                                                                              top: BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 2,
                                                                  ))))
                                                                ]),
                                                            itemExtent: 75,
                                                            onSelectedItemChanged:
                                                                (index) => {
                                                              tempSec = index,
                                                            },
                                                            children: sec,
                                                          )),
                                                      const SizedBox(
                                                        height: 40,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Text("sec",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                              )),
                                                        ),
                                                      ),
                                                    ])),
                                                const SizedBox(height: 30),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          primary: Colors.blue,
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                        child: const Text(
                                                            "Cancel"),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      const SizedBox(width: 20),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          primary: Colors.blue,
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                        child: const Text("OK"),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          setState(() {
                                                            pitchSec = tempSec;
                                                          });
                                                        },
                                                      ),
                                                    ]),
                                              ]))));
                            },
                            child: Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(pitchLimit(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 16))),
                          ),
                        ])
                      ]))
                  : const SizedBox(),
            ])));
  }
}
