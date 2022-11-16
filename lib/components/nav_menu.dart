import 'package:flutter/material.dart';
import 'package:usafl/constants.dart';
import 'package:usafl/views/application_selection_screen.dart';
import 'package:usafl/views/checklist_selection_screen.dart';
import 'package:usafl/views/home_screen.dart';
import 'package:usafl/views/todo_list_screen.dart';
import 'package:usafl/views/settings_screen.dart';
import 'package:usafl/views/quiz_screen.dart';
import 'package:usafl/views/about_screen.dart';


class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 117.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: themeColor,
              ),
              child: const Center(
                child: Text(
                  'Main Menu',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
          ListTile(
            iconColor: themeColor,
            leading: Icon(
              Icons.home,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text('Dashboard',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => (HomeScreen())));
            },
          ),
          ListTile(
            iconColor: themeColor,
            leading: Icon(
              Icons.list_alt,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text('Applications',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => (ApplicationScreen())));
            },
          ),
          ListTile(
            iconColor: themeColor,
            leading: Icon(
              Icons.verified_user,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text('Compliance Checklists',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => (ChecklistScreen())));
            },
          ),
          ListTile(
            iconColor: themeColor,
            leading: Icon(
              Icons.list,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text('To-Do List',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => (ToDoListScreen())));
            },
          ),
          ListTile(
            iconColor: themeColor,
            leading: Icon(
              Icons.question_mark,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text('Test Your H-2A Knowledge',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            onTap: () {
              quizEngine.questionNumber = 0;
              Navigator.of(context).pop();
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => (QuizScreen())));
            },
          ),
          ListTile(
            iconColor: themeColor,
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text('Settings',
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
            iconColor: themeColor,
            leading: Icon(
              Icons.info,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text('About This App',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => (AboutScreen())));
            },
          ),
        ],
      ),
    );
  }
}
