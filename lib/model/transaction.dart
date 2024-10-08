part of 'models.dart';

enum TransactionStatus { delivered, on_delivery, pending, canceled }

class Transaction extends Equatable {
  final int? id;
  final Food? food;
  final int? quantity;
  final int? total;
  final DateTime? dateTime;
  final TransactionStatus? status;
  final User? user;
  final String? paymentUrl;

  Transaction({
    this.id,
    this.food,
    this.quantity,
    this.total,
    this.dateTime,
    this.status,
    this.user,
    this.paymentUrl,
  });

  Transaction copywith({
    int? id,
    Food? food,
    int? quantity,
    DateTime? dateTime,
    TransactionStatus? status,
    User? user,
    required int total,
  }) {
    return Transaction(
      id: id ?? this.id,
      food: food ?? this.food,
      quantity: quantity ?? this.quantity,
      total: total ?? this.total,
      dateTime: dateTime ?? this.dateTime,
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  factory Transaction.fromjson(Map<String, dynamic> data) => Transaction(
      id: data['id'],
      food: Food.fromjson(data['food']),
      quantity: data['quantity'],
      total: data['total'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(data['created_at']),
      user: User.fromjson(data['user']),
      paymentUrl: data['payment_url'],
      status: data['status'] == 'PENDING'
          ? TransactionStatus.pending
          : data['status'] == 'ON_DELIVERY'
              ? TransactionStatus.on_delivery
              : data['status'] == 'CANCELED'
                  ? TransactionStatus.canceled
                  : TransactionStatus.delivered);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        food,
        quantity,
        total,
        dateTime,
        status,
        user,
      ];
}

List<Transaction> mockTransaction = [
  Transaction(
      id: 1,
      food: Foods[1],
      quantity: 5,
      total: (Foods[1].price! * 5 * 1.1).toInt() + 50000,
      dateTime: DateTime.now(),
      status: TransactionStatus.delivered,
      user: mockUser),
  Transaction(
      id: 2,
      food: Foods[2],
      quantity: 10,
      total: (Foods[2].price! * 10 * 1.1).toInt() + 50000,
      dateTime: DateTime.now(),
      status: TransactionStatus.on_delivery,
      user: mockUser),
  Transaction(
      id: 3,
      food: Foods[3],
      quantity: 7,
      total: (Foods[3].price! * 7 * 1.1).toInt() + 50000,
      dateTime: DateTime.now(),
      status: TransactionStatus.canceled,
      user: mockUser),
  Transaction(
      id: 4,
      food: Foods[5],
      quantity: 7,
      total: (Foods[5].price! * 5 * 1.1).toInt() + 50000,
      dateTime: DateTime.now(),
      status: TransactionStatus.pending,
      user: mockUser),
];
