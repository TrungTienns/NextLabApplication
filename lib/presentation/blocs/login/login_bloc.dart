import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../../../domain/usecases/login_usecase.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      try {
        final user = await loginUseCase.execute(event.email, event.password);
        if (user != null) {
          emit(LoginSuccess());
        } else {
          emit(LoginFailure("Invalid email or password"));
        }
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });
  }
}