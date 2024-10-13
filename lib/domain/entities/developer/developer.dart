import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'developer.freezed.dart';

part 'developer.g.dart';

@freezed
class Developer with _$Developer {
  const factory Developer({
    required String id,
    required String name,
    String? info,
    String? profileImageUrl,
    String? githubUrl,
    String? linkedInUrl,
    String? bannerUrl,
    String? smallBrandingBanner,
    String? phoneNumber,
    String? emailContact,
    String? password,
  }) = _Developer;

  factory Developer.fromJson(Map<String, Object?> json) => _$DeveloperFromJson(json);

  static Future<Developer> loadFromJson(String developerId) async {
    Developer defaultDeveloper = Developer(id: developerId, name: "Developer", info: developerId);
    try {
      final String jsonString = await rootBundle.loadString('assets/developers.json');
      final List<dynamic> jsonData = json.decode(jsonString);
      final list = jsonData.map((json) => Developer.fromJson(json)).toList();
      Developer? developer = list.firstWhere((e) => e.id == developerId, orElse: () => defaultDeveloper);
      return developer;
    } catch (e) {
      return defaultDeveloper;
    }
  }
}
