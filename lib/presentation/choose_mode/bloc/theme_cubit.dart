import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark); // Thememode.System

  void updateTheme(ThemeMode? themeMode) => emit(themeMode ?? ThemeMode.system);
}
