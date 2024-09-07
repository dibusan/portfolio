// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'developer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Developer _$DeveloperFromJson(Map<String, dynamic> json) {
  return _Developer.fromJson(json);
}

/// @nodoc
mixin _$Developer {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String? get githubUrl => throw _privateConstructorUsedError;
  String? get linkedInUrl => throw _privateConstructorUsedError;
  String? get bannerUrl => throw _privateConstructorUsedError;
  String? get smallBrandingBanner => throw _privateConstructorUsedError;

  /// Serializes this Developer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Developer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeveloperCopyWith<Developer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeveloperCopyWith<$Res> {
  factory $DeveloperCopyWith(Developer value, $Res Function(Developer) then) =
      _$DeveloperCopyWithImpl<$Res, Developer>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? profileImageUrl,
      String? githubUrl,
      String? linkedInUrl,
      String? bannerUrl,
      String? smallBrandingBanner});
}

/// @nodoc
class _$DeveloperCopyWithImpl<$Res, $Val extends Developer>
    implements $DeveloperCopyWith<$Res> {
  _$DeveloperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Developer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profileImageUrl = freezed,
    Object? githubUrl = freezed,
    Object? linkedInUrl = freezed,
    Object? bannerUrl = freezed,
    Object? smallBrandingBanner = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      githubUrl: freezed == githubUrl
          ? _value.githubUrl
          : githubUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedInUrl: freezed == linkedInUrl
          ? _value.linkedInUrl
          : linkedInUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      smallBrandingBanner: freezed == smallBrandingBanner
          ? _value.smallBrandingBanner
          : smallBrandingBanner // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeveloperImplCopyWith<$Res>
    implements $DeveloperCopyWith<$Res> {
  factory _$$DeveloperImplCopyWith(
          _$DeveloperImpl value, $Res Function(_$DeveloperImpl) then) =
      __$$DeveloperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? profileImageUrl,
      String? githubUrl,
      String? linkedInUrl,
      String? bannerUrl,
      String? smallBrandingBanner});
}

/// @nodoc
class __$$DeveloperImplCopyWithImpl<$Res>
    extends _$DeveloperCopyWithImpl<$Res, _$DeveloperImpl>
    implements _$$DeveloperImplCopyWith<$Res> {
  __$$DeveloperImplCopyWithImpl(
      _$DeveloperImpl _value, $Res Function(_$DeveloperImpl) _then)
      : super(_value, _then);

  /// Create a copy of Developer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profileImageUrl = freezed,
    Object? githubUrl = freezed,
    Object? linkedInUrl = freezed,
    Object? bannerUrl = freezed,
    Object? smallBrandingBanner = freezed,
  }) {
    return _then(_$DeveloperImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      githubUrl: freezed == githubUrl
          ? _value.githubUrl
          : githubUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedInUrl: freezed == linkedInUrl
          ? _value.linkedInUrl
          : linkedInUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      smallBrandingBanner: freezed == smallBrandingBanner
          ? _value.smallBrandingBanner
          : smallBrandingBanner // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeveloperImpl implements _Developer {
  const _$DeveloperImpl(
      {required this.id,
      required this.name,
      this.profileImageUrl,
      this.githubUrl,
      this.linkedInUrl,
      this.bannerUrl,
      this.smallBrandingBanner});

  factory _$DeveloperImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeveloperImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? profileImageUrl;
  @override
  final String? githubUrl;
  @override
  final String? linkedInUrl;
  @override
  final String? bannerUrl;
  @override
  final String? smallBrandingBanner;

  @override
  String toString() {
    return 'Developer(id: $id, name: $name, profileImageUrl: $profileImageUrl, githubUrl: $githubUrl, linkedInUrl: $linkedInUrl, bannerUrl: $bannerUrl, smallBrandingBanner: $smallBrandingBanner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeveloperImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.githubUrl, githubUrl) ||
                other.githubUrl == githubUrl) &&
            (identical(other.linkedInUrl, linkedInUrl) ||
                other.linkedInUrl == linkedInUrl) &&
            (identical(other.bannerUrl, bannerUrl) ||
                other.bannerUrl == bannerUrl) &&
            (identical(other.smallBrandingBanner, smallBrandingBanner) ||
                other.smallBrandingBanner == smallBrandingBanner));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, profileImageUrl,
      githubUrl, linkedInUrl, bannerUrl, smallBrandingBanner);

  /// Create a copy of Developer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeveloperImplCopyWith<_$DeveloperImpl> get copyWith =>
      __$$DeveloperImplCopyWithImpl<_$DeveloperImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeveloperImplToJson(
      this,
    );
  }
}

abstract class _Developer implements Developer {
  const factory _Developer(
      {required final String id,
      required final String name,
      final String? profileImageUrl,
      final String? githubUrl,
      final String? linkedInUrl,
      final String? bannerUrl,
      final String? smallBrandingBanner}) = _$DeveloperImpl;

  factory _Developer.fromJson(Map<String, dynamic> json) =
      _$DeveloperImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get profileImageUrl;
  @override
  String? get githubUrl;
  @override
  String? get linkedInUrl;
  @override
  String? get bannerUrl;
  @override
  String? get smallBrandingBanner;

  /// Create a copy of Developer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeveloperImplCopyWith<_$DeveloperImpl> get copyWith =>
      throw _privateConstructorUsedError;
}