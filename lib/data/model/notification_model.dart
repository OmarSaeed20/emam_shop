class NotificationModel {
  final String? id;
  final String? userid;
  final String? body;
  final String? title;
  final String? datatime;

  const NotificationModel({
    this.id,
    this.userid,
    this.body,
    this.title,
    this.datatime,
  });
  NotificationModel copyWith({
    String? id,
    String? userid,
    String? body,
    String? title,
    String? datatime,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      userid: userid ?? this.userid,
      body: body ?? this.body,
      title: title ?? this.title,
      datatime: datatime ?? this.datatime,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'notification_id': id,
      'notification_userid': userid,
      'notification_body': body,
      'notification_title': title,
      'notification_datatime': datatime
    };
  }

  static NotificationModel fromJson(Map<String, Object?> json) {
    return NotificationModel(
      id: json['notification_id'] == null
          ? null
          : json['notification_id'] as String,
      userid: json['notification_userid'] == null
          ? null
          : json['notification_userid'] as String,
      body: json['notification_body'] == null
          ? null
          : json['notification_body'] as String,
      title: json['notification_title'] == null
          ? null
          : json['notification_title'] as String,
      datatime: json['notification_datatime'] == null
          ? null
          : json['notification_datatime'] as String,
    );
  }

  @override
  String toString() {
    return '''NotificationModel(
                id:$id,
userid:$userid,
body:$body,
title:$title,
datatime:$datatime
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is NotificationModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.userid == userid &&
        other.body == body &&
        other.title == title &&
        other.datatime == datatime;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      id,
      userid,
      body,
      title,
      datatime,
    );
  }
}
