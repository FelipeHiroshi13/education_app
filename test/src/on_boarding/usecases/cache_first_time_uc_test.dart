import 'package:dartz/dartz.dart';
import 'package:education_app/core/erros/failures.dart';
import 'package:education_app/src/on_boarding/domain/repos/i_on_boarding_repository.dart';
import 'package:education_app/src/on_boarding/usecases/cache_first_time_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'on_boarding_repo.mock.dart';

void main() {
  late IOnboardingRepository repo;
  late CacheFirstTimeUC usecase;

  setUp(() {
    repo = MockOnBoardingRepo();
    usecase = CacheFirstTimeUC(repository: repo);
  });

  test(
      'Should call the [OnBoardingRepo.cacheFirstTimer] '
      'and return the left data', () async {
    when(() => repo.cacheFirstTime()).thenAnswer(
      (_) async => Left(
        ServerFailure(message: 'Unknown Error Occured', statusCode: 500),
      ),
    );

    final result = await usecase();

    expect(
      result,
      Left<Failure, dynamic>(
        ServerFailure(message: 'Unknown Error Occured', statusCode: 500),
      ),
    );

    verify(() => repo.cacheFirstTime()).called(1);
    verifyNoMoreInteractions(repo);
  });
}
