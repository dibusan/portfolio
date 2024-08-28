import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'project.freezed.dart';

part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    int? id,
    required String title,
    String? subtitle,
    String? logoUrl,
    String? description,
    @Default([]) List<String> techTags,
    @Default([]) List<String> images,
    String? githubLink,
    String? appLink,
    DateTime? projectStartDate,
    DateTime? projectLaunchDate,
    @Default(false) bool isInProgress,
    String? projectOwner,
    String? projectOwnerLogoUrl,
    ProjectType? projectType,
    @Default([]) List<String> industries,
  }) = _Project;

  factory Project.fromJson(Map<String, Object?> json) => _$ProjectFromJson(json);

  static List<String> allTechTags({List<Project> projects = const []}) {
    return projects.map((p) => p.techTags).toList().expand((element) => element).toSet().toList();
  }

  static Future<List<Project>> loadFromJson() async {
    print("loadFromJson");
    final String jsonString = await rootBundle.loadString('assets/projects.json');
    final List<dynamic> jsonData = json.decode(jsonString);

    return jsonData.map((json) => Project.fromJson(json)).toList();
  }
}

enum ProjectType {
  contract,
  fullTime,
  freelance,
  petProject,
}
