// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeveloperImpl _$$DeveloperImplFromJson(Map<String, dynamic> json) =>
    _$DeveloperImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      githubUrl: json['githubUrl'] as String?,
      linkedInUrl: json['linkedInUrl'] as String?,
      bannerUrl: json['bannerUrl'] as String?,
      smallBrandingBanner: json['smallBrandingBanner'] as String?,
    );

Map<String, dynamic> _$$DeveloperImplToJson(_$DeveloperImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profileImageUrl': instance.profileImageUrl,
      'githubUrl': instance.githubUrl,
      'linkedInUrl': instance.linkedInUrl,
      'bannerUrl': instance.bannerUrl,
      'smallBrandingBanner': instance.smallBrandingBanner,
    };