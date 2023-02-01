import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_ativo/features/home/data/repositories/dashboard_repository.dart';
import 'package:flutter_ativo/features/home/domain/entities/quote_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ticker_state.dart';

class TickerCubit extends Cubit<TickerState> {
  final DashboardRepository repository;

  TickerCubit(this.repository) : super(const TickerState());

  void init() async {
    //
    emit(state.copyWith(
      status: TickerStatus.loading,
    ));

    //
    var ticker = 'PETR4.SA';
    var response = await repository.getTicker(ticker);

    //
    if (response.isLeft) {
      emit(state.copyWith(
        status: TickerStatus.failure,
      ));
      return;
    }
    //
    emit(state.copyWith(
      status: TickerStatus.success,
      listaQuotes: response.right,
    ));
    //
  }
}
