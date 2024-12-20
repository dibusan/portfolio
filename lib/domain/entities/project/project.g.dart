// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      priority: (json['priority'] as num?)?.toInt() ?? 0,
      id: json['id'] as String,
      title: json['title'] as String,
      salary: (json['salary'] as num?)?.toDouble(),
      subtitle: json['subtitle'] as String?,
      logoUrl: json['logoUrl'] as String?,
      description: json['description'] as String?,
      techTags: (json['techTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      githubLink: json['githubLink'] as String?,
      appLink: json['appLink'] as String?,
      startDate: const TimestampOrStringConverter().fromJson(json['startDate']),
      endDate: const TimestampOrStringConverter().fromJson(json['endDate']),
      isPersonal: json['isPersonal'] as bool? ?? false,
      projectOwner: json['projectOwner'] as String?,
      projectOwnerLogoUrl: json['projectOwnerLogoUrl'] as String?,
      projectType:
          $enumDecodeNullable(_$ProjectTypeEnumMap, json['projectType']),
      industries: (json['industries'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as Map<String, dynamic>),
          ) ??
          const {},
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'priority': instance.priority,
      'id': instance.id,
      'title': instance.title,
      'salary': instance.salary,
      'subtitle': instance.subtitle,
      'logoUrl': instance.logoUrl,
      'description': instance.description,
      'techTags': instance.techTags,
      'images': instance.images,
      'githubLink': instance.githubLink,
      'appLink': instance.appLink,
      'startDate':
          const TimestampOrStringConverter().toJson(instance.startDate),
      'endDate': const TimestampOrStringConverter().toJson(instance.endDate),
      'isPersonal': instance.isPersonal,
      'projectOwner': instance.projectOwner,
      'projectOwnerLogoUrl': instance.projectOwnerLogoUrl,
      'projectType': _$ProjectTypeEnumMap[instance.projectType],
      'industries': instance.industries,
      'metadata': instance.metadata,
    };

const _$ProjectTypeEnumMap = {
  ProjectType.contract: 'contract',
  ProjectType.fullTime: 'fullTime',
  ProjectType.freelance: 'freelance',
  ProjectType.petProject: 'petProject',
};
