// user_details_state.dart

import 'dart:io';

class UserDetailsState {
  final String name;
  final String lastName;
  final String id;
  final String email;
  final String avatar;

  final File? imageFile;

  UserDetailsState( {
    required this.name,
    required this.lastName,
    required this.email,
    required this.id,
    required this.avatar,
    required this.imageFile,
  });

  UserDetailsState copyWith({
    String? name,
    String? lastName,
    String? email,
    bool? isStudent,
    String? id,
    String? avatar,
    File? imageFile,

  }) {
    return UserDetailsState(
      name: name ?? this.name,
      email: email ?? this.email, id: id??this.id, lastName:lastName??this.lastName, avatar: avatar??this.avatar, imageFile: imageFile??this.imageFile,
    );
  }
}
