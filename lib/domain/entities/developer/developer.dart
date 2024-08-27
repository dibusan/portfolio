class Developer {
  int? id;
  String? name;
  String? profileImageUrl;
  String? githubUrl;
  String? linkedInUrl;
  String? bannerUrl;
  String? smallBrandingBanner;

  Developer({
    this.id,
    this.name,
    this.profileImageUrl,
    this.githubUrl,
    this.linkedInUrl,
    this.bannerUrl,
    this.smallBrandingBanner,
  });

  factory Developer.eriel() {
    return Developer(
      id: 1,
      name: "Eriel Marimon",
      profileImageUrl: "https://media.licdn.com/dms/image/v2/D4E03AQGzQI0e7CZIBA/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1718731199523?e=1729123200&v=beta&t=JnbTczVPLptPTPsM6ZZH4p-GGWKh1UpsSO-mnA5J47c",
      bannerUrl: "https://fastly.picsum.photos/id/311/1920/480.jpg?hmac=c8ubwob1rlvsf5HrZRx1L5yrIitznw_5TzjVRVKwqdc",
      githubUrl: "https://github.com/dibusan",
      linkedInUrl: "https://www.linkedin.com/in/eriel-marimon-393593bb",
      smallBrandingBanner: "https://fastly.picsum.photos/id/839/228/85.jpg?hmac=h3IkIz8u57tIxLe5_64XD4i0zkU0AJoJAv-sSV6AHNM",
    );
  }
}
