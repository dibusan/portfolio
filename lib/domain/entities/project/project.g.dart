// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
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
      projectStartDate:
          const TimestampOrStringConverter().fromJson(json['projectStartDate']),
      projectLaunchDate: const TimestampOrStringConverter()
          .fromJson(json['projectLaunchDate']),
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
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'logoUrl': instance.logoUrl,
      'description': instance.description,
      'techTags': instance.techTags,
      'images': instance.images,
      'githubLink': instance.githubLink,
      'appLink': instance.appLink,
      'projectStartDate':
          const TimestampOrStringConverter().toJson(instance.projectStartDate),
      'projectLaunchDate':
          const TimestampOrStringConverter().toJson(instance.projectLaunchDate),
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
