part of 'transaction_cubit.dart';

sealed class TransactionState extends Equatable {
  const TransactionState();
}

final class TransactionInitial extends TransactionState {
  @override
  List<Object> get props => [];
}

final class TransactionLoaded extends TransactionState {
  final List<Transaction> transaction;

  const TransactionLoaded(this.transaction);

  @override
  List<Object?> get props => [transaction];
}

final class TransactionLoadingFailed extends TransactionState {
  final String message;

  const TransactionLoadingFailed(this.message);

  @override
  List<Object?> get props => [message];
}
