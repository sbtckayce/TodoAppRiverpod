import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:routemaster/routemaster.dart';

import 'package:uuid/uuid.dart';

import '../../../models/todo_firebase/todo_firebase_model.dart';

import '../../../shared/widgets/widgets.dart';
import '../../../theme/pallete.dart';
import '../controller/task_controller_firebase.dart';

class AddTaskFirebaseScreen extends ConsumerStatefulWidget {
  const AddTaskFirebaseScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddTaskFirebaseScreenState();
}

class _AddTaskFirebaseScreenState extends ConsumerState<AddTaskFirebaseScreen> {
  final _titleController = TextEditingController();

  final _dateController = TextEditingController();

  DateTime? _dateEnd;
  String? _timeEnd = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String? _timeStart = DateFormat('hh:mm a').format(DateTime.now()).toString();
  var uuid = const Uuid();

  Future<void> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await _showDatePicker(context, initialDate);
    if (newDate != null) {
      setState(() {
        _dateEnd = newDate;
        final date = DateFormat('dd/MM/yyyy').format(newDate);
        _dateController.text = date;
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

  _showTimeStartPicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeStart = MaterialLocalizations.of(context).formatTimeOfDay(value!);
      });
    });
  }

  _showTimeEndPicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeEnd = MaterialLocalizations.of(context).formatTimeOfDay(value!);
      });
    });
  }

  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];

  String _selectedRepeat = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];

  int _selectedColor = 0;
  void addTask() {
    TodoFirebaseModel firebaseModel = TodoFirebaseModel(
      id: uuid.v4(),
      title: _titleController.text,
      isComplete: false,
      timeEnd: _timeEnd.toString(),
      timeStart: _timeStart.toString(),
      color: _selectedColor,
      remind: _selectedRemind,
      repeat: _selectedRepeat,
      dateEnd: _dateEnd!,
    );
    ref
        .read(taskControllerFirebaseProvider.notifier)
        .createTaskFromFirebase(firebaseModel);

    Routemaster.of(context).push('/');
    Fluttertoast.showToast(
        msg: 'Add Task To Firebase',
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
    final isLoading = ref.watch(taskControllerFirebaseProvider);
    return Scaffold(
      backgroundColor: Pallete.whiteFrColor,
      body: isLoading
          ? const LoadingCircle()
          : SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                navigateToTask(context);
                              },
                              icon: const Icon(Icons.arrow_back_ios)),
                          Text(
                            'Add Task',
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BuildTextFormFieldFirebase(
                        title: 'Title',
                        hintText: 'Enter title here',
                        controller: _titleController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BuildTextFormFieldFirebase(
                        title: 'Date',
                        hintText: _dateController.text,
                        readOnly: true,
                        widget: GestureDetector(
                            onTap: () {
                              pickDate(context);
                            },
                            child: const Icon(Icons.calendar_today_outlined)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: BuildTextFormFieldFirebase(
                            title: 'Start Time',
                            readOnly: true,
                            hintText: _timeStart.toString(),
                            widget: GestureDetector(
                                onTap: () {
                                  _showTimeStartPicker();
                                },
                                child: const Icon(Icons.alarm)),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: BuildTextFormFieldFirebase(
                            title: 'End Time',
                            readOnly: true,
                            hintText: _timeEnd.toString(),
                            widget: GestureDetector(
                                onTap: () {
                                  _showTimeEndPicker();
                                },
                                child: const Icon(Icons.alarm)),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BuildTextFormFieldFirebase(
                        title: 'Remind',
                        readOnly: true,
                        hintText: '$_selectedRemind minutes early',
                        widget: DropdownButton(
                          onChanged: (value) {
                            setState(() {
                              _selectedRemind = int.parse(value!);
                            });
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                          ),
                          iconSize: 32,
                          elevation: 4,
                          underline: Container(
                            height: 0,
                          ),
                          items: remindList.map((remind) {
                            return DropdownMenuItem(
                                value: remind.toString(),
                                child: Text(remind.toString()));
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BuildTextFormFieldFirebase(
                        title: 'Repeat',
                        readOnly: true,
                        hintText: _selectedRepeat,
                        widget: DropdownButton(
                          onChanged: (value) {
                            setState(() {
                              _selectedRepeat = value!;
                            });
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                          ),
                          iconSize: 32,
                          elevation: 4,
                          underline: Container(
                            height: 0,
                          ),
                          items: repeatList.map((repeatList) {
                            return DropdownMenuItem(
                                value: repeatList.toString(),
                                child: Text(repeatList.toString()));
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                              children: List.generate(3, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedColor = index;
                                });
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: index == 0 ? 0 : 10),
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: index == 0
                                      ? Colors.white
                                      : index == 1
                                          ? Pallete.greenStatus
                                          : Pallete.redStatus,
                                  child: _selectedColor == index
                                      ? const Icon(
                                          Icons.done,
                                          color: Pallete.blackFrColor,
                                        )
                                      : null,
                                ),
                              ),
                            );
                          })),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 25),
                                  backgroundColor: Pallete.blueFrColor),
                              onPressed: () {
                                addTask();
                              },
                              child: Text(
                                'Add Task',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.white),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
