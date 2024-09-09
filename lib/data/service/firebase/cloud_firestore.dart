import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class DeveloperInfo {
  Developer developer;
  List<Project> projects;

  DeveloperInfo(this.developer, this.projects);
}

class CloudFireStore {
  final collection = FirebaseFirestore.instance.collection('portfolio');

  CloudFireStore._();

  static final CloudFireStore _singleton = CloudFireStore._();

  static CloudFireStore get instance => _singleton;

  Future<Developer?> _developerInfo(String id) async {
    Developer? defaultDeveloper;
    DocumentSnapshot<Map<String, dynamic>> doc = await collection.doc(id).get(const GetOptions(source: Source.server));
    if (!doc.exists) {
      defaultDeveloper = Developer(
        id: "${DateTime.now()}",
        name: "Developer",
        info: id,
        profileImageUrl: "https://picsum.photos/200/200?id=1",
      );
      await collection.doc(id).set(defaultDeveloper.toJson());
    }

    return Developer.fromJson({"id": id, ...?(defaultDeveloper?.toJson() ?? doc.data())});
  }

  Future<DeveloperInfo?> getInfo(String developerId) async {
    Developer? developer = await _developerInfo(developerId);
    if (developer == null) return null;

    DocumentReference doc = collection.doc("Projects");

    final subCollection = doc.collection(developerId);
    final subCollectionDocs = await subCollection.get();
    List<Project> projects = [];
    if (subCollectionDocs.docs.isEmpty) {
      projects.add(
        Project(
          id: "${DateTime.now()}",
          title: "Example Project Data",
          subtitle: "Remove this or update info",
          description: "This is an example description",
          images: ["https://picsum.photos/600/300?id=1"],
          techTags: ['Python', "Flutter"],
          industries: ['Industries'],
          logoUrl: "https://picsum.photos/200/200?id=1",
          projectType: ProjectType.freelance,
          projectStartDate: DateTime.now(),
          projectLaunchDate: DateTime.now(),
        ),
      );
      subCollection.add(projects.first.toJson());
    } else {
      projects = subCollectionDocs.docs.map((doc) {
        return Project.fromJson({
          "id": doc.id,
          ...doc.data(),
        });
      }).toList();
    }

    return DeveloperInfo(developer, projects);
  }
}
