import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(IntroInitial()) {
    on<EventIntro>((event, emit) async {
      final SharedPreferences sharedPrefs =
          await SharedPreferences.getInstance();
      emit(IntroLoading());
      Future.delayed(Duration(seconds: 2)).then((value) async {
        return await sharedPrefs.setBool("introKey", true);
      });
      emit(IntroSuccess());
    });
  }
}
