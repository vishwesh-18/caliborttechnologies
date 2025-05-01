// user_details_event.dart


import '../../../comman/entities/user_model.dart';

abstract class UserDetailsEvent {}

class LoadUserDetails extends UserDetailsEvent {
  final UserModel user;
  LoadUserDetails(this.user);
}

class ToggleUserType extends UserDetailsEvent {
  final bool isStudent;
  ToggleUserType(this.isStudent);
}

class UserNameEvent extends UserDetailsEvent {
  final String name;
  UserNameEvent(this.name);
}

class UserEmailEvent extends UserDetailsEvent {
  final String email;
  UserEmailEvent(this.email);
}
class ImagePickedEvent extends UserDetailsEvent {}

class UpdateUserDetails extends UserDetailsEvent {
  final String? id;
  final String? name;
  final String? email;
  final bool? isStudent;
  final String? city;
  final String? registerTime;
  UpdateUserDetails({
    this.registerTime,
    this.name,
    this.email,
    this.isStudent,
    this.id,
    this.city,
  });
}
