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

  Future<Developer> _developerInfo(String id) async {
    Developer? defaultDeveloper;
    DocumentSnapshot<Map<String, dynamic>> doc = await collection.doc(id).get(const GetOptions(source: Source.server));
    if (!doc.exists) {
      defaultDeveloper = await Developer.loadFromJson(id);
      await collection.doc(id).set(defaultDeveloper.toJson());
    }

    return Developer.fromJson(defaultDeveloper?.toJson() ?? {"id": id, ...?doc.data()});
  }

  Future<DeveloperInfo> getInfo(String developerId) async {
    Developer developer = await _developerInfo(developerId);

    DocumentReference doc = collection.doc("Projects");

    final subCollection = doc.collection(developerId);
    final subCollectionDocs = await subCollection.get();
    List<Project> projects;
    if (subCollectionDocs.docs.isEmpty) {
      projects = await Project.loadFromJson(developerId);
      for (var p in projects) {
        subCollection.add(p.toJson());
      }
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
