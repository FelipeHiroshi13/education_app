import 'package:dartz/dartz.dart';
import 'package:education_app/core/erros/exceptions.dart';
import 'package:education_app/core/erros/failures.dart';
import 'package:education_app/src/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:education_app/src/on_boarding/domain/repos/i_on_boarding_repository.dart';

class OnBoardingRepos implements IOnboardingRepository {
  const OnBoardingRepos({
    required this.localDataSource,
  });

  final IOnBoardingLocalDataSouce localDataSource;

  @override
  Future<Either<Failure, void>> cacheFirstTime() async {
    try {
      await localDataSource.cacheFirstTimer();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, bool>> checkIfUserIsFirstTime() {
    // TODO: implement checkIfUserIsFirstTime
    throw UnimplementedError();
  }
}
