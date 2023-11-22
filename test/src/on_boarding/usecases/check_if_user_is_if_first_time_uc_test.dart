import 'package:dartz/dartz.dart';
import 'package:education_app/core/erros/failures.dart';
import 'package:education_app/src/on_boarding/domain/repos/i_on_boarding_repository.dart';
import 'package:education_app/src/on_boarding/usecases/cache_first_time_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'on_boarding_repo.mock.dart';

void main() {
  late IOnboardingRepository repository;
  late CacheFirstTimeUC usecase;

  setUp(() {
    repository = MockOnBoardingRepo();
    usecase = CacheFirstTimeUC(repository: repository);
  });

  test(
    'Should call the [OnBoardingRepo.cacheFirstime] '
    'and return the right data',
    () async {
      // GIVEN
      when(() => repository.cacheFirstTime()).thenAnswer(
        (_) async => const Left(
            ServerFailure(message: 'Unknown Error Occured', statusCode: 500)),
      );
    },
  );
}
