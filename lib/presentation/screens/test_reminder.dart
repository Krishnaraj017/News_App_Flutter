import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:krish_news_app/data/models/reminder.dart';

class TestReminderScreen extends StatefulWidget {
  const TestReminderScreen({Key? key}) : super(key: key);

  @override
  State<TestReminderScreen> createState() => _TestReminderScreenState();
}

class _TestReminderScreenState extends State<TestReminderScreen> {
  final TextEditingController nameController = TextEditingController();
  DateTime? selectedDateTime;
    // final Isar isar = await openIsar();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Reminder Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a reminder name';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              DatePicker.showDateTimePicker(
                context,
                showTitleActions: true,
                onChanged: (date) {
                  // Handle date/time change
                },
                onConfirm: (date) {
                  // Handle confirmed date/time
                  setState(() {
                    selectedDateTime = date;
                  });
                  print('Date/Time selected: $date');
                },
                currentTime: DateTime.now(),
              );
            },
            child: Text('Select Date/Time'),
          ),
          ElevatedButton(
            onPressed: () {
              if (selectedDateTime != null) {
                // Form is valid, handle submission
                final newReminder = Reminder()
                  ..reminderName = nameController.text
                  ..reminderTime = selectedDateTime!;

                isar.writeTxn((isar) async {
                  isar.write(newReminder);
                });

                // Schedule notification
               // scheduleNotification(newReminder);
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
