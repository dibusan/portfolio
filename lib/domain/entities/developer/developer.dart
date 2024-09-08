import 'package:freezed_annotation/freezed_annotation.dart';

part 'developer.freezed.dart';

part 'developer.g.dart';

@freezed
class Developer with _$Developer {
  const factory Developer({
    required String id,
    required String name,
    String? profileImageUrl,
    String? githubUrl,
    String? linkedInUrl,
    String? bannerUrl,
    String? smallBrandingBanner,
    String? phoneNumber,
    String? emailContact,
  }) = _Developer;

  factory Developer.fromJson(Map<String, Object?> json) => _$DeveloperFromJson(json);

  factory Developer.eriel() {
    return const Developer(
      id: "1",
      name: "Eriel Marimon",
      phoneNumber: '+1 786 428 8315',
      emailContact: 'erieljr1@gmail.com',
      profileImageUrl:
          "https://media.licdn.com/dms/image/v2/D4E03AQGzQI0e7CZIBA/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1718731199523?e=1729123200&v=beta&t=JnbTczVPLptPTPsM6ZZH4p-GGWKh1UpsSO-mnA5J47c",
      bannerUrl: "https://fastly.picsum.photos/id/311/1920/480.jpg?hmac=c8ubwob1rlvsf5HrZRx1L5yrIitznw_5TzjVRVKwqdc",
      githubUrl: "https://github.com/dibusan",
      linkedInUrl: "https://www.linkedin.com/in/eriel-marimon-393593bb",
      smallBrandingBanner:
          "https://fastly.picsum.photos/id/839/228/85.jpg?hmac=h3IkIz8u57tIxLe5_64XD4i0zkU0AJoJAv-sSV6AHNM",
    );
  }
}
