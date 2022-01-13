import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/auth/auth_repository.dart';
import 'package:social_media_app/auth/form_submission_status.dart';
import 'package:social_media_app/auth/login/login_event.dart';
import 'package:social_media_app/auth/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginState()) {
    on<LoginUsernameChanged>(_onLoginUsernameChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onLoginUsernameChanged(LoginUsernameChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(username: event.username));
  }

  void _onLoginPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(password: event.password));
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    try {
      await authRepository.login();
      emit(state.copyWith(formStatus: SubmissionSuccess()));
    } on Exception catch (e) {
      emit(state.copyWith(formStatus: SubmissionFailed(e)));
    }
  }
}
