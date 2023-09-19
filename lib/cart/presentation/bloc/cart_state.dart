part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  final List<CartDataModel>? listCartItem;
  final int? totalPrice;

  const CartState({this.listCartItem, this.totalPrice});

  @override
  List<Object?> get props => [listCartItem, totalPrice];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {
  const CartLoading();
}

final class CartLoaded extends CartState {
  const CartLoaded(List<CartDataModel>? listCartItem, int totalPrice)
      : super(listCartItem: listCartItem, totalPrice: totalPrice);
}

final class CartError extends CartState {
  const CartError();
}
