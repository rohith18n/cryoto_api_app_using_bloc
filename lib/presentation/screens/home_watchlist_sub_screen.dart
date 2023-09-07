import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_sources/home_watchlist_list.dart';
import '../blocs/watchlist_bloc/watchlist_bloc.dart';
import '../widgets/home_watchlist_sub_tile.dart';

class WatchListPage extends StatelessWidget {
  const WatchListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (context, state) {
        if (state is WatchlistSuccessState) {
          final cryptoList = state.watchList;
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            itemBuilder: (context, index) {
              final coin = cryptoList[index];
              return WatchListSubTile(
                rank: coin.marketCapRank,
                imageUrl: coin.image,
                symbol: coin.symbol,
                name: coin.name,
                price: coin.currentPrice,
                priceChangePercentage: coin.priceChangePercentage24h,
                coin: coin,
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: watchList.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}
