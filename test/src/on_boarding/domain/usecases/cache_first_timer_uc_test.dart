import 'package:dartz/dartz.dart';
import 'package:education_app/core/erros/failures.dart';
import 'package:education_app/src/on_boarding/domain/repos/i_on_boarding_repository.dart';
import 'package:education_app/src/on_boarding/domain/usecases/cache_first_time_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../usecases/on_boarding_repo.mock.dart';

void main() {
  late IOnboardingRepository repository;
  late CacheFirstTimeUC usecase;

  setUp(() {
    repository = MockOnBoardingRepo();
    usecase = CacheFirstTimeUC(repository: repository);
  });

  test(
    'should call the  [OnBoarding.cachefirstTimer] '
    'and return the right data',
    () async {
      when(() => repository.cacheFirstTime()).thenAnswer(
        (_) async =>
            Left(ServerFailure(message: 'Unknoen Error', statusCode: 500)),
      );

      final result = await usecase();

      expect(
        result,
        Left<Failure, dynamic>(
          ServerFailure(message: 'Unknoen Error', statusCode: 500),
        ),
      );

      verify(() => repository.cacheFirstTime()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
