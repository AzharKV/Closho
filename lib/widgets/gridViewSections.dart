import 'package:closho/constants/colors.dart';
import 'package:flutter/material.dart';

class GridViewSections extends StatelessWidget {
  final String title;
  final String count;

  const GridViewSections({Key? key, required this.title, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal.withOpacity(0.5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: customWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Text(
            count,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: customWhite, fontWeight: FontWeight.bold, fontSize: 40),
          ),
        ],
      ),
    );
  }
}
