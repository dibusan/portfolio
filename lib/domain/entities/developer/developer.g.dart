// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeveloperImpl _$$DeveloperImplFromJson(Map<String, dynamic> json) =>
    _$DeveloperImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      info: json['info'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      githubUrl: json['githubUrl'] as String?,
      linkedInUrl: json['linkedInUrl'] as String?,
      bannerUrl: json['bannerUrl'] as String?,
      smallBrandingBanner: json['smallBrandingBanner'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      emailContact: json['emailContact'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$DeveloperImplToJson(_$DeveloperImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'info': instance.info,
      'profileImageUrl': instance.profileImageUrl,
      'githubUrl': instance.githubUrl,
      'linkedInUrl': instance.linkedInUrl,
      'bannerUrl': instance.bannerUrl,
      'smallBrandingBanner': instance.smallBrandingBanner,
      'phoneNumber': instance.phoneNumber,
      'emailContact': instance.emailContact,
      'password': instance.password,
    };
