import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/home_bloc/crypto_bloc.dart';
import '../blocs/home_bloc/crypto_event.dart';
import '../blocs/watchlist_bloc/watchlist_bloc.dart';
import 'home_currency_sub_screen.dart';
import 'home_watchlist_sub_screen.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    super.initState();
    context.read<CryptoBloc>().add(InitialEvent());
    context.read<WatchlistBloc>().add(WatchListInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TRENDING STOCKS',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Trending Coins'),
                Tab(text: 'Saved By You'),
              ],
              indicatorColor: Colors.deepOrange,
            ),
            Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  CurrencyPage(),
                  WatchListPage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
