import 'package:flutter/material.dart';
import 'package:usafl/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:usafl/components/custom_app_bar.dart';
import 'package:usafl/components/nav_menu.dart';
import 'package:usafl/services/sql_helper.dart';


class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();

}

class _ToDoListScreenState extends State<ToDoListScreen> {

  List<Map<String, dynamic>> _todos = [];

  bool _isLoading = true;

  void _refreshTodos() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _todos = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshTodos(); // Loading the diary when the app starts
    SQLHelper.initializeDB().whenComplete(() async {
      _refreshTodos();
      setState(() {});
    });
  }

  IconData getCategoryIcon(String category) {
    if(category == 'Housing') {
      return Icons.house;
    } else if (category == 'Bedrooms') {
      return Icons.bed;
    } else if (category == 'Bathrooms') {
      return Icons.bathroom;
    } else if (category == 'Arrival') {
      return Icons.swipe_down_alt;
    } else if (category == 'Payment') {
      return Icons.attach_money;
    } else if (category == 'Treatment') {
      return Icons.handshake;
    } else if (category == 'Departure') {
      return Icons.airplanemode_active;
    } else if (category == 'Audit') {
      return Icons.file_open;
    } else if (category == 'FLC') {
      return Icons.groups;
    } else if (category == 'Misc') {
      return Icons.question_mark;
    } else {
      return Icons.question_mark;
    }
  }

  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Item marked as completed!',
        style: TextStyle(fontSize: 20.0),
        textAlign: TextAlign.center,),
      backgroundColor: usaflAccent,
      duration: Duration(milliseconds: 500),
    ));
    _refreshTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      drawerEnableOpenDragGesture: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85.0),
        child: Builder(builder: (context) {
          return customAppBar(
            iconR: Icons.help,
            onPressedR: () {null;},
          );
        }),
      ),
      body: _isLoading ? const Center(child: CircularProgressIndicator()) : Center(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).primaryColorLight,
                  Theme.of(context).primaryColorDark,
                ],
              )
          ),
          child: SafeArea(
            minimum: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: 70.0,
                  child: Center(
                    child: Text('To-Do List',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(height: 10),
                      itemCount: _todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                          ),
                          child: ListTile(
                            minVerticalPadding: 10.0,
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(getCategoryIcon(_todos[index]['category']), size: 30.0),
                              ],
                            ),
                            title: Text(_todos[index]['description'], style: const TextStyle(fontSize: 20.0),),
                            iconColor: Theme.of(context).primaryColor,
                            textColor: Theme.of(context).primaryColor,
                            onTap: () {
                              Alert(
                                context: context,
                                title: _todos[index]['category'],
                                desc: _todos[index]['description'],
                                buttons: [
                                  DialogButton(
                                    color: usaflAccent,
                                    child: const Text('Cancel',
                                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  DialogButton(
                                    color: usaflAccent,
                                    child: const Text('Complete',
                                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                                    ),
                                    onPressed: () {
                                      _deleteItem(_todos[index]['id']);
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ).show();
                            },
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ListView.separated(
// physics: const BouncingScrollPhysics(),
// separatorBuilder: (context, index) => const SizedBox(height: 10),
// itemCount: toDoListEngine.toDoList.length,
// itemBuilder: (BuildContext context, int index) {
// return ListTile(
// leading: getCategoryIcon(toDoListEngine.toDoList[index].category),
// title: Text(toDoListEngine.toDoList[index].item),
// iconColor: Theme.of(context).primaryColor,
// textColor: Theme.of(context).primaryColor,
// shape: RoundedRectangleBorder(
// side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
// borderRadius: BorderRadius.circular(5),
// ),
// onTap: () {
// Alert(
// context: context,
// title: toDoListEngine.toDoList[index].category,
// desc: toDoListEngine.toDoList[index].item,
// buttons: [
// DialogButton(
// color: usaflAccent,
// child: const Text('Cancel',
// style: TextStyle(color: Colors.white, fontSize: 20.0),
// ),
// onPressed: () {
// Navigator.pop(context);
// },
// ),
// DialogButton(
// color: usaflAccent,
// child: const Text('Complete',
// style: TextStyle(color: Colors.white, fontSize: 20.0),
// ),
// onPressed: () {
// setState(() {
// toDoListEngine.removeFromList(index);
// });
// Navigator.pop(context);
// },
// ),
// ],
// ).show();
// },
// );
// },
// ),


