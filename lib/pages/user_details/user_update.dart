import 'package:caliborttechnologies/pages/user_details/bloc/user_details_controller.dart';
import 'package:caliborttechnologies/pages/user_details/widgets/user_details_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../comman/service/imagepicker_service.dart';
import '../../comman/widgets/base_appbar-widget.dart';
import 'bloc/user_details_bloc.dart';
import 'bloc/user_details_event.dart';
import 'bloc/user_details_states.dart';

class UserUpdate extends StatefulWidget {
  const UserUpdate({super.key});

  @override
  State<UserUpdate> createState() => _UserUpdateState();
}

class _UserUpdateState extends State<UserUpdate> {
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
          body: Container(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  profileIconsAdnEditBtn(state.avatar, state.imageFile,
                      () async {
                    context.read<UserDetailsBloc>().add(ImagePickedEvent());
                  }),
                  SizedBox(
                    height: 30,
                  ),
                  buildTextField(
                    "name",
                    Icons.person,
                    () {},
                    controller: nameController,
                    func: (value) {
                      context
                          .read<UserDetailsBloc>()
                          .add(UserNameEvent(value!));
                      print(value);
                    },
                  ),
                  buildTextField("Email", Icons.email, () {},
                      controller: emailController, func: (value) {
                    context.read<UserDetailsBloc>().add(UserEmailEvent(value!));
                  }),
                  buildReUseButton("Save", () {
                    context.read<UserDetailsBloc>().add(UpdateUserDetails(
                        name: state.name,
                        email: state.email,
                        id: state.id,
                        city: "Mukhed"));
                  })
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
