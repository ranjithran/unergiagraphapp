import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final Color color;
  const Dot({Key key, this.color, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: CustomPaint(
        painter: MyPaint(
          color: color
          
        ),
      ),
    );
  }
}

class MyPaint extends CustomPainter {
final Color color;

  MyPaint({this.color});
  @override
  void paint(Canvas canvas, Size size) {
    // below one is big circle and instead of this circle you can draw your shape here.
    canvas.drawCircle(
        Offset(0, 0),
        8,
        Paint()
          ..color = color.withOpacity(0.3)
          ..style
          ..style = PaintingStyle.fill);
    canvas.drawCircle(
        Offset(0, 0),
        5.3,
        Paint()
          ..color = color
          ..style = PaintingStyle.fill);
    // below the circle which you want to create a cropping part.
    canvas.drawCircle(
        Offset(0, 0),
        2.3,
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill);
    

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
