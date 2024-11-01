import 'package:education_app/core/erros/exceptions.dart';
import 'package:education_app/src/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences prefs;
  late IOnBoardingLocalDataSouce localDataSouce;

  setUp(() {
    prefs = MockSharedPreferences();
    localDataSouce = OnBoardingLocalDataSource(preferences: prefs);
  });

  group('cache first timer', () {
    test('should call [SharedPrefs] to cache the data', () async {
      when(() => prefs.setBool(any(), any())).thenAnswer((_) async => true);

      await localDataSouce.cacheFirstTimer();

      verify(() => prefs.setBool(kFirsTimerKey, false));
      verifyNoMoreInteractions(prefs);
    });

    test(
      'should throw a [CacheException] when there is an error caching the data',
      () async {
        when(() => prefs.setBool(any(), any())).thenThrow(Exception());

        final methodCall = localDataSouce.cacheFirstTimer();

        expect(methodCall, throwsA(isA<CacheException>()));
        verify(() => prefs.setBool(kFirsTimerKey, false)).called(1);
        verifyNoMoreInteractions(prefs);
      },
    );
  });
}
