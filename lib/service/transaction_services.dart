part of 'services.dart';

class TransactionServices{
  static Future<ApiReturnValue<List<Transaction>>> getTransaction() async {
    await Future.delayed(Duration(seconds: 3));

    return ApiReturnValue(value: mockTransaction);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(Transaction transaction) async {
    await Future.delayed(Duration(seconds: 2));

    return ApiReturnValue(
      value: transaction.copywith(
        id: 123,
        status: TransactionStatus.pending,
        total: (transaction.quantity! * transaction.food!.price! * 1.1).toInt(),
      )
    );
  }
}