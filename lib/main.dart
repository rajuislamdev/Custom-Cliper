import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ShapeMacker(),
    );
  }
}

class ShapeMacker extends StatelessWidget {
  const ShapeMacker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Shape Macker'),
      ),
      body: Center(
        child: ClipPath(
          clipper: CustomDesignClipper(),
          child: Container(
            color: Colors.red,
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}

class CustomDesignClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Quadratic bezier curve
    // This method is used to create a quadratic bezier curve.

    // var controlPoint = Offset(size.width / 2, size.height / 2 + 60);
    // var endPoint = Offset(size.width, size.height);
    // Path path = Path() // Start from (0,0)
    //   ..moveTo(size.width / 2, 0)
    //   ..lineTo(0, size.height) // add line p1p2
    //   ..quadraticBezierTo(
    //       controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
    //   ..close();

    // CubicTo
    // This method is used to create a cubic curve by specifying 2 control points and endpoint.

    // var controllPoint1 = Offset(50, size.height - 100);
    // var controllPoint2 = Offset(size.width - 50, size.height);
    // var endPoint = Offset(size.width, size.height - 50);

    // Path path = Path() // Start from (0,0)
    //   ..moveTo(size.width / 2, 0)
    //   ..lineTo(0, size.height - 50)
    //   ..cubicTo(controllPoint1.dx, controllPoint1.dy, controllPoint2.dx,
    //       controllPoint2.dy, endPoint.dx, endPoint.dy);

    // arcToPoint
    //This method is used to draw the arc from the starting point to the specified point. We can customize the arc by setting a radius, clockwise/anti-clockwise direction.
    double radius = 20;
    Path path = Path() // Start from (0,0)
      ..moveTo(radius, 0)
      ..lineTo(size.width - radius, 0)
      ..arcToPoint(Offset(size.width, radius))
      ..lineTo(size.width, size.height - radius)
      ..arcToPoint(Offset(size.width - radius, size.height),
          radius: Radius.circular(radius))
      ..lineTo(radius, size.height)
      ..arcToPoint(Offset(0, size.height - radius),
          radius: Radius.circular(radius), clockwise: false)
      ..lineTo(0, radius)
      ..arcToPoint(Offset(radius, 0), radius: const Radius.elliptical(40, 20))
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
