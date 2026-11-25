import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

/// Portfolio project synchronized with the Django REST Framework API.
@JsonSerializable(fieldRename: FieldRename.snake)
class Project {
  const Project({
    required this.title,
    required this.description,
    required this.year,
    required this.role,
    required this.stack,
    required this.problem,
    required this.goals,
    this.thumbnail = '',
    this.screenshot = '',
    this.id,
  });

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;
  final String title;
  final String description;
  final int year;
  final String role;
  final String stack;
  final String problem;
  final String goals;

  @JsonKey(defaultValue: '')
  final String thumbnail;
  final String screenshot;

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}