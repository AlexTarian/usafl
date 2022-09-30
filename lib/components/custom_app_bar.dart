import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget {
  customAppBar({
    required this.iconL,
    required this.onPressedL,
    required this.iconR,
    required this.onPressedR,
  });

  final IconData iconL;
  final VoidCallback onPressedL;
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
              onTap: onPressedL,
              child: Icon(
                iconL,
                color: Theme.of(context).primaryColorLight,
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
              color: Theme.of(context).primaryColorLight,
              size: 45.0,
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
