import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../comman/routes/routes_names.dart';
import '../sign_up/widgets/register_widgets.dart';
import 'bloc/sign_in_blocs.dart';
import 'bloc/sign_in_controller.dart';
import 'bloc/sign_in_states.dart';
import 'bloc/sing_in_event.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            backgroundColor: Colors.white,
            appBar: BuildAppBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 86.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reuseableText("Email"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Enter your email address", "Email", Icons.person,
                            (value) {
                          context.read<SignInBloc>().add(EmailEvent(value!));
                        }),
                        reuseableText("Password"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Enter your password", "password", Icons.lock,
                            (value) {
                          context.read<SignInBloc>().add(PasswordEvent(value!));
                        }),
                      ],
                    ),
                  ),
                  forgotPassword(),
                  SizedBox(
                    height: 70.h,
                  ),
                  buildLogInReUseButton(
                    "Log In",
                    "login",
                    () {
                      print("login button");
                      SigninController(context: context).handleSignin("email");
                    },
                  ),
                  buildLogInReUseButton(
                    "Register",
                    "register",
                    () {
                      Navigator.of(context).pushNamed(
                        RoutesNames.RAGISTER,
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
