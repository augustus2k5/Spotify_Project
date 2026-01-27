import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ModeCircle extends StatelessWidget {
  
  const ModeCircle({
    super.key,
    required this.vector,
    required this.isSelected
  });

  final String vector;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.greenAccent.withValues(alpha: .3)
                : const Color(0xff30393C),
            shape: BoxShape.circle,
            border: isSelected
                ? Border.all(color: Colors.white, width: 2)
                : null,
          ),
          child: SvgPicture.asset(
            vector,
            fit: BoxFit.none,
          ),
        ),
      ),
    );
  }
}