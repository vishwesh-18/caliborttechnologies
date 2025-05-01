import 'dart:io';

class CreateUserStates {
  final String UserName;
  final String? UserJob;
  final File? imageFile;
  final String? imageUrl;
  final String? avtar;

  const CreateUserStates({
    this.UserName = '',
    this.UserJob = '',
    this.imageFile,
    this.imageUrl = '',
    this.avtar = '',
  });

  CreateUserStates copyWith({
    String? courseName,
    String? avtar,
    String? UserJob,
    String? imageUrl,
    File? imageFile,
  }) {
    return CreateUserStates(
        UserName: courseName ?? this.UserName,
        UserJob: UserJob ?? this.UserJob,
        imageFile: imageFile ?? this.imageFile,
        imageUrl: imageUrl ?? this.imageUrl,
        avtar: avtar ?? this.avtar);
  }
}
