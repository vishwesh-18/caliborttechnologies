import 'package:caliborttechnologies/pages/sign_up/widgets/register_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/regiseter_state.dart';
import 'bloc/register_blocs.dart';
import 'bloc/register_controller.dart';
import 'bloc/register_event.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void initState() {
    super.initState();
    // locationName();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
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
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  margin: EdgeInsets.only(top: 60.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reuseableText("User name"),
                      buildTextField("Enter your user name", "name", Icons.person,
                          (value) {
                        context.read<RegisterBloc>().add(UsernameEvent(value!));
                      }),
                      reuseableText("Email"),
                      buildTextField(
                          "Enter your email address", "Email", Icons.person, (value) {
                        context.read<RegisterBloc>().add(EmailEventR(value!));
                      }),
                      reuseableText("Password"),
                      buildTextField("Enter your password", "password", Icons.lock,
                          (value) {
                        context
                            .read<RegisterBloc>()
                            .add(PasswordEventR(value!));
                      }),
                      reuseableText("Confirm Password"),
                      buildTextField(
                          "Re-Enter your password", "password", Icons.lock,
                          (value) {
                        context
                            .read<RegisterBloc>()
                            .add(RePasswordEvent(value!));
                      }),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25.h),
                  child: reuseableText(
                      "By creating account you have to agree our terms and conditions"),
                ),
                buildLogInReUseButton(
                  "Sign up",
                  "login ",
                  () {
                    RegisterController(context:context).handleEmailRegister();
                  },
                ),
              ],
            ),
          ),
        )),
      );
    });
  }
}
