import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:social_media_app/core/utils/color_manager.dart';
import 'package:social_media_app/core/utils/strings_manager.dart';
import 'package:social_media_app/core/utils/styles_manager.dart';
import 'package:social_media_app/core/utils/values_manager.dart';
import 'package:social_media_app/presentation/register/cubit/register_cubit.dart';
import 'package:social_media_app/presentation/shared/widgets/widgets.dart';

import '../../../core/img_picker.dart';
import '../widgets/profile_image.dart';
import '../widgets/registration_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const String id = '/registerScreen';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Uint8List? _image;
  bool loadingSignUp = false;

  void selectImg() async {
    Uint8List? img = await pickImage();
    setState(() {
      _image = img;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (ctx) => RegisterCubit(),
      child: Scaffold(
        appBar: _getAppBar(context),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: BlocConsumer(
              listener: (ctx, state) {},
              builder: (ctx, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //! size overrflow when keyboard opened
                    //! wrapping first widget with a flexible worked magically
                    //! or ty to fix it with the singleChildSCrollView and its related isssues
                    Flexible(
                      flex: 2,
                      child: ProfileImage(onAdd: selectImg, image: _image),
                    ),
                    RegisterationForm(
                      usernameController:
                          BlocProvider.of<RegisterCubit>(context)
                              .usernameController,
                      emailController: BlocProvider.of<RegisterCubit>(context)
                          .emailController,
                      bioController:
                          BlocProvider.of<RegisterCubit>(context).bioController,
                      passwordController:
                          BlocProvider.of<RegisterCubit>(context)
                              .passwordController,
                    ),

                    StandardButton(
                        onPressed: () {}, label: StringsManager.register)
                  ],
                );
              }),
        )),
      ),
    );
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
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.white,
          ),
        ));
  }
}
