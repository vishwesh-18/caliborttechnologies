import 'package:caliborttechnologies/comman/routes/routes_names.dart';
import 'package:caliborttechnologies/pages/application/application_page.dart';
import 'package:caliborttechnologies/pages/create_user/bloc/create_user_bloc.dart';
import 'package:caliborttechnologies/pages/create_user/create_user.dart';
import 'package:caliborttechnologies/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:caliborttechnologies/pages/user_details/bloc/user_details_bloc.dart';
import 'package:caliborttechnologies/pages/user_details/user_details.dart';
import 'package:caliborttechnologies/pages/users/bloc/user_bloc.dart';
import 'package:caliborttechnologies/pages/users/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../global.dart';
import '../../pages/application/bloc/app_blocs.dart';
import '../../pages/sign_up/register.dart';
import '../../pages/sign_in/sign_in.dart';
import '../../pages/sign_up/bloc/register_blocs.dart';
import '../../pages/user_details/user_update.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: RoutesNames.INITIAL,
          page: const SignIn(),
          bloc: BlocProvider(create: (_) => SignInBloc())),
      PageEntity(
          route: RoutesNames.RAGISTER,
          page: const Register(),
          bloc: BlocProvider(create: (_) => RegisterBloc())),
      PageEntity(
          route: RoutesNames.APPLICATION,
          page: ApplicationPage(),
          bloc: BlocProvider(create: (_) => AppBloc())),
      PageEntity(
          route: RoutesNames.USERS,
          page: UserListScreen(),
          bloc: BlocProvider(create: (_) => UserBloc())),
      PageEntity(
          route: RoutesNames.USERSUPDATE,
          page: const UserUpdate(),
          bloc: BlocProvider(create: (_) => UserDetailsBloc())),
      PageEntity(
          route: RoutesNames.USERSDETAILS,
          page: const UserDetails(),
          bloc: BlocProvider(create: (_) => UserDetailsBloc())),
      PageEntity(
          route: RoutesNames.USERSCREATE,
          page: const CreateUser(),
          bloc: BlocProvider(create: (_) => CreateUserBloc())),
    ];
  }

  static List<dynamic> allBlocProvider(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      if (bloc.bloc != null) {
        blocProviders.add(bloc.bloc);
      }
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool isLoggedIn = Global.storageService.getIslogedIn();

        if (!isLoggedIn && settings.name == RoutesNames.APPLICATION) {
          return MaterialPageRoute(
            builder: (_) => const SignIn(),
            settings: settings,
          );
        }

        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }

    // fallback page
    return MaterialPageRoute(
      builder: (_) => const Register(),
      settings: settings,
    );
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({required this.route, required this.page, required this.bloc});
}
