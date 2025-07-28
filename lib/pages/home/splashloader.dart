import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/pages/home/home.dart';
import 'package:portfolio/utils/constants.dart';

class SplashLoader extends StatefulWidget {
  @override
  State<SplashLoader> createState() => _SplashLoaderState();
}

class _SplashLoaderState extends State<SplashLoader>
    with TickerProviderStateMixin {
  String loadingline = "Loading...";
  late AnimationController triangleController;
  late AnimationController ballController;
  late Timer textTimer;

  final List<String> loadingLines = [
    "Still faster than Windows Update...",
    "Feeding the hamsters...",
    "Polishing the pixels...",
    "Borrowing RAM from your toaster...",
    "Almost done. Maybe.",
  ];

  bool isHomeReady = false;

  @override
  void initState() {
    super.initState();

    triangleController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();

    ballController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800))
          ..repeat(reverse: true);

    textTimer = Timer.periodic(Duration(seconds: 4), (timer) {
      setState(() {
        loadingline = (loadingLines..shuffle()).first;
      });
    });

    loadApp();
  }

  Future<void> loadApp() async {
    await Future.delayed(Duration(seconds: 10));
    setState(() {
      isHomeReady = true;
    });
  }

  @override
  void dispose() {
    textTimer.cancel();
    triangleController.dispose();
    ballController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isHomeReady) {
      return Home();
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
          child: SizedBox(
        width: 200,
        height: 300,
        child: AnimatedBuilder(
          animation: Listenable.merge([triangleController, ballController]),
          builder: (context, child) {
            final rotation = triangleController.value * 2 * pi;

            final centerX = 90.0;
            final centerY = 90.0;

            final topX = centerX;
            final topY = centerY - 60;

            final rotatedX = centerX +
                (topX - centerX) * cos(rotation) -
                (topY - centerY) * sin(rotation);
            final rotatedY = centerY +
                (topX - centerX) * sin(rotation) -
                (topY - centerY) * cos(rotation);

            final bounceOffset = -30 * sin(ballController.value * pi);

            return Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 50,
                  top: 60,
                  child: Transform.rotate(
                    angle: rotation,
                    child: CustomPaint(
                      size: Size(100, 100),
                      painter: TrianglePainter(),
                    ),
                  ),
                ),
                Positioned(
                  left: rotatedX - 15,
                  top: rotatedY + bounceOffset - 15,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.pink, shape: BoxShape.circle),
                  ),
                ),
                Positioned(
                    top: 220,
                    left: 0,
                    right: 0,
                    child: Text(
                      loadingline,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
              ],
            );
          },
        ),
      )),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.cyanAccent;
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
