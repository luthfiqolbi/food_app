part of 'models.dart';

enum TransactionStatus {
  delivered,
  on_delivery,
  pending,
  canceled,
}

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
    this.status,
    this.dateTime,
    this.total,
    this.user,
    this.paymentUrl,
  });

  Transaction copyWith({
    int? id,
    Food? food,
    int? quntity,
    int? total,
    DateTime? dateTime,
    TransactionStatus? status,
    User? user,
  }) {
    return Transaction(
      id: id ?? this.id,
      food: food ?? this.food,
      quantity: quntity ?? quantity,
      status: status ?? this.status,
      dateTime: dateTime ?? this.dateTime,
      total: total ?? this.total,
      user: user ?? this.user,
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> data) => Transaction(
        id: data['id'],
        food: Food.fromJson(data['food']),
        quantity: data['quantity'],
        total: data['total'],
        dateTime: DateTime.fromMillisecondsSinceEpoch(data['created_at']),
        user: User.fromJson(data['user']),
        paymentUrl: data['payment_url'],
        status: data['status'] == 'PENDING' ? TransactionStatus.pending :
        data['status'] == 'ON_DELIVERY' ? TransactionStatus.on_delivery :
        data['status'] == 'CANCELED' ? TransactionStatus.canceled :
        TransactionStatus.delivered
      );

  @override
  List<Object?> get props => [
        id,
        food,
        quantity,
        status,
        dateTime,
        total,
        user,
      ];
}

List<Transaction> mockTransactions = [
  Transaction(
    id: 1,
    food: mockFoods[1],
    quantity: 10,
    total: ((mockFoods[1].price! * 10 * 1.1) + 50000).toInt(),
    dateTime: DateTime.now(),
    status: TransactionStatus.delivered,
    user: mockUser,
  ),
  Transaction(
    id: 2,
    food: mockFoods[2],
    quantity: 7,
    total: ((mockFoods[2].price! * 7 * 1.1) + 50000).toInt(),
    dateTime: DateTime.now(),
    status: TransactionStatus.canceled,
    user: mockUser,
  ),
  Transaction(
    id: 3,
    food: mockFoods[3],
    quantity: 5,
    total: ((mockFoods[3].price! * 3 * 1.1) + 50000).toInt(),
    dateTime: DateTime.now(),
    status: TransactionStatus.on_delivery,
    user: mockUser,
  ),
  Transaction(
    id: 4,
    food: mockFoods[4],
    quantity: 7,
    total: ((mockFoods[4].price! * 7 * 1.1) + 50000).toInt(),
    dateTime: DateTime.now(),
    status: TransactionStatus.pending,
    user: mockUser,
  ),
];
