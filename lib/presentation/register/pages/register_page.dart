import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:social_media_app/core/img_picker.dart';
import 'package:social_media_app/core/utils/color_manager.dart';
import 'package:social_media_app/core/utils/strings_manager.dart';
import 'package:social_media_app/core/utils/styles_manager.dart';
import 'package:social_media_app/core/utils/values_manager.dart';
import 'package:social_media_app/injector.dart';
import 'package:social_media_app/presentation/login/pages/login_page.dart';
import 'package:social_media_app/presentation/register/cubit/register_cubit.dart';
import 'package:social_media_app/presentation/shared/widgets/alert.dart';
import 'package:social_media_app/presentation/shared/widgets/widgets.dart';

import '../../../config/routes/routes.dart';
import '../widgets/profile_image.dart';
import '../widgets/registration_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const String id = '/registerScreen';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

@override
void initState() {
  //! just for testing 
  // this is for the dependency injection
  // initRegisterModule();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterCubit _registerCubit = instance<RegisterCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (ctx) => _registerCubit,
        child: Scaffold(
          appBar: _getAppBar(context),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: BlocConsumer<RegisterCubit, RegisterState>(
                listener: (context, state) async {
              if (state is RegisterError) {
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return MyAlert(
                          message: state.message,
                          title: 'Error !',
                          actionText: 'Try Again');
                    });
              } else if (state is RegisterComplete) {
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return MyAlert(
                          action: () {
                            Navigator.pushReplacementNamed(
                                context, LoginPage.id);
                          },
                          message: 'You have successfully registered',
                          title: 'Success',
                          actionText: 'Login');
                    });
              }
            }, builder: (context, state) {
              return state is RegisterLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// size overrflow when keyboard opened
                        /// wrapping first widget with a flexible worked magically
                        ///or ty to fix it with the singleChildSCrollView and its related isssues
                        Flexible(
                          flex: 2,
                          child: ProfileImage(
                            onAdd: () async {
                              BlocProvider.of<RegisterCubit>(context)
                                  .photofile = await pickImage();
                            },
                            image: null,
                          ),
                        ),
                        RegisterationForm(
                          usernameController:
                              BlocProvider.of<RegisterCubit>(context)
                                  .usernameController,
                          emailController:
                              BlocProvider.of<RegisterCubit>(context)
                                  .emailController,
                          bioController: BlocProvider.of<RegisterCubit>(context)
                              .bioController,
                          passwordController:
                              BlocProvider.of<RegisterCubit>(context)
                                  .passwordController,
                        ),

                        StandardButton(
                            onPressed: () {
                              BlocProvider.of<RegisterCubit>(context)
                                  .register();
                            },
                            label: StringsManager.register)
                      ],
                    );
            }),
          )),
        ));
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: Text(
          StringsManager.register,
          style:
              getRegularStyle(fontSize: AppSize.s20, color: ColorManager.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, LoginPage.id);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.white,
          ),
        ));
  }
}
