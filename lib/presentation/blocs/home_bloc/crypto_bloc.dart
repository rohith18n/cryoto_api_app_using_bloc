import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_crypto_list_usecase.dart';
import 'crypto_event.dart';
import 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc() : super(CryptoInitialState()) {
    on<InitialEvent>(loadingevent);
  }

  FutureOr<void> loadingevent(
      InitialEvent event, Emitter<CryptoState> emit) async {
    emit(LoadingState());
    final status = await GetCryptoUseCase().getCryptoList();
    if (status is CryptoFetchSuccessState) {
      emit(CryptoFetchSuccessState(cryptoList: status.cryptoList));
    } else if (status is CryptoErrorState) {
      emit(CryptoErrorState());
    }
  }
}
