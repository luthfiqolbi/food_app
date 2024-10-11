part of 'services.dart';

class TransactionService {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions(
      {http.Client? client}) async {
    // await Future.delayed(const Duration(seconds: 3));

    // return ApiReturnValue(value: mockTransactions);

    client ??= http.Client();

    String url = '$baseUrl/transaction';

    print(url);
    print(User.token);

    var response = await client.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${User.token}',
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Failed To Get Transactions');
    }

    var data = jsonDecode(response.body);

    List<Transaction> transaction = (data['data']['data'] as Iterable)
        .map((e) => Transaction.fromJson(e))
        .toList();

    return ApiReturnValue(value: transaction);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction,
      {http.Client? client}) async {
    // await Future.delayed(const Duration(seconds: 2));

    // return ApiReturnValue(
    //     value: transaction.copyWith(
    //   id: 123,
    //   status: TransactionStatus.pending,
    //   total: (transaction.quantity! * transaction.food!.price!).toInt(),
    // ));

    client ??= http.Client();

    String url = '$baseUrl/checkout';

    var response = await client.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${User.token}'
        },
        body: jsonEncode(<String, dynamic>{
          'food_id': transaction.food!.id,
          'user_id': transaction.user!.id,
          'quantity': transaction.quantity,
          'total': transaction.total,
          'status': 'PENDING',
        }));

    print(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Failed To Submit Transaction');
    }

    var data = jsonDecode(response.body);

    Transaction submit = Transaction.fromJson(data['data']);

    return ApiReturnValue(value: submit);
  }
}
