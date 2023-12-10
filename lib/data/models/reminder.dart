import 'package:isar/isar.dart';

part 'reminder.g.dart';

@Collection()
@Name('reminders')
class Reminder {
  Id id = Isar.autoIncrement;
  late String reminderName;
  late DateTime reminderTime;
}
