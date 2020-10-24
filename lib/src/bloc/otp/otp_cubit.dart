import 'package:digitalkarobaar/src/repository/auth_repository.dart';
import 'package:digitalkarobaar/src/res/connectivity.dart';
import 'optlogin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpCubit extends Cubit<OtpLoginState> with ConnectivityChecker {
  final AuthRepository authRepository;
  OtpCubit(this.authRepository)
      : assert(authRepository != null),
        super(IdleState());

  sendNumber(String phoneNumber) async {
    try {
      if (!await isConnected()) {
        emit(ShowErrorState('Please Check Your NetWork Connection'));
        return;
      }
      emit(ConfirmOtpLoading());
      final typeUser = await authRepository.login(phoneNumber);

      if (typeUser is LogingForRegistration) {
        emit(PhoneNumberVerify());
      }
      if (typeUser is UserLogged) {
        emit(LoginOtpVerify());
      }
    } catch (e) {
      emit(ShowErrorState(e));
    }
  }

  otpForNewUser(String phoneNumber, String otp) async {
    //emit(ConfirmOtpLoading());
    try {
      final id = await authRepository.otpNewUser(phoneNumber, otp);
      emit(OtpVerifySuccessfulState(id));
    } catch (e) {
      emit(ShowErrorState(e));
    }
  }

  otpForRegisteredUser(String otp) async {
    //emit(ConfirmOtpLoading());
    try {
      final result = await authRepository.loginOtpVerify(otp);
      emit(GoToHomePageState());
    } catch (e) {
      emit(ShowErrorState(e));
    }
  }
}
