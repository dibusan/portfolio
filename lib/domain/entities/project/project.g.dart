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
      isInProgress: json['isInProgress'] as bool? ?? false,
      projectOwner: json['projectOwner'] as String?,
      projectOwnerLogoUrl: json['projectOwnerLogoUrl'] as String?,
      projectType:
          $enumDecodeNullable(_$ProjectTypeEnumMap, json['projectType']),
      industries: (json['industries'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'priority': instance.priority,
      'id': instance.id,
      'title': instance.title,
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
      'isInProgress': instance.isInProgress,
      'projectOwner': instance.projectOwner,
      'projectOwnerLogoUrl': instance.projectOwnerLogoUrl,
      'projectType': _$ProjectTypeEnumMap[instance.projectType],
      'industries': instance.industries,
    };

const _$ProjectTypeEnumMap = {
  ProjectType.contract: 'contract',
  ProjectType.fullTime: 'fullTime',
  ProjectType.freelance: 'freelance',
  ProjectType.petProject: 'petProject',
};
