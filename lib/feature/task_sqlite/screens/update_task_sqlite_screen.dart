import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:routemaster/routemaster.dart';

import '../../../models/todo_sqlite/todo_sqlite_model.dart';
import '../../../provider/connective_provider.dart';
import '../../../shared/widgets/widgets.dart';
import '../../../theme/pallete.dart';
import '../controller/task_controller_sqlite.dart';

class UpdateTaskSqliteScreen extends ConsumerStatefulWidget {
  const UpdateTaskSqliteScreen({super.key, required this.id});
  final String id;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdateTaskFirebaseScreenState();
}

class _UpdateTaskFirebaseScreenState
    extends ConsumerState<UpdateTaskSqliteScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();

  DateTime? _dateEnd;

  Future<void> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await _showDatePicker(context, initialDate);
    if (newDate != null) {
      setState(() {
        _dateEnd = newDate;
        final date = DateFormat('dd/MM/yyyy').format(newDate);
        dateController.text = date;
      });
    }
  }

  Future<DateTime?> _showDatePicker(
      BuildContext context, DateTime initialDate) {
    return showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 1),
    );
  }

  void navigateToTask(BuildContext context) {
    Routemaster.of(context).push('/');
  }

  late TodoSqliteModel sqliteModel;

  getTodoByIdFromSqlite() {
    final list = ref
        .read(taskControllerSqliteProvider)
        .getTaskFromSqlite(int.parse(widget.id));

    setState(() {
      list.then((value) {
        sqliteModel = value.first;

        titleController.text = sqliteModel.title;
        descriptionController.text = sqliteModel.description;
        dateController.text =
            DateFormat('dd/MM/yyyy').format(sqliteModel.dateEnd);
      });
    });
  }

  deleteTask(String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Confirmation"),
          content: const Text("Are you sure you want to delete this item?"),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  ref
                      .read(taskControllerSqliteProvider)
                      .deleteTaskFromSqlite(int.parse(id));

                  Navigator.of(context).pop(true);
                  Fluttertoast.showToast(
                      msg: 'Delele Task To Sqlite',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Pallete.greenColor,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  Routemaster.of(context).push('/');
                },
                child: const Text("Delete")),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  updateTask({
    required TodoSqliteModel sqliteModel,
  }) {
    ref.read(taskControllerSqliteProvider).updateTaskFromSqlite(sqliteModel);
    Routemaster.of(context).push('/');
    Fluttertoast.showToast(
        msg: 'Update Task To Sqlite',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Pallete.greenColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void initState() {
    super.initState();
    getTodoByIdFromSqlite();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    ref.invalidate(getTasksControllerSqliteProvider);
   
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.whiteColor,
        title: Text(
          widget.id,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Pallete.blueColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () => navigateToTask(context),
                icon: const Icon(
                  Icons.close,
                  color: Pallete.blueColor,
                )),
          )
        ],
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: const BoxDecoration(color: Pallete.whiteColor),
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset(
              'assets/images/logo.png',
              scale: 2,
            ),
            BuildTextFormField(
              text: 'Title',
              hintText: 'Enter task title',
              controller: titleController,
            ),
            const SizedBox(
              height: 20,
            ),
            BuildTextFormField(
              text: 'Description',
              hintText: 'Enter task description',
              controller: descriptionController,
            ),
            const SizedBox(
              height: 20,
            ),
            BuildDateTimeField(
              text: 'Date',
              controller: dateController,
              suffixIcon: const Icon(
                Icons.today,
                color: Pallete.blackColor,
              ),
              ontap: () {
                return pickDate(context);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: 'Update',
                  bgButton: Pallete.blueColor,
                  onPressed: () {
                    TodoSqliteModel sqliteModel = TodoSqliteModel(
                      id: int.parse(widget.id),
                      title: titleController.text,
                      description: descriptionController.text,
                      dateEnd: _dateEnd!,
                    );

                    updateTask(sqliteModel: sqliteModel);
                  },
                ),
                CustomButton(
                  text: 'Delete',
                  bgButton: Pallete.pinkColor,
                  onPressed: () {
                    deleteTask(widget.id);
                  },
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
