import 'package:either_dart/either.dart';
import 'package:flutter_ativo/features/home/data/datasources/dashboard_remote_datasource.dart';
import 'package:flutter_ativo/features/home/domain/entities/quote_entity.dart';
import 'package:flutter_ativo/features/home/domain/errors/errors.dart';

class DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;

  DashboardRepository(this.remoteDataSource);

  Future<Either<Failure, List<QuoteEntity>>> getTicker(String ticker) async {
    print('DashboardRepository > getTicker');

    var response = await remoteDataSource.getTicker(ticker);
    //
    if (response.isLeft) {
      return Left(response.left);
    }
    //
    return Right(response.right);
  }
}
