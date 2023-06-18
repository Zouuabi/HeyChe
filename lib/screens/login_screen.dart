import 'package:flutter/material.dart';
import 'package:social_media_app/components/notify_user_with_msg.dart';
import 'package:social_media_app/screens/feed_screen.dart';
import '../resources/authentification.dart';

import '../components/text_field.dart';

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
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // my app logo

                    Image.asset(
                      'assets/testlogo.png',
                      width: 200,
                      height: 200,
                    ),

                    const SizedBox(height: 20),

                    // email field
                    TextFieldInput(
                        icon: Icons.email_outlined,
                        hintText: 'Enter your email',
                        keyboardType: TextInputType.emailAddress,
                        textController: _emailController),

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

                    ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                              const Size(double.maxFinite * 0.5, 50))),
                      onPressed: loginUser,
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 20),

                    //*** Don't have an Account  Sign Up ***
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account ?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, 'SignUpScreen');
                          },
                          child: const Text('Sign up'),
                        )
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
