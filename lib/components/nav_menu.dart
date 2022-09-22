import 'package:flutter/material.dart';
import 'package:usafl/views/quiz_screen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
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
            leading: Icon(
              Icons.list_alt,
              color: Color(0xFF233271),
            ),
            title: Text('Applications',
              style: TextStyle(
                color: Color(0xFF233271),
                fontSize: 20.0,
              ),
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Color(0xFF233271),
            ),
            title: Text('Settings',
              style: TextStyle(
                color: Color(0xFF233271),
                fontSize: 20.0,
              ),
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Color(0xFF233271),
            ),
            title: Text('Test Your H-2A Knowledge',
              style: TextStyle(
                color: Color(0xFF233271),
                fontSize: 20.0,
              ),
            ),
            onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => (QuizScreen())));
            },
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text('Compliance Checklists',
            style: TextStyle(
              color: Color(0xFF233271),
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            )
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.verified_user,
              color: Color(0xFF233271),
            ),
            title: Text(
              'Housing',
              style: TextStyle(
                color: Color(0xFF233271),
                fontSize: 20.0,
              ),
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.verified_user,
              color: Color(0xFF233271),
            ),
            title: Text(
              'Worker Arrival',
              style: TextStyle(
                color: Color(0xFF233271),
                fontSize: 20.0,
              ),
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.verified_user,
              color: Color(0xFF233271),
            ),
            title: Text(
              'Paying Workers',
              style: TextStyle(
                color: Color(0xFF233271),
                fontSize: 20.0,
              ),
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.verified_user,
              color: Color(0xFF233271),
            ),
            title: Text(
              'Worker Departure',
              style: TextStyle(
                color: Color(0xFF233271),
                fontSize: 20.0,
              ),
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.verified_user,
              color: Color(0xFF233271),
            ),
            title: Text(
              'Audit Prep',
              style: TextStyle(
                color: Color(0xFF233271),
                fontSize: 20.0,
              ),
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.verified_user,
              color: Color(0xFF233271),
            ),
            title: Text(
              'Miscellaneous',
              style: TextStyle(
                color: Color(0xFF233271),
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
