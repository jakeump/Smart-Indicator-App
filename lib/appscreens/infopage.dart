import 'package:flutter/material.dart';
import 'package:smart_indicator/appscreens/navbar.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);
  @override
  InfoPageState createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage> {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailAddressController = TextEditingController();
  final serialController = TextEditingController();
  final hardwareController = TextEditingController();
  final softwareController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = 'Louis Nickerson';
    phoneNumberController.text = '(555) 555-5555';
    emailAddressController.text = 'example@gmail.com';
    serialController.text = '123456789';
    hardwareController.text = 'Test App v1.6.0';
    softwareController.text = '1234';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Info'),
        ),
        drawer: const NavBar(),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              const Text("Owner Information",
                  style: TextStyle(color: Colors.blue, fontSize: 18)),
              Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.blue,
                  width: double.infinity,
                  child: Column(children: [
                    Row(children: [
                      const Expanded(
                          flex: 1,
                          child: Text("Name",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16))),
                      Expanded(
                          flex: 2,
                          child: TextField(
                            controller: nameController,
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                              isDense: true,
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            onChanged:
                                null, // send nameController.text to device
                          )),
                    ]),
                    const SizedBox(height: 15),
                    Row(children: [
                      const Expanded(
                          flex: 1,
                          child: Text("Phone Number",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16))),
                      Expanded(
                          flex: 2,
                          child: TextField(
                            controller: phoneNumberController,
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                              isDense: true,
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            onChanged:
                                null, // send phoneNumberController.text to device
                          )),
                    ]),
                    const SizedBox(height: 15),
                    Row(children: [
                      const Expanded(
                          flex: 1,
                          child: Text("Email Address",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16))),
                      Expanded(
                          flex: 2,
                          child: TextField(
                            controller: emailAddressController,
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                              isDense: true,
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            onChanged:
                                null, // send emailAddressController.text to device
                          )),
                    ]),
                  ])),
              const SizedBox(height: 30),
              const Text("Device Information",
                  style: TextStyle(color: Colors.blue, fontSize: 18)),
              AbsorbPointer(
                  child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.blue,
                width: double.infinity,
                child: Column(children: [
                  Row(children: [
                    const Expanded(
                        flex: 1,
                        child: Text("Serial Number",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16))),
                    Expanded(
                        flex: 2,
                        child: TextField(
                          controller: serialController,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          onChanged: null, // send nameController.text to device
                        )),
                  ]),
                  const SizedBox(height: 15),
                  Row(children: [
                    const Expanded(
                        flex: 1,
                        child: Text("Hardware Version",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16))),
                    Expanded(
                        flex: 2,
                        child: TextField(
                          controller: hardwareController,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          onChanged:
                              null, // send phoneNumberController.text to device
                        )),
                  ]),
                  const SizedBox(height: 15),
                  Row(children: [
                    const Expanded(
                        flex: 1,
                        child: Text("Software Version",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16))),
                    Expanded(
                        flex: 2,
                        child: TextField(
                          controller: softwareController,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          onChanged:
                              null, // send emailAddressController.text to device
                        )),
                  ]),
                ]),
              )),
              const SizedBox(height: 30),
              const Text("Company Information",
                  style: TextStyle(color: Colors.blue, fontSize: 18)),
              AbsorbPointer(
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.blue,
                      width: double.infinity,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                                flex: 1,
                                child: Image.network(
                                    'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
                            const SizedBox(width: 10),
                            Flexible(
                                flex: 2,
                                child: Column(children: [
                                  Row(children: const [
                                    Icon(Icons.monitor,
                                        color: Colors.white),
                                    SizedBox(width: 5),
                                    Flexible(
                                        child: Text(
                                            "UmpireStuff.com", // put hyperlink
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12))),
                                  ]),
                                  const SizedBox(height: 15),
                                  Row(children: const [
                                    Icon(Icons.phone, color: Colors.white),
                                    SizedBox(width: 5),
                                    Flexible(
                                        child: Text(
                                            "(980) 867-4737", // put hyperlink
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12))),
                                  ]),
                                  const SizedBox(height: 15),
                                  Row(children: const [
                                    Icon(Icons.email, color: Colors.white),
                                    SizedBox(width: 5),
                                    Flexible(
                                        child: Text(
                                            "sales@UmpireStuff.com", // put hyperlink
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12))),
                                  ]),
                                ]))
                          ]))),
            ])));
  }
}
