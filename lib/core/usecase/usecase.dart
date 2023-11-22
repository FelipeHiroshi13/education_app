import 'package:dartz/dartz.dart';

import 'package:education_app/core/erros/failures.dart';

abstract class UseCaseWithParams<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

abstract class UseCaseWithoutParams<T> {
  Future<Either<Failure, T>> call();
}
