import 'package:flutter/material.dart';

class SemiCirclePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.grey.withOpacity(0.09)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0006133, size.height * 0.1289929);
    path_0.quadraticBezierTo(size.width * 0.1016800, size.height * 0.1399574,
        size.width * 0.1014133, size.height * 0.2125106);
    path_0.quadraticBezierTo(size.width * 0.1017333, size.height * 0.2837447,
        size.width * 0.0001867, size.height * 0.2978440);
    path_0.lineTo(size.width * 0.0008800, size.height * 0.3502270);
    path_0.quadraticBezierTo(size.width * 0.1960533, size.height * 0.3188936,
        size.width * 0.1962133, size.height * 0.2134894);
    path_0.quadraticBezierTo(size.width * 0.1983733, size.height * 0.1053759,
        size.width * 0.0004800, size.height * 0.0750496);
    path_0.lineTo(size.width * 0.0006133, size.height * 0.1289929);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
