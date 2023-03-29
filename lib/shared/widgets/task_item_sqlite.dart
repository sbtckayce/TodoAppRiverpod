import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';




import '../../models/todo_sqlite/todo_sqlite_model.dart';

import '../../theme/pallete.dart';
import '../constants/popup_menu_value.dart';

class TaskItemSqlite extends ConsumerStatefulWidget {
  const TaskItemSqlite(
      {super.key,
    
    required  this.sqliteModel});

  final TodoSqliteModel sqliteModel;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskItemState();
}

class _TaskItemState extends ConsumerState<TaskItemSqlite>
   {
  bool isCheck = false;
  void pressCheckbox() {
    setState(() {
      isCheck = !isCheck;
    });
  }

  late Color colorS = Pallete.greyColor.withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5), color: colorS),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          Expanded(
            child: Checkbox(
              value: isCheck,
              onChanged: (value) async {
                pressCheckbox();
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
            
                  DateFormat('dd/MM/yyyy')
                      .format(widget.sqliteModel.dateEnd),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  decoration: isCheck
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                       widget.sqliteModel.title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          decoration: isCheck
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    const Spacer(),
                    Text(
                      
                           widget.sqliteModel.description,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          decoration: isCheck
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                  ],
                ),
                isCheck ? const Text('Done!') : const SizedBox()
              ],
            ),
          ),
          Expanded(
              child: PopupMenuButton(
            child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  '...',
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
            onSelected: (value) {
              switch (value) {
                case PopupMenuValue.changeGreen:
                  setState(() {
                    colorS = Pallete.changeGreenColor;
                  });
                  break;
                case PopupMenuValue.changeAmber:
                  setState(() {
                    colorS = Pallete.changeAmberColor;
                  });
                  break;
                case PopupMenuValue.changePink:
                  setState(() {
                    colorS = Pallete.changePinkColor;
                  });
                  break;
                case PopupMenuValue.changePurple:
                  setState(() {
                    colorS = Pallete.changePurpleColor;
                  });
                  break;
                case PopupMenuValue.changeBlue:
                  setState(() {
                    colorS = Pallete.changeBlueColor;
                  });
                  break;
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: PopupMenuValue.changeGreen,
                  child: Container(
                    width: double.infinity,
                    height: 20,
                    decoration:
                        const BoxDecoration(color: Pallete.changeGreenColor),
                  ),
                ),
                PopupMenuItem(
                  value: PopupMenuValue.changeAmber,
                  child: Container(
                    width: double.infinity,
                    height: 20,
                    decoration:
                        const BoxDecoration(color: Pallete.changeAmberColor),
                  ),
                ),
                PopupMenuItem(
                  value: PopupMenuValue.changePink,
                  child: Container(
                    width: double.infinity,
                    height: 20,
                    decoration:
                        const BoxDecoration(color: Pallete.changePinkColor),
                  ),
                ),
                PopupMenuItem(
                  value: PopupMenuValue.changePurple,
                  child: Container(
                    width: double.infinity,
                    height: 20,
                    decoration:
                        const BoxDecoration(color: Pallete.changePurpleColor),
                  ),
                ),
                PopupMenuItem(
                  value: PopupMenuValue.changeBlue,
                  child: Container(
                    width: double.infinity,
                    height: 20,
                    decoration:
                        const BoxDecoration(color: Pallete.changeBlueColor),
                  ),
                ),
              ];
            },
          ))
        ],
      ),
    );
  }
}
