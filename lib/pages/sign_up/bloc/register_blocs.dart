

import 'package:caliborttechnologies/pages/sign_up/bloc/regiseter_state.dart';
import 'package:caliborttechnologies/pages/sign_up/bloc/register_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<UsernameEvent>(_userNamaeEvent);
    on<EmailEventR>(_emailEvent);
    on<PasswordEventR>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }

  void _userNamaeEvent(UsernameEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(username: event.userName));
    print("${event.userName}");
  }

  void _emailEvent(EmailEventR event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
    print("${event.email}");
  }

  void _passwordEvent(PasswordEventR event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
    print("${event.password}");
  }

  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(rePassword: event.rePassword));
    print("${event.rePassword}");
  }
}
