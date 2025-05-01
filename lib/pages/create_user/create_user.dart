import 'package:caliborttechnologies/pages/create_user/widgets/create_user_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../comman/service/imagepicker_service.dart';
import '../../comman/widgets/base_appbar-widget.dart';
import 'bloc/create_user_bloc.dart';
import 'bloc/create_user_events.dart';
import 'bloc/create_user_states.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final pickerService = ImagePickerService();
  @override
  void initState() {
    super.initState();
    context.read<CreateUserBloc>().add(ResetUserState());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: BuildAppBar("Create User"),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: BlocBuilder<CreateUserBloc, CreateUserStates>(
              builder: (context, state) {
                return Column(
                  children: [
                    if (state.imageFile != null)
                      pickedImageWidget(state.imageFile!,
                          backGroundColor: Colors.white38)
                    else
                      reusablePickImageButton(Icons.image, onTap: () {
                        context.read<CreateUserBloc>().add(ImagePickedEvent());
                      }),
                    SizedBox(
                      height: 15.h,
                    ),
                    userBuildTextField("User Name", Icons.person, () {},
                        func: (value) {
                      context
                          .read<CreateUserBloc>()
                          .add(UserNameChanged(value!));
                    }),
                    userBuildTextField("job", Icons.work, () {}, func: (value) {
                      context
                          .read<CreateUserBloc>()
                          .add(UserJobChanged(value!));
                    }),
                    createReUseButton("Save", () async {
                      context.read<CreateUserBloc>().add(SaveUserEvent());
                    }),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                );
              },
            ),
          ),
        ));
  }
}
