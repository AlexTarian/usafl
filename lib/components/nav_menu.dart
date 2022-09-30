import 'package:flutter/material.dart';
import 'package:usafl/views/settings_screen.dart';
import 'package:usafl/views/quiz_screen.dart';
import 'package:usafl/main.dart';

class NavDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
            height: 117.0,
            child: DrawerHeader(
              child: Center(
                child: Text(
                  'Main Menu',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF5b9bd5),
              ),
            ),
          ),
          ListTile(
            iconColor: Theme.of(context).primaryColor,
            leading: const Icon(
              Icons.list_alt,
            ),
            title: Text('Applications',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            onTap: () => {},
          ),
          ListTile(
            iconColor: Theme.of(context).primaryColor,
            leading: const Icon(
              Icons.settings,
            ),
            title: Text('Settings',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => (SettingsScreen())));
            },
          ),
          ListTile(
            iconColor: Theme.of(context).primaryColor,
            leading: const Icon(
              Icons.info,
            ),
            title: Text('Test Your H-2A Knowledge',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => (QuizScreen())));
            },
          ),
          const SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text('Compliance Checklists',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            )
            ),
          ),
          ListTile(
            iconColor: Theme.of(context).primaryColor,
            leading: const Icon(
              Icons.verified_user,
            ),
            title: Text(
              'Housing',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            onTap: () => {},
          ),
          ListTile(
            iconColor: Theme.of(context).primaryColor,
            leading: const Icon(
              Icons.verified_user,
            ),
            title: Text(
              'Worker Arrival',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            onTap: () => {},
          ),
          ListTile(
            iconColor: Theme.of(context).primaryColor,
            leading: const Icon(
              Icons.verified_user,
            ),
            title: Text(
              'Paying Workers',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            onTap: () => {},
          ),
          ListTile(
            iconColor: Theme.of(context).primaryColor,
            leading: const Icon(
              Icons.verified_user,
            ),
            title: Text(
              'Worker Departure',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            onTap: () => {},
          ),
          ListTile(
            iconColor: Theme.of(context).primaryColor,
            leading: const Icon(
              Icons.verified_user,
            ),
            title: Text(
              'Audit Prep',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            onTap: () => {},
          ),
          ListTile(
            iconColor: Theme.of(context).primaryColor,
            leading: const Icon(
              Icons.verified_user,
            ),
            title: Text(
              'Miscellaneous',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
