import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:hinder/models/user.dart';

const String USER_COLLECTION_REF = "users";

class DatabaseService {
  // Add your database-related methods here
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late final CollectionReference _usersRef;

  DatabaseService() {
    _usersRef = _db.collection(USER_COLLECTION_REF).withConverter<User>(
        fromFirestore: (snapshots, _) => User.fromJson(snapshots.data()!),
        toFirestore: (user, _) => user.toJson());
  }
  Stream<QuerySnapshot> getUsers() {
    return _usersRef.snapshots();
  }

  void addUser(User user) async {
    _usersRef.add(user);
  }
}
