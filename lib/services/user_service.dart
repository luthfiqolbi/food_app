part of "services.dart";

class UserService {
  static Future<ApiReturnValue<User>> signin(String email, String password,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + "/login";

    var response = await client.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Login failed, pleae try again");
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
    // await Future.delayed(const Duration(milliseconds: 500));

    // // login berhasil
    // return ApiReturnValue(value: mockUser);

    // // login gagal
    // return ApiReturnValue(message: "Email atau password salah");
  }

  static Future<ApiReturnValue<User>> signUp(User user, String password,
      {File? pictureFile, http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = "$baseUrl/register";

    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          <String, String>{
            'name': user.name!,
            'email': user.email!,
            'password': password,
            'password_confirmation': password,
            'address': user.address!,
            'city': user.city!,
            'houseNumber': user.houseNumber!,
            'phoneNumber': user.phoneNumber!,
          },
        ));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Register failed, please try again");
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    // Upload picture
    if (pictureFile != null) {
      ApiReturnValue<String> result = await uploadPicturePath(pictureFile);

      if (result.value != null) {
        value = value.copyWith(
            picturePath: "https://food.rtid73.com/storage/${result.value}");
      }
    }

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> uploadPicturePath(File picture,
      {http.MultipartRequest? request}) async {
    String url = baseUrl + '/user/photo';

    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest('POST', uri)
        ..headers['Content-Type'] = 'application/json'
        ..headers['Authorization'] = 'Bearer ${User.token}';
    }

    var multipartFile = await http.MultipartFile.fromPath('file', picture.path);

    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();

      var data = jsonDecode(responseBody);

      String picturePath = data['data'][0];

      return ApiReturnValue(value: picturePath);
    } else {
      return ApiReturnValue(message: "Failed To Upload Picture");
    }
  }

  static Future<ApiReturnValue<bool>> logout({http.Client? client}) async {
    client ??= http.Client();

    String url = '$baseUrl/logout';
    print("URL Logout : $url");

    var uri = Uri.parse(url);
    var response = await http.post(uri, headers: ApiServices.headersPost(token: User.token));

    print("Reponse Logout : ${response.body}");

    if(response.statusCode != 200) {
      return ApiReturnValue(message: 'Logout Failed');
    }

    return ApiReturnValue(value: true);
  }
}
