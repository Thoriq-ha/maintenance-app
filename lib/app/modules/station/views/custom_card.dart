import 'package:flutter/material.dart';

// //Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(WIDTH, (WIDTH*0.29427792915531337).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//     painter: RPSCustomPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  Color color;
  RPSCustomPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8203488, size.height * 0.3240741);
    path_0.cubicTo(
        size.width * 0.8390599,
        size.height * 0.3240741,
        size.width * 0.8556649,
        size.height * 0.2902593,
        size.width * 0.8660327,
        size.height * 0.2380639);
    path_0.cubicTo(
        size.width * 0.8782643,
        size.height * 0.1764991,
        size.width * 0.8949646,
        size.height * 0.1111111,
        size.width * 0.9168229,
        size.height * 0.1111111);
    path_0.lineTo(size.width * 0.9168229, size.height * 0.1111111);
    path_0.cubicTo(
        size.width * 0.9386839,
        size.height * 0.1111111,
        size.width * 0.9564033,
        size.height * 0.1713278,
        size.width * 0.9564033,
        size.height * 0.2456093);
    path_0.lineTo(size.width * 0.9564033, size.height * 0.6666667);
    path_0.cubicTo(
        size.width * 0.9564033,
        size.height * 0.7484870,
        size.width * 0.9368856,
        size.height * 0.8148148,
        size.width * 0.9128065,
        size.height * 0.8148148);
    path_0.lineTo(size.width * 0.08719346, size.height * 0.8148148);
    path_0.cubicTo(
        size.width * 0.06311553,
        size.height * 0.8148148,
        size.width * 0.04359673,
        size.height * 0.7484870,
        size.width * 0.04359673,
        size.height * 0.6666667);
    path_0.lineTo(size.width * 0.04359673, size.height * 0.2592593);
    path_0.cubicTo(
        size.width * 0.04359673,
        size.height * 0.1774389,
        size.width * 0.06311553,
        size.height * 0.1111111,
        size.width * 0.08719346,
        size.height * 0.1111111);
    path_0.lineTo(size.width * 0.7198556, size.height * 0.1111111);
    path_0.cubicTo(
        size.width * 0.7439319,
        size.height * 0.1111111,
        size.width * 0.7622861,
        size.height * 0.1844037,
        size.width * 0.7770163,
        size.height * 0.2491287);
    path_0.cubicTo(
        size.width * 0.7874523,
        size.height * 0.2949880,
        size.width * 0.8029918,
        size.height * 0.3240741,
        size.width * 0.8203488,
        size.height * 0.3240741);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = color.withOpacity(1.0);
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(size.width * 0.8203488, size.height * 0.1388889),
            width: size.width * 0.05936948,
            height: size.height * 0.2222222),
        paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
