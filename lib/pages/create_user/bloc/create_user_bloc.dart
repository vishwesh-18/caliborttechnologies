import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../comman/apis/user_repository.dart';
import '../../../comman/service/imagepicker_service.dart';
import '../../../comman/widgets/toastInfo.dart';
import 'create_user_events.dart';
import 'create_user_states.dart';

class CreateUserBloc extends Bloc<CreateUserEvents, CreateUserStates> {
  final pickerService = ImagePickerService();
  final UserRepository _repository = UserRepository();
  CreateUserBloc() : super(const CreateUserStates()) {
    on<UserNameChanged>(_userNameChanged);
    on<UserJobChanged>(_userjobChanged);
    on<SaveUserEvent>(_saveUser);
    on<ImagePickedEvent>(_imagePickedEvent);
    on<ResetUserState>((event, emit) {
      emit(CreateUserStates());
    });
    on<ImageUrlEvent>((event, emit) {
      emit(state.copyWith(imageUrl: event.imageUrl));
    });
  }

  Future<void> _imagePickedEvent(
      ImagePickedEvent event, Emitter<CreateUserStates> emit) async {
    final pickedImage = await pickerService.pickImageFromGallery();

    if (pickedImage != null) {
      emit(state.copyWith(imageFile: pickedImage));
    } else {}
  }

  Future<void> _saveUser(
      SaveUserEvent event, Emitter<CreateUserStates> emit) async {
    print("in save bloc");

    if (state.UserName.isEmpty) {
      toastInfo(msg: "Please enter user name");
      return;
    }
    if (state.UserJob!.isEmpty) {
      toastInfo(msg: "Please enter user job");
      return;
    }

    try {
      var reponce = _repository.createUser(state.UserName, state.UserJob ?? '');
      print(reponce);

      if(reponce=='Success')
      toastInfo(msg: "successfully created user");
      print("successfully created user");
    } catch (e) {
      print(e.toString());
      toastInfo(msg: "Something went wrong while saving");
    }
  }

  void _userNameChanged(UserNameChanged event, Emitter<CreateUserStates> emit) {
    emit(state.copyWith(courseName: event.courseName));
    if (kDebugMode) {
      print(event.courseName);
    }
  }

  void _userjobChanged(UserJobChanged event, Emitter<CreateUserStates> emit) {
    emit(state.copyWith(UserJob: event.UserJob));
    if (kDebugMode) {
      print(event.UserJob);
    }
  }
}
