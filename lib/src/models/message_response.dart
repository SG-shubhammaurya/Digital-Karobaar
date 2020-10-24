class MessageResponse {
  int id;
  int userId;
  String userName;
  String message;
  String messageTime;
  String reply;
  String employeeId;
  String employeeName;
  String replyTime;

  MessageResponse(
      {this.id,
      this.userId,
      this.userName,
      this.message,
      this.messageTime,
      this.reply,
      this.employeeId,
      this.employeeName,
      this.replyTime});

  MessageResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    userName = json['user_name'];
    message = json['message'];
    messageTime = json['message_time'];
    reply = json['reply'];
    employeeId = json['employeeId'];
    employeeName = json['employee_name'];
    replyTime = json['reply_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['user_name'] = this.userName;
    data['message'] = this.message;
    data['message_time'] = this.messageTime;
    data['reply'] = this.reply;
    data['employeeId'] = this.employeeId;
    data['employee_name'] = this.employeeName;
    data['reply_time'] = this.replyTime;
    return data;
  }
}