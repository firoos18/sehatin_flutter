part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  final List<MealItem>? mealItem;
  final FoodType? foodType;

  const HomeState({this.mealItem, this.foodType});

  @override
  List<Object?> get props => [mealItem, foodType];
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class HomeItemLoaded extends HomeState {
  const HomeItemLoaded(final List<MealItem>? mealItem, final FoodType foodType)
      : super(mealItem: mealItem, foodType: foodType);
}

final class HomeItemEmpty extends HomeState {
  const HomeItemEmpty();
}

final class ActiveFilter extends HomeState {
  const ActiveFilter(final FoodType foodType, final List<MealItem> mealList)
      : super(mealItem: mealList, foodType: FoodType.meal);
}
