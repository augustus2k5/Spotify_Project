import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:spotify/presentation/choose_mode/widgets/mode_circle.dart';

class ChooseMode extends StatefulWidget {
  const ChooseMode({super.key});

  @override
  State<ChooseMode> createState() => _ChooseModeState();
}

class _ChooseModeState extends State<ChooseMode> {
  ThemeMode? _selectedMode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.chooseMode),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60),
                SvgPicture.asset(AppVectors.logo),
                Spacer(),
                Column(
                  children: [
                    Text(
                      "Choose Mode",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(onTap: () {
                          setState(() {
                            _selectedMode = ThemeMode.dark;
                          });
                        }, child: ModeCircle(vector: AppVectors.moon, isSelected: _selectedMode == ThemeMode.dark,)),
                        SizedBox(width: 40),
                        GestureDetector(onTap: () {
                          setState(() {
                            _selectedMode = ThemeMode.light;
                          });
                        }, child: ModeCircle(vector: AppVectors.sun, isSelected: _selectedMode == ThemeMode.light,)),
                      ],
                    ),
                    SizedBox(height: 60),
                    BasicAppButton(
                      onPressed: () => context.read<ThemeCubit>().updateTheme(_selectedMode),
                      title: "Continue",
                      height: 50,
                    ),
                  ],
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


