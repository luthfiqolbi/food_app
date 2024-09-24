part of 'services.dart';

class FoodServices{
  static Future<ApiReturnValue<List<Food>>> getFoods() async {
    await Future.delayed(Duration(microseconds: 500));

    return ApiReturnValue(value: Foods);
  }
}