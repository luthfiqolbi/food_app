part of 'food_cubit.dart';

sealed class FoodState extends Equatable {
  const FoodState();
}

final class FoodInitial extends FoodState {
  @override
  List<Object> get props => [];
}

final class FoodLoaded extends FoodState{
  final List<Food> foods;

  FoodLoaded(this.foods);

  @override
  List<Object?> get props => [foods];
}

final class FoodLoadingFailed extends FoodState{
  final String message;

  FoodLoadingFailed(this.message);

  @override
  List<Object?> get props => [message];

}
