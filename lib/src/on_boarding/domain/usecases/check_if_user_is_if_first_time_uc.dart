import 'package:dartz/dartz.dart';

import 'package:education_app/core/erros/failures.dart';
import 'package:education_app/core/usecase/usecase.dart';
import 'package:education_app/src/on_boarding/domain/repos/i_on_boarding_repository.dart';

class CheckIfUserIsFirstTimeUc extends UseCaseWithoutParams<void> {
  CheckIfUserIsFirstTimeUc({
    required this.repository,
  });

  final IOnboardingRepository repository;

  @override
  Future<Either<Failure, dynamic>> call() async =>
      repository.checkIfUserIsFirstTime();
}
