
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/todo_firebase/todo_firebase_model.dart';
import '../repository/task_repository_firebase.dart';



final taskControllerFirebaseProvider = StateNotifierProvider<TaskControllerFirebase,bool>((ref) => TaskControllerFirebase(
    taskRepositoryFirebase: ref.watch(taskRepositoryFirebaseProvider),
   ));
final getTasksControllerFirebaseProvider = StreamProvider((ref) {
  final taskControllerFProvider = ref.watch(taskControllerFirebaseProvider.notifier);
  return taskControllerFProvider.getTasksFromFirebase();
});
final getTaskControllerFirebaseProvider = StreamProvider.family((ref,String title) {
   final taskControllerFProvider = ref.watch(taskControllerFirebaseProvider.notifier);
  return taskControllerFProvider.getTaskFromFirebase(title);
});
final getLengthTasksControllerFirebaseProvider = StreamProvider((ref) {
   final taskControllerFProvider = ref.watch(taskControllerFirebaseProvider.notifier);
  return taskControllerFProvider.getLenghtTasksFromFirebase();
});

class TaskControllerFirebase extends StateNotifier<bool> {
  final TaskRepositoryFirebase _taskRepositoryFirebase;
 

  TaskControllerFirebase(
      {required TaskRepositoryFirebase taskRepositoryFirebase,
      })
      : _taskRepositoryFirebase = taskRepositoryFirebase , super(false)
        ;

  Future<void> createTaskFromFirebase(TodoFirebaseModel firebaseModel) async {
    await _taskRepositoryFirebase.createTaskFromFirebase(firebaseModel);
  }

  Stream<List<TodoFirebaseModel>> getTasksFromFirebase() {
    return _taskRepositoryFirebase.getTasksFromFirebase();
  }
  Stream<int> getLenghtTasksFromFirebase() {
    return _taskRepositoryFirebase.getLenghtTasksFromFirebase();
  }
  Stream<TodoFirebaseModel> getTaskFromFirebase(String title){
    return _taskRepositoryFirebase.getTaskFromFirebase(title);
  }
  Future<void> updateTaskFromFirebase(TodoFirebaseModel firebaseModel){
    return _taskRepositoryFirebase.updateTaskFromFirebase(firebaseModel);
  }
  Future<void>deleteTaskFromFirebase(String id){
    return _taskRepositoryFirebase.deleteTaskFromFirebase(id);
  }
}
