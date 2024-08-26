class Project {
  int? id;
  String? title;
  String? logoUrl; // Logo del proyecto
  String? subtitle;
  String? description;
  List<String>? techTags; // Python, Flutter, PgSQL, etc
  List<String>? images; // Imagenes de demostracion
  String? githubLink; // Link a codigo
  String? appLink; // Link a webpage o descarga en mobil
  DateTime? projectStartDate; // Cuando inicio el proyecto
  DateTime? projectLaunchDate; // Cuando se lanzo el proyecto
  bool? isInProgress; // Se continua avanzando en este proyecto ?
  String? projectOwner; // Nombre del dueño del proyecto, puede ser otra empresa
  String? projectOwnerLogoUrl; // Enlace al icono del dueño
  ProjectType? projectType;
  List<String>? industries;

  Project({
    this.id,
    this.title,
    this.logoUrl,
    this.subtitle,
    this.description,
    this.techTags,
    this.images,
    this.githubLink,
    this.appLink,
    this.projectStartDate,
    this.projectLaunchDate,
    this.isInProgress,
    this.projectOwner,
    this.projectOwnerLogoUrl,
    this.projectType,
    this.industries,
  });

  static List<Project> myProjects() {
    List<Project> samples = [];
    for(int i = 0; i < 20; i++) {
      samples.add(sampleProject());
    }
    return samples;
  }

  static Project sampleProject() {
    return Project(
      id: 1,
      title: "JukeAudio",
      logoUrl:
      "https://cdn.prod.website-files.com/65026a74e1e0ef386dea70f2/65046543b137643501680d7b_logo.webp",
      subtitle: "Test Subtitle",
      description: "Test Description",
      techTags: ["Python", "Flutter", "Django", "Flask", "IoT", "Postgres"],
      images: [
        "https://cdn.prod.website-files.com/65026a74e1e0ef386dea70f2/66b2499d518b1932ed559465_The-Mobile-App.webp",
        "https://cdn.prod.website-files.com/65026a74e1e0ef386dea70f2/66b2499d518b1932ed559465_The-Mobile-App.webp",
        "https://cdn.prod.website-files.com/65026a74e1e0ef386dea70f2/66b2499d518b1932ed559465_The-Mobile-App.webp",
      ],
      appLink:
      "https://play.google.com/store/apps/details?id=com.juke.audio.juke_audio&pcampaignid=web_share",
      projectStartDate: DateTime(2022, 1, 1),
      projectLaunchDate: DateTime(2023, 4, 7),
      isInProgress: false,
      projectOwner: "Juke Audio",
      projectOwnerLogoUrl:
      "https://cdn.prod.website-files.com/65026a74e1e0ef386dea70f2/65046543b137643501680d7b_logo.webp",
      projectType: ProjectType.freelance,
      industries: ["Home Entertainment", "IoT"],
    );
  }
}

enum ProjectType {
  contract,
  fullTime,
  freelance,
  petProject,
}
