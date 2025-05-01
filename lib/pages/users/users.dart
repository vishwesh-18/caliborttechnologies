import 'package:caliborttechnologies/pages/users/widgets/user_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../comman/apis/user_repository.dart';
import '../../comman/entities/user_model.dart';
import '../../comman/routes/routes_names.dart';
import '../../comman/widgets/base_text_widget.dart';
import '../create_user/widgets/create_user_widgets.dart';
import 'bloc/user_bloc.dart';
import 'bloc/user_event.dart';
import 'bloc/user_state.dart';

class UserListScreen extends StatefulWidget {
  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final UserRepository _userRepository = UserRepository();

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(LoadUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(),
      backgroundColor: Colors.white,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RoutesNames.USERSCREATE);
                          print('hello');
                        },
                        child: reusableManuText("Create user")),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.users.length,
                      itemBuilder: (_, index) {
                        UserModel user = state.users[index];

                        return Dismissible(
                          key: Key(
                              user.id.toString()), // required for Dismissible
                          direction: DismissDirection.endToStart,
                          background: Container(
                            padding: EdgeInsets.only(right: 20.w),
                            alignment: Alignment.centerRight,
                            color: Colors.red,
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                          confirmDismiss: (direction) async {
                            // Show confirmation dialog
                            return await showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text("Confirm"),
                                content: const Text(
                                    "Do you want to delete this user?"),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(ctx).pop(false),
                                    child: const Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(ctx).pop(true),
                                    child: const Text("Delete"),
                                  ),
                                ],
                              ),
                            );
                          },
                          onDismissed: (direction) async {
                            var result =
                                _userRepository.deleteUser(user.id ?? 0);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("User deleted successfully")),
                            );
                            context.read<UserBloc>().add(LoadUsers());
                          },
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  RoutesNames.USERSDETAILS,
                                  arguments: {"user": user});
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: EdgeInsets.only(bottom: 8.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      reusableText(
                                          user.firstName ?? "Not Found"),
                                      reusableText(user.email ?? '',
                                          fontWeight: FontWeight.normal),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                            RoutesNames.USERSUPDATE,
                                            arguments: {"user": user},
                                          );
                                        },
                                        child: const SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: Icon(Icons.edit),
                                        ),
                                      ),
                                      const SizedBox(width: 40),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (state is UserError) {
            return Center(child: Text("conncet to internate"));
          }
          return const Center(child: Text('Press button to load users'));
        },
      ),
    );
  }
}

// ListTile(
//                     title: Text(user.name ?? "Not Found"),
//                     subtitle: Text(user.email ?? ''),
//                   );
