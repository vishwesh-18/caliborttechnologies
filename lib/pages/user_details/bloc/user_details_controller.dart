import 'package:caliborttechnologies/comman/entities/user_model.dart';
import 'package:caliborttechnologies/pages/user_details/bloc/user_details_bloc.dart';
import 'package:caliborttechnologies/pages/user_details/bloc/user_details_event.dart';
import 'package:caliborttechnologies/pages/user_details/bloc/user_details_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsController {
  final BuildContext context;
  UserDetailsController(this.context);
  UserModel? user;

  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    user = args['user'];
    print(user?.firstName);
    print(user?.email);
    print(user?.avatar);
    print(user?.id);
    if (user != null) {
      context.read<UserDetailsBloc>().add(LoadUserDetails(user!));
    }
  }
}
