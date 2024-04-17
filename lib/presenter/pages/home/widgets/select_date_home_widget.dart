import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDateWidget extends StatelessWidget {
  final ValueNotifier<DateTime?> initialDate;
  final ValueNotifier<DateTime?> finalDate;

  const SelectDateWidget({
    super.key,
    required this.initialDate,
    required this.finalDate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              FilledButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    initialDate.value = date;
                  } else {
                    initialDate.value = null;
                  }
                },
                child: const Text('Add Start Date'),
              ),
              ValueListenableBuilder(
                valueListenable: initialDate,
                builder: (context, value, child) =>
                    Text(value != null ? 'Selected Date: ${DateFormat.yMMMd().format(value)}' : 'No date chosen'),
              ),
            ],
          ),
          Column(
            children: [
              FilledButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    finalDate.value = date;
                  } else {
                    finalDate.value = null;
                  }
                },
                child: const Text('Add End Date'),
              ),
              ValueListenableBuilder(
                valueListenable: finalDate,
                builder: (_, value, __) =>
                    Text(value != null ? 'Selected Date: ${DateFormat.yMMMd().format(value)}' : 'No date chosen'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
