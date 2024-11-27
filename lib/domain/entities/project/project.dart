import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

part 'project.freezed.dart';

part 'project.g.dart';

@freezed
class Project with _$Project {
  const Project._();

  const factory Project({
    @Default(0) int priority,
    required String id,
    required String title,
    String? subtitle,
    String? logoUrl,
    String? description,
    @Default([]) List<String> techTags,
    @Default([]) List<String> images,
    String? githubLink,
    String? appLink,
    @TimestampOrStringConverter() DateTime? startDate,
    @TimestampOrStringConverter() DateTime? endDate,
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

  String formatStartDate({String? format}) => startDate == null ? "A long time ago" : DateFormat(format ?? 'dd-MMMM-yyyy').format(startDate!);

  String formatEndDate({String? format}) => endDate == null ? "Current" : DateFormat(format ?? 'dd-MMMM-yyyy').format(endDate!);

  static List<String> allIndustriesTags({List<Project> projects = const []}) {
    return projects.map((p) => p.industries).toList().expand((element) => element).toSet().toList();
  }

  static Future<List<Project>> loadFromJson(developerId) async {
    try {
      final String jsonString = await rootBundle.loadString('assets/projects/$developerId.json');
      final List<dynamic> jsonData = json.decode(jsonString);

      return jsonData.map((json) => Project.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }
}

enum ProjectType {
  contract,
  fullTime,
  freelance,
  petProject,
}

class TimestampOrStringConverter implements JsonConverter<DateTime?, Object?> {
  const TimestampOrStringConverter();

  @override
  DateTime? fromJson(Object? json) {
    if (json is Timestamp) {
      return json.toDate();
    } else if (json is String) {
      return DateTime.tryParse(json);
    }
    return null;
  }

  @override
  Object? toJson(DateTime? date) => date?.toIso8601String();
}
