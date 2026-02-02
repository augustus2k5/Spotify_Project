import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/firebase_options.dart';
import 'package:spotify/presentation/get_started/pages/get_started.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _init();
    redirect();
  }
 
  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset(AppVectors.logo));
  }

  Future<void> redirect() async {
    await Future.delayed(Duration(seconds: 2),
     () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GetStarted()),
      );
    });
  }

  Future<void> _init() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // điều hướng tiếp
}
}

