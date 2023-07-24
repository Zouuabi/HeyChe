import 'package:flutter/cupertino.dart' show showCupertinoModalPopup;
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:social_media_app/presentation/login/cubit/login_cubit.dart';
import 'package:social_media_app/presentation/main/main_screen.dart';
import 'package:social_media_app/presentation/register/register.dart';
import 'package:social_media_app/presentation/shared/widgets/text_field.dart';

import '../../../core/utils/images_manager.dart';
import '../../../core/utils/strings_manager.dart';
import '../../../injector.dart';
import '../../shared/widgets/error_alert.dart';
import '../../shared/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'LoginScreen';
  LoginPage({super.key});

  final LoginCubit _loginCubit = instance<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginCubit,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginLoaded) {
                  Navigator.pushNamed(context, MainScreen.id);
                } else if (state is LoginError) {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return ErrorAlert(
                          message: state.message,
                        );
                      });
                }
              },
              builder: (context, state) {
                return state is LoginLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // my app logo

                            Image.asset(
                              ImagesManager.logo,
                              width: 200,
                              height: 200,
                            ),

                            const SizedBox(height: 20),

                            // email field
                            MyTextField(
                              isError: state is TextFieldEmpty &&
                                      state.status == StringsManager.email
                                  ? true
                                  : false,
                              labelText: StringsManager.email,
                              errorMessage: StringsManager.emailIsRequired,
                              icon: Icons.email_outlined,
                              controller: BlocProvider.of<LoginCubit>(context)
                                  .emailController,
                              hintText: 'user@example.com',
                            ),

                            // password field

                            const SizedBox(height: 20),

                            MyTextField(
                              isError: state is TextFieldEmpty &&
                                      state.status == StringsManager.password
                                  ? true
                                  : false,
                              isPassword: true,
                              labelText: StringsManager.password,
                              errorMessage: StringsManager.emailIsRequired,
                              icon: Icons.key,
                              controller: BlocProvider.of<LoginCubit>(context)
                                  .passwordController,
                              hintText: 'enter your password',
                            ),

                            const SizedBox(height: 20),

                            // *** Login Button ***

                            StandardButton(
                                onPressed: () {
                                  BlocProvider.of<LoginCubit>(context).login();

                                  // the the other case preserved in the return of the bloc builder
                                },
                                label: StringsManager.login),
                            const SizedBox(height: 20),

                            //*** Don't have an Account  Sign Up ***
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(StringsManager.registerText),
                                StandardTextButton(
                                  label: StringsManager.register,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, RegisterScreen.id);
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
