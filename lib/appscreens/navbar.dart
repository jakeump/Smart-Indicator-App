import 'package:flutter/material.dart';
import 'package:smart_indicator/appscreens/infopage.dart';
import 'package:smart_indicator/appscreens/timerspage.dart';
import 'package:smart_indicator/appscreens/displaypage.dart';
import 'package:smart_indicator/appscreens/vibrationspage.dart';
import 'package:smart_indicator/appscreens/buttonspage.dart';
import 'package:smart_indicator/appscreens/teamspage.dart';
import 'package:smart_indicator/appscreens/automaticmodepage.dart';
import 'package:smart_indicator/appscreens/gamesettingspage.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Louis Nickerson'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Info'),
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const InfoPage(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text('Timers'),
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const TimersPage(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.monitor),
            title: const Text('Display'),
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const DisplayPage(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.vibration),
            title: const Text('Vibrations'),
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const VibrationsPage(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.touch_app),
            title: const Text('Buttons'),
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const ButtonsPage(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Teams'),
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const TeamsPage(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.autorenew),
            title: const Text('Auto Mode'),
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const AutomaticModePage(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.tune),
            title: const Text('Game Settings'),
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const GameSettingsPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
