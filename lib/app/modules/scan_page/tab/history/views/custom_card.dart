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
        size.width * 0.8517711,
        size.height * 0.3240741,
        size.width * 0.8772425,
        size.height * 0.2287269,
        size.width * 0.8772425,
        size.height * 0.1111111);
    path_0.lineTo(size.width * 0.9564033, size.height * 0.1111111);
    path_0.lineTo(size.width * 0.9564033, size.height * 0.8148148);
    path_0.lineTo(size.width * 0.04359673, size.height * 0.8148148);
    path_0.lineTo(size.width * 0.04359673, size.height * 0.1111111);
    path_0.lineTo(size.width * 0.7634523, size.height * 0.1111111);
    path_0.cubicTo(
        size.width * 0.7634523,
        size.height * 0.2287269,
        size.width * 0.7889264,
        size.height * 0.3240741,
        size.width * 0.8203488,
        size.height * 0.3240741);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = color.withOpacity(1.0);
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(size.width * 0.8203488, size.height * 0.1388889),
            width: size.width * 0.05936948,
            height: size.height * 0.2222222),
        paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
