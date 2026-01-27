import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';

class SignupOrSignin extends StatelessWidget {
  const SignupOrSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset(AppVectors.top_pattern),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset(AppVectors.bottom_pattern),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(AppImages.auth_bg)
        ),
        
      ],
    ),
    );
  }
}
