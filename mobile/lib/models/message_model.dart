import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  late String senderId;
  late String receiverId;
  late String messageText;
  late String dateTime;

  MessageModel({
    required this.senderId,
    required this.receiverId,
    required this.dateTime,
    required this.messageText,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    dateTime = json['dateTime'];
    messageText = json['messageText'];
  }

  factory MessageModel.fromFirestore(DocumentSnapshot snapshot) {
    return MessageModel(
      senderId: snapshot['senderId'],
      receiverId: snapshot['receiverId'],
      dateTime: snapshot['dateTime'],
      messageText: snapshot['messageText'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'dateTime': dateTime,
      'messageText': messageText,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'dateTime': dateTime,
      'messageText': messageText,
    };
  }
}
