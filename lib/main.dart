import 'package:cryoto_api_app_using_bloc/presentation/blocs/home_bloc/crypto_bloc.dart';
import 'package:cryoto_api_app_using_bloc/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';
import 'package:cryoto_api_app_using_bloc/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent, elevation: 0),
          textTheme: GoogleFonts.dmSansTextTheme()),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CryptoBloc()),
          BlocProvider(create: (context) => WatchlistBloc()),
        ],
        child: const ScreenHome(),
      ),
    );
  }
}
