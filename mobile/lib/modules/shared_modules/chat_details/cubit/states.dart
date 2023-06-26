abstract class ChatMessagesStates {}

class InitChatMessagesStats extends ChatMessagesStates {}

class SendMessageSuccessState extends ChatMessagesStates {}

class SendMessageErrorState extends ChatMessagesStates {}

class GetMessageSuccessState extends ChatMessagesStates {}

class GetMessageErrorState extends ChatMessagesStates {}

class CreateChatLoadingState extends ChatMessagesStates {}

class CreateChatSuccessState extends ChatMessagesStates {}

class CreateChatErrorState extends ChatMessagesStates {}