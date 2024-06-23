import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:hinder/models/user.dart';
import 'package:hinder/models/message.dart';

const String USER_COLLECTION_REF = "users";
const String MESSAGES_COLLECTION_REF = "messages";

class DatabaseService {
  // Add your database-related methods here
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late final CollectionReference _usersRef;
  late final CollectionReference _messagesRef;

  DatabaseService() {
    _usersRef = _db.collection(USER_COLLECTION_REF).withConverter<User>(
        fromFirestore: (snapshots, _) => User.fromJson(snapshots.data()!),
        toFirestore: (user, _) => user.toJson());
    _messagesRef = _db
        .collection(MESSAGES_COLLECTION_REF)
        .withConverter<Message>(
            fromFirestore: (snapshots, _) =>
                Message.fromJson(snapshots.data()!),
            toFirestore: (message, _) => message.toJson());
  }
  Stream<QuerySnapshot> getUsers() {
    return _usersRef.snapshots();
  }

  void addUser(User user) async {
    _usersRef.add(user);
  }

  Stream<QuerySnapshot> getMessages() {
    return _messagesRef.snapshots();
  }

  void addMessage(Message message) async {
    _messagesRef.add(message);
  }
}
