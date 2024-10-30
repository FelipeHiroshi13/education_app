import 'package:dartz/dartz.dart';
import 'package:education_app/core/erros/failures.dart';

abstract class IOnboardingRepository {
  Future<Either<Failure, void>> cacheFirstTime();

  Future<Either<Failure, bool>> checkIfUserIsFirstTime();
}
