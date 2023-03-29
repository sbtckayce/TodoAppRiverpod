import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../models/todo_firebase/todo_firebase_model.dart';
import '../../../provider/firebase_provider.dart';
import '../../../shared/constants/firebase_collections.dart';
import '../../../shared/failue.dart';
import '../../../shared/type_defs.dart';

final taskRepositoryFirebaseProvider = Provider((ref) => TaskRepositoryFirebase(
    firebaseFirestore: ref.watch(firebaseFirestoreProvider)));

class TaskRepositoryFirebase {
  final FirebaseFirestore _firebaseFirestore;
  TaskRepositoryFirebase({required FirebaseFirestore firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore;

  CollectionReference get _tasks =>
      _firebaseFirestore.collection(FirebaseCollection.tasksCollection);

  FutureVoid createTaskFromFirebase(TodoFirebaseModel firebaseModel) async {
    try {
      var itemDoc = await _tasks.doc(firebaseModel.id).get();
      if (itemDoc.exists) {
        throw 'Exists';
      }

      return right(_tasks.doc(firebaseModel.id).set(firebaseModel.toJson()));
    } catch (e) {
      return left(Failue(message: e.toString()));
    }
  }

  Stream<List<TodoFirebaseModel>> getTasksFromFirebase() {
    return _tasks.snapshots().map((event) {
      List<TodoFirebaseModel> list = [];

      for (var doc in event.docs) {
        list.add(
            TodoFirebaseModel.fromJson(doc.data() as Map<String, dynamic>));
      }

      return list;
    });
  }
 Stream<int> getLenghtTasksFromFirebase() {
    return _tasks.snapshots().map((event) {
      List<TodoFirebaseModel> list = [];

      for (var doc in event.docs) {
        list.add(
            TodoFirebaseModel.fromJson(doc.data() as Map<String, dynamic>));
      }

      return list.length;
    });
  }
  Stream<TodoFirebaseModel> getTaskFromFirebase(String id) {
    return _tasks.doc(id).snapshots().map((event) =>
        TodoFirebaseModel.fromJson(event.data() as Map<String, dynamic>));
  }

  FutureVoid updateTaskFromFirebase(TodoFirebaseModel firebaseModel) async {
    try {
      return right(_tasks.doc(firebaseModel.id).update(firebaseModel.toJson()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failue(message: e.toString()));
    }
  }

  FutureVoid deleteTaskFromFirebase(String id) async {
    try {
      return right(await _tasks.doc(id).delete());
    } catch (e) {
      return left(Failue(message: e.toString()));
    }
  }
  
}
