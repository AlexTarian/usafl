import 'package:flutter/material.dart';
import 'package:usafl/components/nav_menu.dart';

class customAppBar extends StatelessWidget {
  customAppBar({
    //required this.iconL,
    //required this.onPressedL,
    required this.iconR,
    required this.onPressedR,
  });

  //final IconData iconL;
  //final VoidCallback onPressedL;
  final IconData iconR;
  final VoidCallback onPressedR;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 85.0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Builder(
            builder: (context) => GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Icon(Icons.menu,
                color: Colors.white,
                size: 45.0,
              ),
            ),
          ),
          GestureDetector(
            onTap: null,
            child: const Image(
              image: AssetImage('assets/images/USAFL Logo White.png'),
              height: 65.0,
            ),
          ),
          GestureDetector(
            onTap: onPressedR,
            child: Icon(
              iconR,
              color: Colors.white,
              size: 45.0,
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
