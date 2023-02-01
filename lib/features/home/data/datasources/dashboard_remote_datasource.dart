import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_ativo/core/base_remote_source.dart';
import 'package:flutter_ativo/features/home/domain/entities/quote_entity.dart';
import 'package:flutter_ativo/features/home/domain/errors/errors.dart';

class DashboardRemoteDataSource extends BaseRemoteSource {
  //
  Future<Either<Failure, List<QuoteEntity>>> getTicker(String ticker) async {
    try {
      //
      final response = await http.get('https://query2.finance.yahoo.com/v8/finance/chart/$ticker?interval=1d&range=90d');
      //final response = await http.get('https://query2.finance.yahoo.com/v8/finance/chart/$ticker');

      var json = response.data;

      var timestamps = json['chart']['result'][0]['timestamp'];
      var open = json['chart']['result'][0]['indicators']['quote'][0]['open'];

      var timestampsAndQuotes = timestamps.asMap().entries.map((entry) {
        int idx = entry.key;
        var date = DateTime.fromMillisecondsSinceEpoch(entry.value * 1000);
        return {
          'date': date,
          'open': open[idx],
        };
      });

      var latest30List = timestampsAndQuotes.toList().sublist(timestampsAndQuotes.length - 30, timestampsAndQuotes.length);
      var data = (latest30List as List).map((item) => QuoteEntity.fromJson(item)).toList();
      //
      return Right(data);
      //
    } on DioError catch (e) {
      var errorMessage = 'Ocorreu um erro desconhecido';
      try {
        // Verifica se o retorno é um json valido
        var decodedJSON = jsonDecode(e.response.toString()) as Map<String, dynamic>;
        errorMessage = decodedJSON['message'];
      } on FormatException catch (e) {
        //print('The provided string is not valid JSON');
      }

      return Left(HttpError(errorMessage));
    }
  }
}
