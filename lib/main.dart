import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehatin_flutter/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:sehatin_flutter/authentication/presentation/screens/landing_screen.dart';
import 'package:sehatin_flutter/cart/presentation/bloc/cart_bloc.dart';
import 'package:sehatin_flutter/core/di/injector.dart';
import 'package:sehatin_flutter/home/presentation/bloc/home_bloc.dart';
import 'package:sehatin_flutter/meal_detail/presentation/bloc/meal_detail_bloc.dart';
import 'package:sehatin_flutter/user_profile/presentation/bloc/user_profile_bloc.dart';

Future<void> main() async {
  await initializeDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (_) => inject(),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (_) => inject(),
        ),
        BlocProvider<CartBloc>(
          create: (_) => inject(),
        ),
        BlocProvider<UserProfileBloc>(
          create: (_) => inject(),
        ),
        BlocProvider<MealDetailBloc>(
          create: (_) => inject(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home: const LandingScreen(),
      ),
    );
  }
}
