import 'package:flutter/material.dart';

import 'package:social_media_app/core/utils/app_images.dart';
import 'package:social_media_app/presentation/feed/feed_screen.dart';
import '../shared.dart';
import '../../data/authentification.dart';

// ! ephermal state so we better use satatefull widget

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool loadingLogin = false;

  void loginUser() async {
    setState(() {
      loadingLogin = true;
    });

    String status = await Auth().singInUser(
        email: _emailController.text, password: _passwordController.text);

    if (status != 'Success') {
      setState(() {
        loadingLogin = false;
      });
      // ignore: use_build_context_synchronously
      notifyUserWithMsg(context, status);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacementNamed(FeedScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: loadingLogin
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // my app logo

                      Image.asset(
                        AppImages.logo,
                        width: 200,
                        height: 200,
                      ),

                      const SizedBox(height: 20),

                      // email field
                      TextFieldInput(
                        icon: Icons.email_outlined,
                        hintText: 'Enter your email',
                        keyboardType: TextInputType.emailAddress,
                        textController: _emailController,
                        isPassword: false,
                      ),

                      // password field

                      const SizedBox(height: 20),

                      TextFieldInput(
                        icon: Icons.key,
                        hintText: 'password',
                        isPassword: true,
                        keyboardType: TextInputType.visiblePassword,
                        textController: _passwordController,
                      ),

                      const SizedBox(height: 20),

                      // *** Login Button ***

                      StandardButton(
                          onPressed: () {
                            loginUser();
                          },
                          label: 'Login'),
                      const SizedBox(height: 20),

                      //*** Don't have an Account  Sign Up ***
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account ?'),
                          StandardTextButton(
                            label: 'Sign Up',
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, 'SignUpScreen');
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
