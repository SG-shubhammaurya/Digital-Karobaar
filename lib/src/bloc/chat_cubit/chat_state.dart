import 'package:digitalkarobaar/src/models/message_response.dart';
import 'package:equatable/equatable.dart';

abstract class ChatState extends Equatable {}

class ChatInitialSate extends ChatState {
  @override
  List<Object> get props => [];
}
class LoadingSate extends ChatState {
  @override
  List<Object> get props => [];
}
class LoadInCommingMessage extends ChatState {
  final List<MessageResponse> messageResponse;
  LoadInCommingMessage(this.messageResponse);
  @override
  List<Object> get props => [messageResponse];
}

class ErrorState extends ChatState {
  final message;
  ErrorState(this.message);
  @override
  List<Object> get props => [message];
}
