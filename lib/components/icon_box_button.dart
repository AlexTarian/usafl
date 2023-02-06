import 'package:flutter/material.dart';

class IconBoxButton extends StatelessWidget {
  IconBoxButton({
    required this.icon,
    required this.text,
    this.progress = 0.0,
    this.trailingIcon,
    this.trailingColor,
  });

  final IconData icon;
  final String text;
  final double progress;
  final IconData? trailingIcon;
  final Color? trailingColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 65.0,
          width: double.infinity,
          decoration: BoxDecoration(
             borderRadius: BorderRadius.all(Radius.circular(40)),
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
            borderRadius: BorderRadius.all(Radius.circular(40)),
            border: Border.all(color: Theme.of(context).primaryColor, width: 3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(width: 75.0),
              Flexible(
                flex: 3,
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      trailingIcon,
                      size: 30.0,
                      color: trailingColor,
                    ),
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
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40))),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(icon, size: 30.0, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
