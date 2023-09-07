import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_sources/home_watchlist_list.dart';
import '../../domain/models/crypto_model.dart';
import '../blocs/watchlist_bloc/watchlist_bloc.dart';
import '../constants/spaces.dart';

class SubTile extends StatelessWidget {
  const SubTile(
      {super.key,
      required this.rank,
      required this.imageUrl,
      required this.symbol,
      required this.name,
      required this.price,
      required this.priceChangePercentage,
      required this.coin});
  final int rank;
  final String imageUrl;
  final String symbol;
  final String name;
  final num price;
  final num priceChangePercentage;
  final CryptoCurrency coin;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xff25252F),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '# $rank',
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          hSpace10,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              vSpace5,
              Text(
                symbol.toUpperCase(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          hSpace20,
          // vSpace10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              vSpace10,
              Text(
                '₹ $price',
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        priceChangePercentage < 0 ? Icons.remove : Icons.add,
                        size: 14,
                        color: priceChangePercentage < 0
                            ? Colors.redAccent
                            : Colors.greenAccent,
                      ),
                      hSpace5,
                      Text(
                        priceChangePercentage.abs().toStringAsFixed(3),
                        style: TextStyle(
                          fontSize: 16,
                          color: priceChangePercentage < 0
                              ? Colors.redAccent
                              : Colors.greenAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                vSpace10,
                TextButton.icon(
                  onPressed: () {
                    if (!watchList.contains(coin)) {
                      watchList.add(coin);
                      context
                          .read<WatchlistBloc>()
                          .add(WatchListAddEvent(watchList: watchList));
                    } else {
                      // print('already added');
                    }
                  },
                  label: const Text(
                    'WatchList',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  icon: const Icon(
                    Icons.add,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
