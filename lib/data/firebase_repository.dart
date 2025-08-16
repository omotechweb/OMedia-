import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

class FirebaseRepository {
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> createUser(User user) async {
    await usersCollection.doc(user.id).set({
      'name': user.name,
      'age': user.age,
      'email': user.email,
    });
  }

  Future<User> getUser(String uid) async {
    final doc = await usersCollection.doc(uid).get();
    final data = doc.data() as Map<String, dynamic>;
    return User(
      id: uid,
      name: data['name'],
      age: data['age'],
      email: data['email'],
    );
  }
}
