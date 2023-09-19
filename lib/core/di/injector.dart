import 'package:get_it/get_it.dart';
import 'package:sehatin_flutter/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:sehatin_flutter/cart/presentation/bloc/cart_bloc.dart';
import 'package:sehatin_flutter/home/presentation/bloc/home_bloc.dart';
import 'package:sehatin_flutter/meal_detail/presentation/bloc/meal_detail_bloc.dart';
import 'package:sehatin_flutter/user_profile/presentation/bloc/user_profile_bloc.dart';

final inject = GetIt.instance;

Future<void> initializeDependencies() async {
  // BLoCs
  inject.registerFactory<HomeBloc>(
    () => HomeBloc(),
  );
  inject.registerFactory<AuthenticationBloc>(
    () => AuthenticationBloc(),
  );
  inject.registerFactory<MealDetailBloc>(
    () => MealDetailBloc(),
  );
  inject.registerFactory<UserProfileBloc>(
    () => UserProfileBloc(),
  );
  inject.registerFactory<CartBloc>(
    () => CartBloc(),
  );
}
