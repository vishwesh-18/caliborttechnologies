import 'dart:convert';
import 'package:caliborttechnologies/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../comman/routes/routes_names.dart';
import '../../../comman/values/constant.dart';
import '../../../comman/widgets/toastInfo.dart';
import '../../../global.dart';

class SigninController {
  final BuildContext context;
  const SigninController({required this.context});

  Future<void> handleSignin(String type) async {
    if (type == "email") {
      final state = context.read<SignInBloc>().state;
      String emailAddress = state.email;
      String password = state.password;

      if (emailAddress.isEmpty) {
        toastInfo(msg: 'You need to fill email address');
        return;
      }
      if (password.isEmpty) {
        toastInfo(msg: 'You need to fill password');
        return;
      }

      try {
        final response = await http.post(
          Uri.parse("https://reqres.in/api/login"),
          headers: {
            "Content-Type": "application/json",
            "x-api-key": "reqres-free-v1"
          },
          body: jsonEncode({
            "email": emailAddress,
            "password": password,
          }),
        );
        print(response.body);

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final token = data['token'];
          toastInfo(msg: token);
          Global.storageService.setString(AppConstant.USER_TOKEN_KEY, token);
          Global.storageService.setBool(AppConstant.FIRST_OPENED, true);

          print('Navigating to  users screen');
          Navigator.of(context).pushNamedAndRemoveUntil(
            RoutesNames.APPLICATION,
            (route) => false,
          );
          if (context.mounted) {
            // await HomePageController(context: context).init();
          }
        } else {
          final error = jsonDecode(response.body)['error'];
          toastInfo(msg: "Login failed: $error");
        }
      } catch (e) {
        toastInfo(msg: "An error occurred: $e");
      }
    }
  }
}
