// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
mixin _$Project {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String> get techTags => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  String? get githubLink => throw _privateConstructorUsedError;
  String? get appLink => throw _privateConstructorUsedError;
  @TimestampOrStringConverter()
  DateTime? get projectStartDate => throw _privateConstructorUsedError;
  @TimestampOrStringConverter()
  DateTime? get projectLaunchDate => throw _privateConstructorUsedError;
  bool get isInProgress => throw _privateConstructorUsedError;
  String? get projectOwner => throw _privateConstructorUsedError;
  String? get projectOwnerLogoUrl => throw _privateConstructorUsedError;
  ProjectType? get projectType => throw _privateConstructorUsedError;
  List<String> get industries => throw _privateConstructorUsedError;

  /// Serializes this Project to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? subtitle,
      String? logoUrl,
      String? description,
      List<String> techTags,
      List<String> images,
      String? githubLink,
      String? appLink,
      @TimestampOrStringConverter() DateTime? projectStartDate,
      @TimestampOrStringConverter() DateTime? projectLaunchDate,
      bool isInProgress,
      String? projectOwner,
      String? projectOwnerLogoUrl,
      ProjectType? projectType,
      List<String> industries});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = freezed,
    Object? logoUrl = freezed,
    Object? description = freezed,
    Object? techTags = null,
    Object? images = null,
    Object? githubLink = freezed,
    Object? appLink = freezed,
    Object? projectStartDate = freezed,
    Object? projectLaunchDate = freezed,
    Object? isInProgress = null,
    Object? projectOwner = freezed,
    Object? projectOwnerLogoUrl = freezed,
    Object? projectType = freezed,
    Object? industries = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      techTags: null == techTags
          ? _value.techTags
          : techTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      githubLink: freezed == githubLink
          ? _value.githubLink
          : githubLink // ignore: cast_nullable_to_non_nullable
              as String?,
      appLink: freezed == appLink
          ? _value.appLink
          : appLink // ignore: cast_nullable_to_non_nullable
              as String?,
      projectStartDate: freezed == projectStartDate
          ? _value.projectStartDate
          : projectStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      projectLaunchDate: freezed == projectLaunchDate
          ? _value.projectLaunchDate
          : projectLaunchDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isInProgress: null == isInProgress
          ? _value.isInProgress
          : isInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      projectOwner: freezed == projectOwner
          ? _value.projectOwner
          : projectOwner // ignore: cast_nullable_to_non_nullable
              as String?,
      projectOwnerLogoUrl: freezed == projectOwnerLogoUrl
          ? _value.projectOwnerLogoUrl
          : projectOwnerLogoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      projectType: freezed == projectType
          ? _value.projectType
          : projectType // ignore: cast_nullable_to_non_nullable
              as ProjectType?,
      industries: null == industries
          ? _value.industries
          : industries // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectImplCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$ProjectImplCopyWith(
          _$ProjectImpl value, $Res Function(_$ProjectImpl) then) =
      __$$ProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? subtitle,
      String? logoUrl,
      String? description,
      List<String> techTags,
      List<String> images,
      String? githubLink,
      String? appLink,
      @TimestampOrStringConverter() DateTime? projectStartDate,
      @TimestampOrStringConverter() DateTime? projectLaunchDate,
      bool isInProgress,
      String? projectOwner,
      String? projectOwnerLogoUrl,
      ProjectType? projectType,
      List<String> industries});
}

/// @nodoc
class __$$ProjectImplCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$ProjectImpl>
    implements _$$ProjectImplCopyWith<$Res> {
  __$$ProjectImplCopyWithImpl(
      _$ProjectImpl _value, $Res Function(_$ProjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = freezed,
    Object? logoUrl = freezed,
    Object? description = freezed,
    Object? techTags = null,
    Object? images = null,
    Object? githubLink = freezed,
    Object? appLink = freezed,
    Object? projectStartDate = freezed,
    Object? projectLaunchDate = freezed,
    Object? isInProgress = null,
    Object? projectOwner = freezed,
    Object? projectOwnerLogoUrl = freezed,
    Object? projectType = freezed,
    Object? industries = null,
  }) {
    return _then(_$ProjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      techTags: null == techTags
          ? _value._techTags
          : techTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      githubLink: freezed == githubLink
          ? _value.githubLink
          : githubLink // ignore: cast_nullable_to_non_nullable
              as String?,
      appLink: freezed == appLink
          ? _value.appLink
          : appLink // ignore: cast_nullable_to_non_nullable
              as String?,
      projectStartDate: freezed == projectStartDate
          ? _value.projectStartDate
          : projectStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      projectLaunchDate: freezed == projectLaunchDate
          ? _value.projectLaunchDate
          : projectLaunchDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isInProgress: null == isInProgress
          ? _value.isInProgress
          : isInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      projectOwner: freezed == projectOwner
          ? _value.projectOwner
          : projectOwner // ignore: cast_nullable_to_non_nullable
              as String?,
      projectOwnerLogoUrl: freezed == projectOwnerLogoUrl
          ? _value.projectOwnerLogoUrl
          : projectOwnerLogoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      projectType: freezed == projectType
          ? _value.projectType
          : projectType // ignore: cast_nullable_to_non_nullable
              as ProjectType?,
      industries: null == industries
          ? _value._industries
          : industries // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectImpl implements _Project {
  const _$ProjectImpl(
      {required this.id,
      required this.title,
      this.subtitle,
      this.logoUrl,
      this.description,
      final List<String> techTags = const [],
      final List<String> images = const [],
      this.githubLink,
      this.appLink,
      @TimestampOrStringConverter() this.projectStartDate,
      @TimestampOrStringConverter() this.projectLaunchDate,
      this.isInProgress = false,
      this.projectOwner,
      this.projectOwnerLogoUrl,
      this.projectType,
      final List<String> industries = const []})
      : _techTags = techTags,
        _images = images,
        _industries = industries;

  factory _$ProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? subtitle;
  @override
  final String? logoUrl;
  @override
  final String? description;
  final List<String> _techTags;
  @override
  @JsonKey()
  List<String> get techTags {
    if (_techTags is EqualUnmodifiableListView) return _techTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_techTags);
  }

  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String? githubLink;
  @override
  final String? appLink;
  @override
  @TimestampOrStringConverter()
  final DateTime? projectStartDate;
  @override
  @TimestampOrStringConverter()
  final DateTime? projectLaunchDate;
  @override
  @JsonKey()
  final bool isInProgress;
  @override
  final String? projectOwner;
  @override
  final String? projectOwnerLogoUrl;
  @override
  final ProjectType? projectType;
  final List<String> _industries;
  @override
  @JsonKey()
  List<String> get industries {
    if (_industries is EqualUnmodifiableListView) return _industries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_industries);
  }

  @override
  String toString() {
    return 'Project(id: $id, title: $title, subtitle: $subtitle, logoUrl: $logoUrl, description: $description, techTags: $techTags, images: $images, githubLink: $githubLink, appLink: $appLink, projectStartDate: $projectStartDate, projectLaunchDate: $projectLaunchDate, isInProgress: $isInProgress, projectOwner: $projectOwner, projectOwnerLogoUrl: $projectOwnerLogoUrl, projectType: $projectType, industries: $industries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._techTags, _techTags) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.githubLink, githubLink) ||
                other.githubLink == githubLink) &&
            (identical(other.appLink, appLink) || other.appLink == appLink) &&
            (identical(other.projectStartDate, projectStartDate) ||
                other.projectStartDate == projectStartDate) &&
            (identical(other.projectLaunchDate, projectLaunchDate) ||
                other.projectLaunchDate == projectLaunchDate) &&
            (identical(other.isInProgress, isInProgress) ||
                other.isInProgress == isInProgress) &&
            (identical(other.projectOwner, projectOwner) ||
                other.projectOwner == projectOwner) &&
            (identical(other.projectOwnerLogoUrl, projectOwnerLogoUrl) ||
                other.projectOwnerLogoUrl == projectOwnerLogoUrl) &&
            (identical(other.projectType, projectType) ||
                other.projectType == projectType) &&
            const DeepCollectionEquality()
                .equals(other._industries, _industries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      subtitle,
      logoUrl,
      description,
      const DeepCollectionEquality().hash(_techTags),
      const DeepCollectionEquality().hash(_images),
      githubLink,
      appLink,
      projectStartDate,
      projectLaunchDate,
      isInProgress,
      projectOwner,
      projectOwnerLogoUrl,
      projectType,
      const DeepCollectionEquality().hash(_industries));

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      __$$ProjectImplCopyWithImpl<_$ProjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectImplToJson(
      this,
    );
  }
}

abstract class _Project implements Project {
  const factory _Project(
      {required final String id,
      required final String title,
      final String? subtitle,
      final String? logoUrl,
      final String? description,
      final List<String> techTags,
      final List<String> images,
      final String? githubLink,
      final String? appLink,
      @TimestampOrStringConverter() final DateTime? projectStartDate,
      @TimestampOrStringConverter() final DateTime? projectLaunchDate,
      final bool isInProgress,
      final String? projectOwner,
      final String? projectOwnerLogoUrl,
      final ProjectType? projectType,
      final List<String> industries}) = _$ProjectImpl;

  factory _Project.fromJson(Map<String, dynamic> json) = _$ProjectImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String? get logoUrl;
  @override
  String? get description;
  @override
  List<String> get techTags;
  @override
  List<String> get images;
  @override
  String? get githubLink;
  @override
  String? get appLink;
  @override
  @TimestampOrStringConverter()
  DateTime? get projectStartDate;
  @override
  @TimestampOrStringConverter()
  DateTime? get projectLaunchDate;
  @override
  bool get isInProgress;
  @override
  String? get projectOwner;
  @override
  String? get projectOwnerLogoUrl;
  @override
  ProjectType? get projectType;
  @override
  List<String> get industries;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
