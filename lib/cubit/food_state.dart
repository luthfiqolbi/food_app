part of 'food_cubit.dart';

sealed class FoodState extends Equatable {
  const FoodState();
}

final class FoodInitial extends FoodState {
  @override
  List<Object> get props => [];
}

final class FoodLoaded extends FoodState {
  final List<Food> food;

  const FoodLoaded(this.food);

  @override
  List<Object?> get props => [food];
}

final class FoodLoadingFailed extends FoodState {
  final String message;

  const FoodLoadingFailed(this.message);

  @override
  List<Object?> get props => [message];
}
