import 'package:digitalkarobaar/src/bloc/chat_cubit/chat_state.dart';
import 'package:digitalkarobaar/src/repository/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository chatRepository;
  ChatCubit(this.chatRepository)
      : assert(chatRepository != null),
        super(ChatInitialSate());

  loadInCommingMessage() async {
    try {
       emit(LoadingSate());
      final messages = await chatRepository.getMessage();
      emit(LoadInCommingMessage(messages));
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  sendMessage(String message) async {
    try {
       await chatRepository.sendMessage(message);
    } catch (e) {
      emit(ErrorState(e));
    }
  }
}
