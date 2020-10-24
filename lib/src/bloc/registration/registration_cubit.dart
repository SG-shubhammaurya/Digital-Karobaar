import 'package:digitalkarobaar/src/bloc/registration/registration_state.dart';
import 'package:digitalkarobaar/src/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final AuthRepository authRepository;
  RegistrationCubit(this.authRepository) : super(RegistrationInitialSate());

  void sendData(String name, String business, String pincode, String id) async {
    
    try {
      emit(RegistrationLoadingSate());
      final result =
          await authRepository.onRegistration(name, business, pincode, id);
      emit(RegistrationSuccessfulState());
    } catch (e) {
      emit(RegistrationErrorState());
    }
   }
}
