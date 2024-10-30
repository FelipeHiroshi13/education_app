import 'package:dartz/dartz.dart';
import 'package:education_app/core/erros/failures.dart';
import 'package:education_app/core/usecase/usecase.dart';
import 'package:education_app/src/on_boarding/domain/repos/i_on_boarding_repository.dart';

class CacheFirstTimeUC extends UseCaseWithoutParams<void> {
  CacheFirstTimeUC({required this.repository});

  final IOnboardingRepository repository;
  @override
  Future<Either<Failure, dynamic>> call() => repository.cacheFirstTime();
}
