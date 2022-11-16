import 'package:flutter/material.dart';

class IconBoxButton extends StatelessWidget {
  IconBoxButton(
      {required this.icon,
      required this.text,
      this.progress = 0.0});

  final IconData icon;
  final String text;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 65.0,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: <double>[progress, progress],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Theme.of(context).primaryColor.withOpacity(0.33),
                Colors.transparent,
              ],
            ),
          ),
          child: Row(
            children: <Widget>[
              SizedBox(width: 75.0),
              Text(''),
            ],
          ),
        ),
        Container(
          height: 65.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border:
                Border.all(color: Theme.of(context).primaryColor, width: 3),
          ),
          child: Row(
            children: <Widget>[
              SizedBox(width: 75.0),
              Flexible(
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 24.0,
                    // fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 65.0,
          width: 65.0,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          child: Icon(icon, size: 30.0, color: Colors.white),
        ),
      ],
    );
  }
}
