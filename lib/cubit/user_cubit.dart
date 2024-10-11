import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/models.dart';
import 'package:food_app/services/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> result = await UserService.signin(email, password);

    if (result.value != null) {
      emit(UserLoaded(result.value!));
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }

  Future<void> signUp(User user, String password, {File? pictureFile}) async {
    ApiReturnValue<User> result =
        await UserService.signUp(user, password, pictureFile: pictureFile);

    if (result.value != null) {
      emit(UserLoaded(result.value!));
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }

  Future<void> uploadProfilePicture(File picture) async {
    ApiReturnValue<String> result =
        await UserService.uploadPicturePath(picture);

    if (result.value != null) {
      emit(
        UserLoaded(
          (state as UserLoaded).user.copyWith(
              picturePath: 'http://food.rtid73.com/storage/${result.value}'),
        ),
      );
    } else {}
  }

  Future<void> signOut() async {
    ApiReturnValue<bool> result = await UserService.logout();

    if(result.value != null) {
      emit(UserInitial());
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }
}
