import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
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

class AddTaskSqliteScreen extends ConsumerStatefulWidget {
  const AddTaskSqliteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddTaskSqliteScreenState();
}

class _AddTaskSqliteScreenState extends ConsumerState<AddTaskSqliteScreen> {
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

  void addTask() {
    TodoSqliteModel sqliteModel = TodoSqliteModel(
      title: titleController.text,
      description: descriptionController.text,
      dateEnd: _dateEnd!,
    );

    ref.read(taskControllerSqliteProvider).createTaskFromSqlite(sqliteModel);

    Routemaster.of(context).push('/');
    Fluttertoast.showToast(
        msg: 'Add Task To Sqlite',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Pallete.greenColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void navigateToTask(BuildContext context) {
    Routemaster.of(context).push('/');
  }

  @override
  void initState() {
    super.initState();
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
          'ADD TASK TO SQLITE',
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
                  text: 'Add',
                  bgButton: Pallete.blueColor,
                  onPressed: () {
                    addTask();
                  },
                ),
                CustomButton(
                  text: 'Cancel',
                  bgButton: Pallete.pinkColor,
                  onPressed: () {
                    navigateToTask(context);
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
