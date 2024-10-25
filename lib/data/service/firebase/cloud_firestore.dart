import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_eriel/data/service/firebase/storage.dart';
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
          ...doc.data(),
          "id": doc.id,
        });
      }).toList();
    }
    projects.sort((a,b)=> a.priority.compareTo(b.priority));
    return DeveloperInfo(developer, projects);
  }

  Future<bool> deleteProject({required String developerId, required String projectId}) async {
    try {
      DocumentReference projectDoc = collection.doc("Projects").collection(developerId).doc(projectId);

      DocumentSnapshot projectSnapshot = await projectDoc.get();
      if (!projectSnapshot.exists) {
        return false;
      }
      Project project = Project.fromJson(projectSnapshot.data() as Map<String, dynamic>);

      await projectDoc.delete();

      if (project.logoUrl != null && project.logoUrl!.isNotEmpty) {
        await FireStoreService.deleteFile(project.logoUrl!);
      }

      if (project.projectOwnerLogoUrl != null && project.projectOwnerLogoUrl!.isNotEmpty) {
        await FireStoreService.deleteFile(project.projectOwnerLogoUrl!);
      }

      for (var imageUrl in project.images) {
        await FireStoreService.deleteFile(imageUrl);
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Project?> updateProject(String developerId, String projectId, Map<String, dynamic> updatedData) async {
    try {
      DocumentReference projectDoc = collection.doc("Projects").collection(developerId).doc(projectId);
      DocumentSnapshot projectSnapshot = await projectDoc.get();
      if (!projectSnapshot.exists) return null;
      Project p = Project.fromJson(projectSnapshot.data() as Map<String, dynamic>);
      await projectDoc.update(updatedData);
      if (p.logoUrl != updatedData['logoUrl']) {
        FireStoreService.deleteFile(p.logoUrl ?? "");
      }
      if (p.projectOwnerLogoUrl != updatedData['projectOwnerLogoUrl']) {
        FireStoreService.deleteFile(p.projectOwnerLogoUrl ?? "");
      }
      for (var url in p.images.where((image) => !(updatedData['images'] as List<String>).contains(image)).toList()) {
        FireStoreService.deleteFile(url);
      }
      projectSnapshot = await projectDoc.get();
      return Project.fromJson(projectSnapshot.data() as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  Future<Project?> createProject(String developerId, Project project) async {
    try {
      DocumentReference developerDoc = collection.doc("Projects");
      CollectionReference projectsSubCollection = developerDoc.collection(developerId);
      DocumentReference newProjectDoc = await projectsSubCollection.add(project.toJson());
      DocumentSnapshot newProjectSnapshot = await newProjectDoc.get();
      return Project.fromJson(newProjectSnapshot.data() as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }
}
