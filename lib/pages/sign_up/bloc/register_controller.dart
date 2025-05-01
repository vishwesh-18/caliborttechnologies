import 'dart:convert';
import 'package:caliborttechnologies/pages/sign_up/bloc/register_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../comman/widgets/toastInfo.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String username = state.username;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (username.isEmpty) {
      toastInfo(msg: "User name cannot be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email cannot be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password cannot be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Confirm password cannot be empty");
      return;
    }
    if (password != rePassword) {
      toastInfo(msg: "Your password confirmation is wrong");
      return;
    }

    try {
      var response = await http.post(
        Uri.parse("https://reqres.in/api/register"),
        headers: {
          'Content-Type': 'application/json',
          "x-api-key": "reqres-free-v1"
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("Registration success. Token: ${data['token']}");
        toastInfo(msg: "Registration successful! Token: ${data['token']}");
        Navigator.of(context).pop();
      } else {
        var error = jsonDecode(response.body)['error'];
        toastInfo(msg: "Error: $error");
        print(error.toString());
        print(error);
      }
    } catch (e) {
      toastInfo(msg: "An unexpected error occurred: $e");
    }
  }
}
