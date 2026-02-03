import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/data/models/auth/signin_user_request.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';
import 'package:spotify/presentation/common/bloc/theme_cubit.dart';
import 'package:spotify/presentation/root/pages/root.dart';
import 'package:spotify/service_locator.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
                "Sign In",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
              ),
              const SizedBox(height: 100),

              TextField(controller: _email, decoration: InputDecoration(hintText: "Email")),
              const SizedBox(height: 15),

              TextField(
                controller: _password,
                decoration: InputDecoration(hintText: "Password"),
                obscureText: true,
              ),

              const SizedBox(height: 20),
              BasicAppButton(onPressed: () async{
                var result = await sl<SigninUseCase>().call(
                    params: SigninUserRequest(
                      email: _email.text.toString(),
                      password: _password.text.toString(),
                    ),
                  );
                  result.fold(
                    (l) {
                      var snackBar = SnackBar(
                        content: Text(l),
                        behavior: SnackBarBehavior.floating,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    (r) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RootPage(),
                        ),
                        (route) => false,
                      );
                    },
                  );
              }, title: "Sign In"),

              const SizedBox(height: 90),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) =>  Signup()),
                      );
                    },
                    child: Text(
                      "Sign up",
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
