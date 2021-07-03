import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizeContainer extends StatelessWidget {
  const SizeContainer({
    Key? key,
    required this.onTap,
    required this.color,
    required this.text,
  }) : super(key: key);

  final Function() onTap;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 10,
      onTap: onTap,
      child: Container(
        height: 25.0,
        width: 25.0,
        padding: EdgeInsets.all(4.0),
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: color,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 2,
                  offset: Offset(1, 1)),
            ],
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: FittedBox(child: Text(text)),
      ),
    );
  }
}