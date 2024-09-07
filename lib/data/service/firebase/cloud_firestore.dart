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

  Future<QueryDocumentSnapshot<Map<String, dynamic>>?> _projectCollection() async {
    final projectRef = await collection.get();
    return projectRef.docs.where((d) => d.id == 'Projects').firstOrNull;
  }

  Future<Developer?> _developerInfo(String id) async {
    final projectRef = await collection.get();
    Map<String, dynamic>? doc = projectRef.docs.where((d) => d.id == id).firstOrNull?.data();
    if (doc == null) return null;
    return Developer.fromJson({"id": id, ...doc});
  }

  Future<DeveloperInfo?> getInfo(String developerId) async {
    Developer? developer = await _developerInfo(developerId);
    if (developer == null) return null;

    final doc = await _projectCollection();
    if (doc == null) return null;

    final subCollection = doc.reference.collection(developerId);
    final subCollectionDocs = await subCollection.get();

    List<Project> projects = subCollectionDocs.docs.map((doc) {
      return Project.fromJson({
        "id": doc.id,
        ...doc.data(),
      });
    }).toList();

    return DeveloperInfo(developer, projects);
  }
}
