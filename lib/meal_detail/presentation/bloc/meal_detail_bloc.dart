import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'meal_detail_event.dart';
part 'meal_detail_state.dart';

class MealDetailBloc extends Bloc<MealDetailEvent, MealDetailState> {
  MealDetailBloc() : super(MealDetailInitial()) {
    on<MealDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
