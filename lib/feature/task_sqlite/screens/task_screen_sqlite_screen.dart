import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:routemaster/routemaster.dart';

import '../../../shared/widgets/widgets.dart';
import '../../../theme/pallete.dart';
import 'dart:math' as math;

import '../../../models/todo_sqlite/todo_sqlite_model.dart';
import '../controller/task_controller_sqlite.dart';

class TaskSqliteScreen extends ConsumerStatefulWidget {
  const TaskSqliteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TaskSqliteScreenState();
}

class _TaskSqliteScreenState extends ConsumerState<TaskSqliteScreen>
    with TickerProviderStateMixin {
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

  deleleTask(int id) {
    ref.read(taskControllerSqliteProvider).deleteTaskFromSqlite(id);
  }

  navigateToAddTaskSqlite(BuildContext context) {
    Routemaster.of(context).push('/add-task-sqlite');
  }

  navigateToUpdateTask(BuildContext context, String id) {
    Routemaster.of(context).push('/update-task-sqlite/$id');
  }

  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 10), vsync: this)
        ..repeat();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    ref.invalidate(getTasksControllerSqliteProvider);
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.sort),
        actions: const [SwitchButtonTheme()],
        title: _centerTitle(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              const TextSwipe(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ref.watch(getTasksControllerSqliteProvider).when(
                        data: (data) {
                          return Text(
                            '${data.length} Todo',
                            style: Theme.of(context).textTheme.bodyLarge,
                          );
                        },
                        error: (error, stackTrace) =>
                            ErrorText(errorText: error),
                        loading: () => const LoadingCircle(),
                      ),
                  TextButton(
                    onPressed: () {
                      deleteAllTask();
                    },
                    child: Text(
                      'Delete all',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  )
                ],
              ),
              const Divider(
                thickness: 3,
              ),
              ref.watch(getTasksControllerSqliteProvider).when(
                    data: (data) {
                      return _taskList(
                        listSqliteModel: data,
                      );
                    },
                    error: (error, stackTrace) => ErrorText(errorText: error),
                    loading: () => const LoadingCircle(),
                  ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          '+ Add Task To Sqlite',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        onPressed: () => navigateToAddTaskSqlite(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  AnimatedBuilder _centerTitle() {
    return AnimatedBuilder(
      animation: _animationController,
      child: Image.asset(
        'assets/images/logo.png',
        scale: 4,
      ),
      builder: (context, child) {
        return Transform.rotate(
          angle: _animationController.value * 2.0 * math.pi,
          child: child,
        );
      },
    );
  }

  Expanded _taskList({List<TodoSqliteModel>? listSqliteModel}) {
    return Expanded(
        child: ListView.builder(
      itemCount: listSqliteModel!.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          background: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Pallete.greyColor),
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
            deleleTask(listSqliteModel[index].id!);
          },
          child: InkWell(
            onTap: () {
              navigateToUpdateTask(
                  context, listSqliteModel[index].id.toString());
            },
            child: TaskItemSqlite(
              sqliteModel: listSqliteModel[index],
            ),
          ),
        );
      },
    ));
  }
}
