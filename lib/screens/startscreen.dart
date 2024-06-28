import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_practise_1/screens/imageSlider.dart';

class Startscreen extends StatefulWidget {
  const Startscreen({super.key});

  @override
  State<Startscreen> createState() => _StartscreenState();
}

class _StartscreenState extends State<Startscreen> {
  @override
  void initState() {
    super.initState();
    _navigateToImageSlider();
  }

  void _navigateToImageSlider() {
    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Imageslider(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 380, left: 20),
        child: SizedBox(
          height: 80,
          child: DefaultTextStyle(
            style: const TextStyle(
              color: Colors.amber,
              fontFamily: 'X Company',
              fontWeight: FontWeight.bold,
              fontSize: 80,
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              isRepeatingAnimation: true,
              animatedTexts: [
                TyperAnimatedText(
                  'ODYSSEY',
                  speed: const Duration(milliseconds: 200),
                ),
                FadeAnimatedText(
                  'ODYSSEY',
                  duration: const Duration(milliseconds: 2500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
