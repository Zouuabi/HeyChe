import 'package:flutter/material.dart';

import '../../../core/utils/strings_manager.dart';
import '../../shared/widgets/text_field.dart';

class RegisterationForm extends StatelessWidget {
  const RegisterationForm({
    super.key,
    required TextEditingController usernameController,
    required TextEditingController emailController,
    required TextEditingController bioController,
    required TextEditingController passwordController,
  })  : _usernameController = usernameController,
        _emailController = emailController,
        _bioController = bioController,
        _passwordController = passwordController;

  final TextEditingController _usernameController;
  final TextEditingController _emailController;
  final TextEditingController _bioController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        MyTextField(
          errorMessage: 'df',
          labelText: StringsManager.username,
          icon: Icons.person_2_outlined,
          hintText: 'Enter your username',
          keyboardType: TextInputType.text,
          controller: _usernameController,
          isPassword: false,
        ),
        const SizedBox(height: 20),
        MyTextField(
          labelText: StringsManager.email,
          errorMessage: 'dffg',
          icon: Icons.email_outlined,
          hintText: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          controller: _emailController,
          isPassword: false,
        ),
        const SizedBox(height: 20),
        MyTextField(
          labelText: StringsManager.bio,
          errorMessage: 'bio',
          icon: Icons.text_fields,
          hintText: 'Enter your Bio',
          keyboardType: TextInputType.text,
          controller: _bioController,
          isPassword: false,
        ),
        const SizedBox(height: 20),
        MyTextField(
          isError: false,
          labelText: StringsManager.password,
          errorMessage: 'password required',
          icon: Icons.key,
          hintText: 'Enter your password',
          keyboardType: TextInputType.visiblePassword,
          controller: _passwordController,
          isPassword: true,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
