

import 'package:equatable/equatable.dart';

abstract class OtpLoginState extends Equatable{}

class IdleState extends OtpLoginState {
  @override
  List<Object> get props => [];

}
class CodeCountDownState extends OtpLoginState {
 final String value;
 CodeCountDownState(this.value);
  @override
  List<Object> get props => [value];

}
class ConfirmOtpLoading extends OtpLoginState {
  @override
  List<Object> get props =>[];

}
class LoginOtpVerify extends OtpLoginState {
  @override
  List<Object> get props =>[];

}
class PhoneNumberVerify extends OtpLoginState {
  @override
  List<Object> get props =>[];

}
class GoToHomePageState extends OtpLoginState {
  @override
  List<Object> get props =>[];

}
class OtpVerifySuccessfulState extends OtpLoginState {
  final id;
  OtpVerifySuccessfulState(this.id);
  @override
  List<Object> get props =>[id];

}
//ShowError
class ShowErrorState extends OtpLoginState {

  ShowErrorState([this.message]);
  final String message;
  @override
  List<Object> get props =>[message];

}
