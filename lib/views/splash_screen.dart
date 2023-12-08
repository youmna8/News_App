import 'package:flutter/material.dart';
import 'package:news_app_/views/home_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    navigate();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Set the duration of the animation
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 2.0,
    ).animate(_animationController);

    _animationController.forward(); // Start the animation
  }

  void navigate() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return HomeScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 174, 166, 166), // Background color of the splash screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _animation, // Apply the animation to the opacity
              child: Image.asset(
                'assets/l.png',
                height: 80,
                width: 80,
              ), // Display the splash image
            ),
            SizedBox(
              height: 4,
            ),
            Center(
              child: Text(
                'News',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController
        .dispose(); // Dispose the animation controller to prevent memory leaks
    super.dispose();
  }
}
