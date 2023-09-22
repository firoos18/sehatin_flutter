part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

final class OnFilterPicked extends HomeEvent {
  final FoodType foodType;

  const OnFilterPicked({required this.foodType});
}
