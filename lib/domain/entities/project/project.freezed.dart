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
  int get priority => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double? get salary => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String> get techTags => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  String? get githubLink => throw _privateConstructorUsedError;
  String? get appLink => throw _privateConstructorUsedError;
  @TimestampOrStringConverter()
  DateTime? get startDate => throw _privateConstructorUsedError;
  @TimestampOrStringConverter()
  DateTime? get endDate => throw _privateConstructorUsedError;
  bool get isPersonal => throw _privateConstructorUsedError;
  String? get projectOwner => throw _privateConstructorUsedError;
  String? get projectOwnerLogoUrl => throw _privateConstructorUsedError;
  ProjectType? get projectType => throw _privateConstructorUsedError;
  List<String> get industries => throw _privateConstructorUsedError;
  Map<String, Map<String, dynamic>> get metadata =>
      throw _privateConstructorUsedError;

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
      {int priority,
      String id,
      String title,
      double? salary,
      String? subtitle,
      String? logoUrl,
      String? description,
      List<String> techTags,
      List<String> images,
      String? githubLink,
      String? appLink,
      @TimestampOrStringConverter() DateTime? startDate,
      @TimestampOrStringConverter() DateTime? endDate,
      bool isPersonal,
      String? projectOwner,
      String? projectOwnerLogoUrl,
      ProjectType? projectType,
      List<String> industries,
      Map<String, Map<String, dynamic>> metadata});
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
    Object? priority = null,
    Object? id = null,
    Object? title = null,
    Object? salary = freezed,
    Object? subtitle = freezed,
    Object? logoUrl = freezed,
    Object? description = freezed,
    Object? techTags = null,
    Object? images = null,
    Object? githubLink = freezed,
    Object? appLink = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? isPersonal = null,
    Object? projectOwner = freezed,
    Object? projectOwnerLogoUrl = freezed,
    Object? projectType = freezed,
    Object? industries = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      salary: freezed == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as double?,
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
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPersonal: null == isPersonal
          ? _value.isPersonal
          : isPersonal // ignore: cast_nullable_to_non_nullable
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
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, dynamic>>,
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
      {int priority,
      String id,
      String title,
      double? salary,
      String? subtitle,
      String? logoUrl,
      String? description,
      List<String> techTags,
      List<String> images,
      String? githubLink,
      String? appLink,
      @TimestampOrStringConverter() DateTime? startDate,
      @TimestampOrStringConverter() DateTime? endDate,
      bool isPersonal,
      String? projectOwner,
      String? projectOwnerLogoUrl,
      ProjectType? projectType,
      List<String> industries,
      Map<String, Map<String, dynamic>> metadata});
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
    Object? priority = null,
    Object? id = null,
    Object? title = null,
    Object? salary = freezed,
    Object? subtitle = freezed,
    Object? logoUrl = freezed,
    Object? description = freezed,
    Object? techTags = null,
    Object? images = null,
    Object? githubLink = freezed,
    Object? appLink = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? isPersonal = null,
    Object? projectOwner = freezed,
    Object? projectOwnerLogoUrl = freezed,
    Object? projectType = freezed,
    Object? industries = null,
    Object? metadata = null,
  }) {
    return _then(_$ProjectImpl(
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      salary: freezed == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as double?,
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
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPersonal: null == isPersonal
          ? _value.isPersonal
          : isPersonal // ignore: cast_nullable_to_non_nullable
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
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectImpl extends _Project {
  const _$ProjectImpl(
      {this.priority = 0,
      required this.id,
      required this.title,
      this.salary,
      this.subtitle,
      this.logoUrl,
      this.description,
      final List<String> techTags = const [],
      final List<String> images = const [],
      this.githubLink,
      this.appLink,
      @TimestampOrStringConverter() this.startDate,
      @TimestampOrStringConverter() this.endDate,
      this.isPersonal = false,
      this.projectOwner,
      this.projectOwnerLogoUrl,
      this.projectType,
      final List<String> industries = const [],
      final Map<String, Map<String, dynamic>> metadata = const {}})
      : _techTags = techTags,
        _images = images,
        _industries = industries,
        _metadata = metadata,
        super._();

  factory _$ProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectImplFromJson(json);

  @override
  @JsonKey()
  final int priority;
  @override
  final String id;
  @override
  final String title;
  @override
  final double? salary;
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
  final DateTime? startDate;
  @override
  @TimestampOrStringConverter()
  final DateTime? endDate;
  @override
  @JsonKey()
  final bool isPersonal;
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

  final Map<String, Map<String, dynamic>> _metadata;
  @override
  @JsonKey()
  Map<String, Map<String, dynamic>> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'Project(priority: $priority, id: $id, title: $title, salary: $salary, subtitle: $subtitle, logoUrl: $logoUrl, description: $description, techTags: $techTags, images: $images, githubLink: $githubLink, appLink: $appLink, startDate: $startDate, endDate: $endDate, isPersonal: $isPersonal, projectOwner: $projectOwner, projectOwnerLogoUrl: $projectOwnerLogoUrl, projectType: $projectType, industries: $industries, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectImpl &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.salary, salary) || other.salary == salary) &&
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
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.isPersonal, isPersonal) ||
                other.isPersonal == isPersonal) &&
            (identical(other.projectOwner, projectOwner) ||
                other.projectOwner == projectOwner) &&
            (identical(other.projectOwnerLogoUrl, projectOwnerLogoUrl) ||
                other.projectOwnerLogoUrl == projectOwnerLogoUrl) &&
            (identical(other.projectType, projectType) ||
                other.projectType == projectType) &&
            const DeepCollectionEquality()
                .equals(other._industries, _industries) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        priority,
        id,
        title,
        salary,
        subtitle,
        logoUrl,
        description,
        const DeepCollectionEquality().hash(_techTags),
        const DeepCollectionEquality().hash(_images),
        githubLink,
        appLink,
        startDate,
        endDate,
        isPersonal,
        projectOwner,
        projectOwnerLogoUrl,
        projectType,
        const DeepCollectionEquality().hash(_industries),
        const DeepCollectionEquality().hash(_metadata)
      ]);

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

abstract class _Project extends Project {
  const factory _Project(
      {final int priority,
      required final String id,
      required final String title,
      final double? salary,
      final String? subtitle,
      final String? logoUrl,
      final String? description,
      final List<String> techTags,
      final List<String> images,
      final String? githubLink,
      final String? appLink,
      @TimestampOrStringConverter() final DateTime? startDate,
      @TimestampOrStringConverter() final DateTime? endDate,
      final bool isPersonal,
      final String? projectOwner,
      final String? projectOwnerLogoUrl,
      final ProjectType? projectType,
      final List<String> industries,
      final Map<String, Map<String, dynamic>> metadata}) = _$ProjectImpl;
  const _Project._() : super._();

  factory _Project.fromJson(Map<String, dynamic> json) = _$ProjectImpl.fromJson;

  @override
  int get priority;
  @override
  String get id;
  @override
  String get title;
  @override
  double? get salary;
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
  DateTime? get startDate;
  @override
  @TimestampOrStringConverter()
  DateTime? get endDate;
  @override
  bool get isPersonal;
  @override
  String? get projectOwner;
  @override
  String? get projectOwnerLogoUrl;
  @override
  ProjectType? get projectType;
  @override
  List<String> get industries;
  @override
  Map<String, Map<String, dynamic>> get metadata;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
