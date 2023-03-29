import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../models/todo_firebase/todo_firebase_model.dart';

import '../../theme/pallete.dart';


class TaskItemFirebase extends ConsumerStatefulWidget {
  const TaskItemFirebase({super.key, required this.firebaseModel});
  final TodoFirebaseModel firebaseModel;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TaskItemFirebaseState();
}

class _TaskItemFirebaseState extends ConsumerState<TaskItemFirebase> {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _getBg(widget.firebaseModel.color),
          border: Border.all(
              width: 1,
              color: widget.firebaseModel.color == 0
                  ? Pallete.blueFrColor
                  : Pallete.whiteColor)),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          Expanded(
            child: Checkbox(
              value: widget.firebaseModel.isComplete,
              activeColor: widget.firebaseModel.color == 0
                  ? Pallete.blackColor
                  : Pallete.whiteColor,
              shape: const CircleBorder(),
              side: BorderSide(
                width: 1,
                color: widget.firebaseModel.color == 0
                    ? Pallete.blackColor
                    : Pallete.whiteColor,
              ),
              checkColor: widget.firebaseModel.color == 0
                  ? Pallete.whiteColor
                  : Pallete.blackColor,
              onChanged: (value) async {
            
              },
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        widget.firebaseModel.title,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: widget.firebaseModel.color == 0
                                ? Pallete.blackFrColor
                                : Pallete.whiteColor,
                            fontSize: 20,
                            decorationThickness: 3,
                                          decorationStyle: TextDecorationStyle.solid,
                                          decorationColor:
                                              widget.firebaseModel.color == 0
                                                  ? Pallete.blueFrColor
                                                  : Pallete.blackColor,
                                          decoration: widget.firebaseModel.isComplete
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none),
                      ),
                    ),
                   widget.firebaseModel.isComplete ?  Expanded(
                     child: Text(
                        'Done!',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: widget.firebaseModel.color == 0
                                ? Pallete.blackFrColor
                                : Pallete.whiteColor,
                            fontSize: 20,
                            ),
                      ),
                   ): const SizedBox(),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Icon(
                            Icons.event,
                            color: widget.firebaseModel.color == 0
                                ? Pallete.blackFrColor
                                : Pallete.whiteColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            DateFormat('dd/MM/yyyy')
                                .format(widget.firebaseModel.dateEnd),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  color: widget.firebaseModel.color == 0
                                      ? Pallete.blackFrColor
                                      : Pallete.whiteColor,
                                 decorationThickness: 3,
                                    decorationStyle: TextDecorationStyle.solid,
                                    decorationColor:
                                        widget.firebaseModel.color == 0
                                            ? Pallete.blueFrColor
                                            : Pallete.blackColor,
                                    decoration: widget.firebaseModel.isComplete
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none
                                ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.schedule,
                            color: widget.firebaseModel.color == 0
                                ? Pallete.blackFrColor
                                : Pallete.whiteColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.firebaseModel.timeEnd,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  color: widget.firebaseModel.color == 0
                                      ? Pallete.blackFrColor
                                      : Pallete.whiteColor,
                                  fontSize: 12,
                                  decorationThickness: 3,
                                    decorationStyle: TextDecorationStyle.solid,
                                    decorationColor:
                                        widget.firebaseModel.color == 0
                                            ? Pallete.blueFrColor
                                            : Pallete.blackColor,
                                    decoration: widget.firebaseModel.isComplete
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none
                                ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications_active_outlined,
                            color: widget.firebaseModel.color == 0
                                ? Pallete.blackFrColor
                                : Pallete.whiteColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${widget.firebaseModel.remind} minutes',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  color: widget.firebaseModel.color == 0
                                      ? Pallete.blackFrColor
                                      : Pallete.whiteColor,
                                  decorationThickness: 3,
                                    decorationStyle: TextDecorationStyle.solid,
                                    decorationColor:
                                        widget.firebaseModel.color == 0
                                            ? Pallete.blueFrColor
                                            : Pallete.blackColor,
                                    decoration: widget.firebaseModel.isComplete
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none
                                ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.repeat,
                            color: widget.firebaseModel.color == 0
                                ? Pallete.blackFrColor
                                : Pallete.whiteColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.firebaseModel.repeat,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: widget.firebaseModel.color == 0
                                        ? Pallete.blackFrColor
                                        : Pallete.whiteColor,
                                    fontSize: 12,
                                    decorationThickness: 3,
                                    decorationStyle: TextDecorationStyle.solid,
                                    decorationColor:
                                        widget.firebaseModel.color == 0
                                            ? Pallete.blueFrColor
                                            : Pallete.blackColor,
                                    decoration: widget.firebaseModel.isComplete
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getBg(int color) {
    switch (color) {
      case 0:
        return Pallete.whiteStatus;
      case 1:
        return Pallete.greenStatus;
      case 2:
        return Pallete.redStatus;
      default:
        return Pallete.whiteStatus;
    }
  }
}
