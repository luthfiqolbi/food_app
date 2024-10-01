part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURL + '/login';

    var response = await client.post(Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }));

    if (response.statusCode != 200){
      return ApiReturnValue(message: 'Login failed, please try again');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['token'];
    User value = User.fromjson(data['data']['user']);

    return ApiReturnValue(value: value);

    // await Future.delayed(Duration(microseconds: 500));
    //
    // // login berhasil
    // return ApiReturnValue(value: mockUser);
    //
    // // login gagal
    // return ApiReturnValue(message: "Email atau password salah");
  }
}
