import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geeks/controllers/authentication/authentication_bloc.dart';
import 'package:geeks/controllers/hoblist%20bloc/hoblist_bloc.dart';
import 'package:geeks/injectable.dart';
import 'package:geeks/views/colors.dart';
import 'package:geeks/views/spalsh%20screen/splash_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthenticationBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HoblistBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'App Title',
        theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: whiteColor,
            brightness: Brightness.light,
            primaryColor: Colors.blue),
        darkTheme: ThemeData(
            brightness: Brightness.dark, scaffoldBackgroundColor: Colors.black),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
