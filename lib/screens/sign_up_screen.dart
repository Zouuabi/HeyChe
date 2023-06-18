import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:social_media_app/screens/login_screen.dart';

import '../resources/img_picker.dart';
import '../components/notify_user_with_msg.dart';
import '../components/text_field.dart';
import '../resources/authentification.dart';
import 'feed_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String id = 'SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Uint8List? _image;
  bool loadingSignUp = false;

  void selectImg() async {
    Uint8List? img = await pickImage();
    setState(() {
      _image = img;
    });
    return; 
  }

  signUpUser(BuildContext ctx) async {
    setState(() {
      loadingSignUp = true;
    });
    String status = await Auth().signUpUser(
        username: _usernameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        bio: _bioController.text,
        file: _image!);

    if (status != 'Success') {
      setState(() {
        loadingSignUp = false;
      });
      // ignore: use_build_context_synchronously
      notifyUserWithMsg(ctx, status);
    } else {
      await Auth().singInUser(
          email: _emailController.text, password: _passwordController.text);
      Navigator.of(context).pushReplacementNamed(FeedScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'assets/testlogo.png',
            width: 50,
            height: 50,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, LoginScreen.id);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.purple,
            ),
          )),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: loadingSignUp
            ? const Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //! size overrflow when keyboard opened
                  //! wrapping first widget with a flexible worked magically
                  //! or ty to fix it with the singleChildSCrollView and its related isssues
                  Flexible(
                    flex: 2,
                    child: Stack(
                      children: [
                        Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 168, 129, 174)),
                            width: 90,
                            height: 90,
                            child: _image == null
                                ? const Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.white,
                                  )
                                : Image.memory(
                                    //! selected image appearance must be recoded
                                    _image!,
                                    fit: BoxFit.cover,
                                  )),
                        Positioned(
                          bottom: -10,
                          left: 45,
                          child: IconButton(
                            onPressed: selectImg,
                            icon: const Icon(
                              Icons.add_a_photo,
                              color: Color.fromARGB(255, 112, 7, 130),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFieldInput(
                      icon: null,
                      hintText: 'Enter your username',
                      keyboardType: TextInputType.text,
                      textController: _usernameController),
                  const SizedBox(height: 20),
                  TextFieldInput(
                      icon: null,
                      hintText: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                      textController: _emailController),
                  const SizedBox(height: 20),
                  TextFieldInput(
                      icon: null,
                      hintText: 'Enter your Bio',
                      keyboardType: TextInputType.text,
                      textController: _bioController),
                  const SizedBox(height: 20),
                  TextFieldInput(
                    icon: null,
                    hintText: 'Enter your password',
                    keyboardType: TextInputType.visiblePassword,
                    textController: _passwordController,
                    isPassword: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            const Size(double.maxFinite * 0.5, 50))),
                    onPressed: () async {
                      signUpUser(context);
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
      )),
    );
  }
}
