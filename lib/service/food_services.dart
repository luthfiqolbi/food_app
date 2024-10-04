part of 'services.dart';

class FoodServices {
  static Future<ApiReturnValue<List<Food>>> getFoods(
      {http.Client? client}) async {
    client ??= http.Client();

    String url = '${baseURL}/food';

    var response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Food> value = (data['data']['data'] as Iterable)
          .map((e) => Food.fromjson(e))
          .toList();

      return ApiReturnValue(value: value);

    } else {
      return ApiReturnValue(message: 'Failed to get foods');
    }
  }
}
