import 'package:flutter/material.dart';

class TextRightIconButton extends StatelessWidget {
  const TextRightIconButton({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  final String text;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: Color(0xff797373),
      padding: EdgeInsets.all(0.0),
      onPressed: onPress,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          SizedBox(width: 5.0),
          Icon(Icons.arrow_forward_ios, size: 15)
        ],
      ),
    );
  }
}
