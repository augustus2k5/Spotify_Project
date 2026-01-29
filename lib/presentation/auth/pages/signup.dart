import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/auth/pages/signin.dart';
import 'package:spotify/presentation/common/bloc/theme_cubit.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  ThemeMode? _selectedMode;
  @override
  void initState() {
    super.initState();
    _selectedMode = context.read<ThemeCubit>().state;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset(AppVectors.logo, width: 150),
        actions: [
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, mode) {
              return IconButton(
                icon: Icon(
                  mode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
                ),
                onPressed: () {
                  context.read<ThemeCubit>().updateTheme(
                    mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight:
                MediaQuery.of(context).size.height -
                kToolbarHeight -
                MediaQuery.of(context).padding.top,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
              ),
              const SizedBox(height: 100),

              TextField(decoration: InputDecoration(hintText: "Full name")),
              const SizedBox(height: 15),

              TextField(decoration: InputDecoration(hintText: "Email")),
              const SizedBox(height: 15),

              TextField(
                decoration: InputDecoration(hintText: "Password"),
                obscureText: true,
              ),

              const SizedBox(height: 20),
              BasicAppButton(onPressed: () {}, title: "Create Account"),

              const SizedBox(height: 90),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Do you have an account? ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const Signin()),
                      );
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
