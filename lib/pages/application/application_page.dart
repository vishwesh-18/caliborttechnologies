
import 'package:caliborttechnologies/pages/application/widgets/application_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../comman/values/colors.dart';
import 'bloc/app_blocs.dart';
import 'bloc/app_event.dart';
import 'bloc/app_states.dart';


class ApplicationPage extends StatefulWidget {
  ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int indext = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc,AppState>(builder: (context, state) {
      return  Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
                body: BuildPage(state.index),
                bottomNavigationBar: Container(
                  width: 375.w,
                  height: 58.h,
                  decoration: BoxDecoration(
                      color: AppColors.primaryElement,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.h),
                          topRight: Radius.circular(20.h)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                        )
                      ]),
                  child: Container(
                    child: BottomNavigationBar(
                        backgroundColor: Colors.white,

                        currentIndex: state.index,
                        type: BottomNavigationBarType.fixed,
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        selectedItemColor: AppColors.primaryElement,
                        unselectedItemColor: AppColors.primaryFourElementText,
                        onTap: (value) {
                          context.read<AppBloc>().add(TriggerAppEvent(value));
                        },
                        elevation: 0,
                        items: bottomTabs),
                  ),
                ))),
      );
    },);
  }
}
