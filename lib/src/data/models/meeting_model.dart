import 'package:planner/src/domain/entities/meeting.dart';

class MeetingModel extends Meeting {
  MeetingModel({
    required super.id,
    required super.title,
    required super.description,
    required super.date,
  });

  factory MeetingModel.fromMap(Map<String, dynamic> map) {
    return MeetingModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      date: DateTime.parse(map['date'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
    };
  }
}