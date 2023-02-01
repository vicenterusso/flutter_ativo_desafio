part of 'ticker_cubit.dart';

enum TickerStatus { loading, success, failure }

class TickerState extends Equatable {
  const TickerState({
    this.status = TickerStatus.loading,
    this.listaQuotes,
  });

  final TickerStatus status;
  final List<QuoteEntity>? listaQuotes;

  TickerState copyWith({
    TickerStatus? status,
    List<QuoteEntity>? listaQuotes,
  }) {
    return TickerState(
      status: status ?? this.status,
      listaQuotes: listaQuotes ?? this.listaQuotes,
    );
  }

  @override
  List<Object> get props => [
        status,
        jsonEncode(listaQuotes),
      ];
}
