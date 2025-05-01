import 'package:caliborttechnologies/comman/widgets/base_text_widget.dart';
import 'package:caliborttechnologies/pages/user_details/bloc/user_details_controller.dart';
import 'package:caliborttechnologies/pages/user_details/widgets/user_details_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../comman/widgets/base_appbar-widget.dart';
import 'bloc/user_details_bloc.dart';
import 'bloc/user_details_event.dart';
import 'bloc/user_details_states.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserUpdateState();
}

class _UserUpdateState extends State<UserDetails> {
  late UserDetailsController _userDetailsController;

  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    _userDetailsController = UserDetailsController(context);
    _userDetailsController.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {
        nameController.value = TextEditingValue(
          text: state.name,
          selection: TextSelection.collapsed(offset: state.name.length),
        );
        emailController.value = TextEditingValue(
          text: state.email,
          selection: TextSelection.collapsed(offset: state.email.length),
        );

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: BuildAppBar(state.name!),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                  profileIconsAdnEditBtn(state.avatar,state.imageFile,(){}),
                  reusableText(state.name),
                  reusableText(state.lastName),
                  reusableText(state.email),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
