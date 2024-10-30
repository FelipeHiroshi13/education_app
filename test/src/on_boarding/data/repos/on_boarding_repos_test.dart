import 'package:dartz/dartz.dart';
import 'package:education_app/core/erros/exceptions.dart';
import 'package:education_app/core/erros/failures.dart';
import 'package:education_app/src/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:education_app/src/on_boarding/data/repos/on_boarding_repos.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOnBoardingLocalDataSource extends Mock
    implements IOnBoardingLocalDataSouce {}

void main() {
  late IOnBoardingLocalDataSouce localDataSouce;
  late OnBoardingRepos repository;

  setUp(() {
    localDataSouce = MockOnBoardingLocalDataSource();
    repository = OnBoardingRepos(localDataSource: localDataSouce);
  });

  test('Should be a subclass of [OnBoardingRepo]', () {
    expect(repository, isA<OnBoardingRepos>());
  });

  group('cache first timer', () {
    test('Shouls complete  sucessfully when call to local source is sucessful',
        () async {
      when(() => localDataSouce.cacheFirstTimer()).thenAnswer(
        (_) async => Future.value(),
      );

      final result = await repository.cacheFirstTime();

      expect(result, equals(const Right<dynamic, void>(null)));
      verify(() => localDataSouce.cacheFirstTimer());
      verifyNoMoreInteractions(localDataSouce);
    });

    test(
      'should return [CacheFailure] when call to local source is '
      'unsuccessful',
      () async {
        when(() => localDataSouce.cacheFirstTimer()).thenThrow(
          const CacheException(message: 'Insufficient storage'),
        );

        final result = await repository.cacheFirstTime();

        expect(
          result,
          Left<CacheFailure, dynamic>(
            CacheFailure(message: 'Insufficient storage', statusCode: 505),
          ),
        );

        verify(() => localDataSouce.cacheFirstTimer());
        verifyNoMoreInteractions(localDataSouce);
      },
    );
  });
}
