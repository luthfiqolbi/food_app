part of 'services.dart';

class TransactionServices{
  static Future<ApiReturnValue<List<Transaction>>> getTransaction() async {
    await Future.delayed(Duration(seconds: 3));

    return ApiReturnValue(value: mockTransaction);
  }

  static Future<ApiReturnValue<List<Transaction>>> submitTransaction(Transaction transaction) async {
    await Future.delayed(Duration(seconds: 2));

    return ApiReturnValue(value: mockTransaction);
  }
}