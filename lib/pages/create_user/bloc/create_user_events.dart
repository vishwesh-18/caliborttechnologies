import 'dart:io';

abstract class CreateUserEvents {
  const CreateUserEvents();
}

class UserNameChanged extends CreateUserEvents {
  final String courseName;
  UserNameChanged(this.courseName);
}

class UserJobChanged extends CreateUserEvents {
  final String UserJob;
  UserJobChanged(this.UserJob);
}

class ImagePickedEvent extends CreateUserEvents {}

class ImageUrlEvent extends CreateUserEvents {
  final String imageUrl;
  ImageUrlEvent(this.imageUrl);
}

class ResetUserState extends CreateUserEvents {}

class SaveUserEvent extends CreateUserEvents {
  String? UserName;
  String? userJob;

  SaveUserEvent({
    this.UserName,
    this.userJob,
  });
}
