part of 'services.dart';

class UserServices{
  static Future<ApiReturnValue<User>> signIn(String email, String password) async {
    await Future.delayed(Duration(microseconds: 500));

    // login berhasil
    return ApiReturnValue(value: mockUser);

    // login gagal
    // return ApiReturnValue(message: "Email atau password salah");
  }
}