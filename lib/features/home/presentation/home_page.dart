import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ativo/features/home/presentation/bloc/cubit/cubit/ticker_cubit.dart';
import 'package:flutter_ativo/injection_container.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Variação Ativo'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlocProvider(
                create: (context) => TickerCubit(sl())..init(),
                child: BlocBuilder<TickerCubit, TickerState>(
                  builder: (context, state) {
                    //
                    final quotes = state.listaQuotes;

                    if (state.status == TickerStatus.loading) {
                      //
                      return const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Center(
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                      //
                    }

                    final List<QuoteData> quoteData = List.generate(quotes!.length, (index) {
                      return QuoteData(quotes[index].date!, quotes[index].open!);
                    });

                    final maxVal = quoteData.map((e) => e.quote).reduce(max);
                    final minVal = quoteData.map((e) => e.quote).reduce(min);

                    final firstValue = quoteData[0].quote;
                    final latestValue = quoteData[quoteData.length - 1].quote;

                    final profitability = ((latestValue - firstValue) / firstValue) * 100;

                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: double.infinity,
                          height: 300,
                          child: SfCartesianChart(
                            title: ChartTitle(text: 'Gráfico PETR4'),
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(
                              minimum: minVal,
                              maximum: maxVal,
                              labelFormat: 'R\$ {value}',
                            ),
                            // axes: [NumericAxis(minimum: 15, maximum: 45)],
                            series: <ChartSeries>[
                              // Renders line chart
                              LineSeries<QuoteData, String>(
                                  dataSource: quoteData,
                                  xValueMapper: (QuoteData quotes, i) {
                                    final DateFormat formatter = DateFormat('dd/MM');
                                    final String formatted = formatter.format(quotes.day);
                                    return formatted;
                                  },
                                  yValueMapper: (QuoteData quotes, _) => quotes.quote)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Rentabilidade ${profitability.toStringAsFixed(2)}%',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuoteData {
  QuoteData(this.day, this.quote);
  final DateTime day;
  final double quote;
}
