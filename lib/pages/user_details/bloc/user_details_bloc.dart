// user_details_bloc.dart

import 'package:caliborttechnologies/comman/widgets/toastInfo.dart';
import 'package:caliborttechnologies/pages/user_details/bloc/user_details_event.dart';
import 'package:caliborttechnologies/pages/user_details/bloc/user_details_states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../comman/apis/user_repository.dart';
import '../../../comman/entities/user_model.dart';
import '../../../comman/service/imagepicker_service.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final UserRepository _userRepository = UserRepository();
  final pickerService = ImagePickerService();

  UserDetailsBloc()
      : super(UserDetailsState(name: '', email: '', id: '', lastName: '', avatar: '', imageFile: null)) {
    on<LoadUserDetails>((event, emit) {
      emit(UserDetailsState(
        name: event.user.firstName ?? '',
        email: event.user.email ?? '',
        id: event.user.id.toString() ??'', lastName: event.user.lastName??'', avatar: event.user.avatar??'', imageFile: null,
      ));
    });

    on<ToggleUserType>((event, emit) {
      emit(state.copyWith(isStudent: event.isStudent));
      print(event.isStudent);
    });

    on<UserNameEvent>(
      (event, emit) {
        emit(state.copyWith(name: event.name));
      },
    );
    on<ImagePickedEvent>(
          (event, emit) async {
            final pickedImage = await pickerService.pickImageFromGallery();
        emit(state.copyWith(imageFile:pickedImage));
      },
    );
    on<UserEmailEvent>(
      (event, emit) {
        emit(state.copyWith(email: event.email));
      },
    );

    on<UpdateUserDetails>((event, emit) async {
     final updateuser= UserModel(email: event.email,firstName: event.name,id: int.parse(event.id??'') );

      final message = await _userRepository.updateUser(updateuser);
      print(message);
      if (message == "Success") {
        emit(state.copyWith(
          name: event.name,
          email: event.email,
          isStudent: event.isStudent,
        ));
      }

      print("Update status: $message");
toastInfo(msg: "user details updated Successfully");
      print("Updated Data:");
      print("Name: ${event.name}");
      print("Email: ${event.email}");
      print("User Type: ${event.isStudent}");

      emit(state.copyWith(
        name: event.name,
        email: event.email,
        isStudent: event.isStudent,
      ));
    });
  }
}
