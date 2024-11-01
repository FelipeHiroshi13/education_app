import 'package:education_app/core/erros/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IOnBoardingLocalDataSouce {
  Future<void> cacheFirstTimer();

  Future<bool> checkIfUserIsFirstTimer();
}

const kFirsTimerKey = 'first_timer';

class OnBoardingLocalDataSource extends IOnBoardingLocalDataSouce {
  OnBoardingLocalDataSource({
    required this.preferences,
  });

  final SharedPreferences preferences;

  @override
  Future<void> cacheFirstTimer() async {
    try {
      await preferences.setBool(kFirsTimerKey, false);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> checkIfUserIsFirstTimer() {
    // TODO: implement checkIfUserIsFirstTimer
    throw UnimplementedError();
  }
}
