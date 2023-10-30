import 'package:flutter/material.dart';

class BezierClipper extends CustomClipper<RRect> {
  @override
  RRect getClip(Size size) {
    final rect = RRect.fromLTRBR(0, size.height - 100, size.width, size.height, Radius.circular(16.0));

    // Define your quadratic Bézier curve here.
    final controlPoint = Offset(0, size.height * .7);
    final endPoint = Offset(size.width, size.height - 100);

    final path = Path()
      ..addRRect(rect)
      ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    return RRect.fromRectAndCorners(
      path.getBounds(),
      // bottomLeft: Radius.circular(16.0),
      // bottomRight: Radius.circular(16.0),
    );
  }


  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) {
    return true; // Return true if clipping should be recomputed (e.g., on resize)
  }
}


class AppBarBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width, height = 160;

    Paint paint1 = Paint();
    Path path1 = Path();
    paint1.color = const Color.fromRGBO(16, 27, 44, 1);

    Paint paint2 = Paint();
    Path path2 = Path();
    paint2.color = const Color.fromRGBO(22, 37, 51, 1);

    Paint paint3 = Paint();
    Path path3 = Path();
    // paint3.color = const Color.fromRGBO(250, 250, 250, 1);
    // paint3.color = const Color.fromRGBO(22, 37, 51, 1);
    paint3.color = const Color.fromRGBO(16, 27, 44, 1);
    // paint3.color = Colors.red;
    //
    path2.moveTo(width * .68, 0);
    path2.lineTo(width, 0);
    path2.lineTo(width, height);
    path2.lineTo(0, height);
    path2.lineTo(0, height * .75);
    path2.quadraticBezierTo(width * .7, height * .7, width * .68, 0);
    // canvas.drawPath(path2, paint2);

    path1.moveTo(width * .88, 0);
    path1.lineTo(width, 0);
    path1.lineTo(width, height);
    path1.lineTo(width * .5, height);
    path1.quadraticBezierTo(width * .9, height * .7, width * .88, 0);
    // canvas.drawPath(path1, paint1);
    
    path3.lineTo(0, height * 1.2);
    path3.quadraticBezierTo(width * .25, height * 2.2, width, height * 1.05);
    path3.lineTo(width, 0);
    canvas.drawPath(path3, paint3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}