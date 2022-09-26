import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/states.dart';
import '../core/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeMode( {bool? fromShared}) {
    // ignore: unnecessary_null_comparison
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark)
          .then((value) => emit(AppChangeModeState()));
    }
  }
}
