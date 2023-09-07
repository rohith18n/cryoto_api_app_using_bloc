import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/home_bloc/crypto_bloc.dart';
import '../blocs/home_bloc/crypto_state.dart';
import '../constants/spaces.dart';
import '../widgets/home_main_tile.dart';
import '../widgets/home_sub_tile.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoBloc, CryptoState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (state is CryptoFetchSuccessState) {
          final cryptoList = state.cryptoList;
          final leadingCoin = cryptoList[0];
          final modifiedList = cryptoList.sublist(1);
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            physics: const BouncingScrollPhysics(),
            children: [
              vSpace20,
              LargeTile(
                rank: leadingCoin.marketCapRank,
                imageUrl: leadingCoin.image,
                symbol: leadingCoin.symbol,
                name: leadingCoin.name,
                price: leadingCoin.currentPrice,
                priceChangePercentage: leadingCoin.priceChangePercentage24h,
                heighestPrice: leadingCoin.high24h,
                lowestPrice: leadingCoin.low24h,
              ),
              vSpace20,
              ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final coin = modifiedList[index];
                  return SubTile(
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
                itemCount: modifiedList.length,
              ),
              vSpace10
            ],
          );
        } else if (state is CryptoErrorState) {
          return const Center(child: Text('Somthing went wrong'));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
