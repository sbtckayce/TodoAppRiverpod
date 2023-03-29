import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:routemaster/routemaster.dart';
import 'package:todo_riverpod/feature/auth/controller/auth_controller.dart';
import 'package:todo_riverpod/shared/constants/image_link.dart';
import 'package:todo_riverpod/shared/widgets/widgets.dart';
import '../../../models/todo_firebase/todo_firebase_model.dart';

import '../../../shared/widgets/task_item_firebase.dart';

import '../../../theme/pallete.dart';
import '../controller/task_controller_firebase.dart';
import 'dart:math' as math;

import '../../task_sqlite/controller/task_controller_sqlite.dart';

class TaskFirebaseScreen extends ConsumerStatefulWidget {
  const TaskFirebaseScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TaskScreenFirebaseState();
}

class _TaskScreenFirebaseState extends ConsumerState<TaskFirebaseScreen> {
  toggleTheme(WidgetRef ref) {
    ref.read(themeProvider.notifier).toggleTheme();
  }

  deleteAllTask() {
    ref.read(taskControllerSqliteProvider).deleteAllTaskFromSqlite();
    ref.invalidate(getTasksControllerSqliteProvider);
    Fluttertoast.showToast(
        msg: 'Delele All Task',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Pallete.greenColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  deleteTask(String id) {
    ref
        .read(taskControllerFirebaseProvider.notifier)
        .deleteTaskFromFirebase(id);
  }

  navigateToLoginFirebase(BuildContext context) {
    Routemaster.of(context).push('/');
  }

  navigateToAddTaskFirbase(BuildContext context) {
    Routemaster.of(context).push('/add-task-firebase');
  }

  navigateToUpdateTask(BuildContext context, String id) {
    Routemaster.of(context).push('/update-task-firebase/$id');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider)!;

    return Scaffold(
      backgroundColor: Pallete.whiteFrColor,
      appBar: AppBar(
        backgroundColor: Pallete.whiteFrColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            backgroundImage: NetworkImage(user.isAuthenticted
                ? user.profilePic
                : ImageLink.avatarDefault),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  ref.read(authControllerProvider.notifier).logout();
                  navigateToLoginFirebase(context);
                },
                icon: const Icon(
                  Icons.logout_outlined,
                  color: Pallete.blackFrColor,
                )),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: Pallete.blueFrColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You can use',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 16, color: Pallete.whiteFrColor),
                        ),
                        const Icon(
                          Icons.swipe_left,
                          color: Pallete.blackFrColor,
                        ),
                        Text(
                          'to delete item',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 16, color: Pallete.whiteFrColor),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/bin.png',
                      color: Pallete.whiteFrColor,
                      width: 50,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ref.watch(getLengthTasksControllerFirebaseProvider).when(
                      data: (data) => Text(
                            '$data Todo',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                      error: (error, stackTrace) => ErrorText(errorText: error),
                      loading: () => const LoadingCircle()),
                ],
              ),
              const Divider(
                thickness: 3,
              ),
              ref.watch(getTasksControllerFirebaseProvider).when(
                    data: (data) {
                      return _taskList(listFirebaseModel: data);
                    },
                    error: (error, stackTrace) => ErrorText(errorText: error),
                    loading: () => const LoadingCircle(),
                  ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Pallete.blueFrColor,
        label: Text(
          '+ Add Task To Firebase',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Pallete.whiteColor),
        ),
        onPressed: () => navigateToAddTaskFirbase(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Expanded _taskList({
    required List<TodoFirebaseModel> listFirebaseModel,
  }) {
    return Expanded(
        child: ListView.builder(
      itemCount: listFirebaseModel.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          background: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Pallete.blueFrColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.delete,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text('Delete Task',
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
          confirmDismiss: (DismissDirection direction) async {
            return await showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialogDeleteItem();
              },
            );
          },
          onDismissed: (DismissDirection direction) {
            deleteTask(listFirebaseModel[index].id!);
          },
          child: InkWell(
            onTap: () =>
                navigateToUpdateTask(context, listFirebaseModel[index].id!),
            child: TaskItemFirebase(
              firebaseModel: listFirebaseModel[index],
            ),
          ),
        );
      },
    ));
  }
}
