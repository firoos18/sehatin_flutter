import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sehatin_flutter/cart/domain/entities/cart_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<GetCartData>(onGetCartData);
    on<InsertCartData>(onInsertCartData);
    on<RemoveItemFromCart>(onRemoveItemFromCart);
    on<ItemCountChanged>(onItemCountChanged);
  }

  final List<CartDataModel> listCartItem = [];

  void onGetCartData(GetCartData event, Emitter<CartState> emit) {
    int totalPrice = 0;

    for (var item in listCartItem) {
      int itemTotalPrice = int.parse(item.meal.price) * item.count;
      totalPrice += itemTotalPrice;
    }

    if (listCartItem.isNotEmpty) {
      emit(CartLoaded(listCartItem, totalPrice));
    } else {
      emit(CartInitial());
    }
  }

  void onInsertCartData(InsertCartData event, Emitter<CartState> emit) {
    listCartItem.add(event.cartItem);
  }

  void onRemoveItemFromCart(RemoveItemFromCart event, Emitter<CartState> emit) {
    final newCartItemList = listCartItem;
    int totalPrice = 0;

    newCartItemList.removeWhere(
      (item) =>
          item.meal == event.cartItem.meal &&
          item.count == event.cartItem.count,
    );

    if (newCartItemList.isNotEmpty) {
      for (var item in newCartItemList) {
        int itemTotalPrice = int.parse(item.meal.price) * item.count;
        totalPrice += itemTotalPrice;
      }

      emit(CartLoaded(newCartItemList, totalPrice));
    } else {
      emit(CartInitial());
    }
  }

  void onItemCountChanged(ItemCountChanged event, Emitter<CartState> emit) {
    final newCartItemList = listCartItem;
    int totalPrice = 0;

    for (var item in newCartItemList) {
      if (item.meal == event.cartItem.meal) {
        item.count = event.cartItem.count;
      }
      int itemTotalPrice = int.parse(item.meal.price) * item.count;
      totalPrice += itemTotalPrice;
    }

    emit(CartLoaded(newCartItemList, totalPrice));
  }
}
