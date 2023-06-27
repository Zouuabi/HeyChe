import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:social_media_app/core/utils/app_images.dart';
import 'package:social_media_app/presentation/shared.dart';

import '../../data/authentification.dart';
import '../../core/img_picker.dart';
import '../feed/feed_screen.dart';
import 'login_screen.dart';

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
        file: _image);

    if (status != 'Success') {
      setState(() {
        loadingSignUp = false;
      });
      // ignore: use_build_context_synchronously
      notifyUserWithMsg(ctx, status);
    } else {
      await Auth().singInUser(
          email: _emailController.text, password: _passwordController.text);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacementNamed(FeedScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
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
                    child: ProfileImage(onAdd: selectImg, image: _image),
                  ),
                  _getForm(),

                  StandardButton(
                      onPressed: () {
                        signUpUser(context);
                      },
                      label: 'Sign Up')
                ],
              ),
      )),
    );
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: Image.asset(
          AppImages.logo,
          width: 50,
          height: 50,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.purple,
          ),
        ));
  }

  Widget _getForm() {
    return Column(
      children: [
        const SizedBox(height: 20),
        TextFieldInput(
          icon: null,
          hintText: 'Enter your username',
          keyboardType: TextInputType.text,
          textController: _usernameController,
          isPassword: false,
        ),
        const SizedBox(height: 20),
        TextFieldInput(
          icon: null,
          hintText: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          textController: _emailController,
          isPassword: false,
        ),
        const SizedBox(height: 20),
        TextFieldInput(
          icon: null,
          hintText: 'Enter your Bio',
          keyboardType: TextInputType.text,
          textController: _bioController,
          isPassword: false,
        ),
        const SizedBox(height: 20),
        TextFieldInput(
          icon: null,
          hintText: 'Enter your password',
          keyboardType: TextInputType.visiblePassword,
          textController: _passwordController,
          isPassword: true,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
