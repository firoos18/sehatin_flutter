part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

final class GetCartData extends CartEvent {
  const GetCartData();
}

final class InsertCartData extends CartEvent {
  final CartDataModel cartItem;

  const InsertCartData({required this.cartItem});
}

final class RemoveItemFromCart extends CartEvent {
  final CartDataModel cartItem;

  const RemoveItemFromCart({required this.cartItem});
}

final class ItemCountChanged extends CartEvent {
  final CartDataModel cartItem;

  const ItemCountChanged({required this.cartItem});
}
