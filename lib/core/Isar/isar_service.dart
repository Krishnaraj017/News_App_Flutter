import 'package:isar/isar.dart';
import 'package:krish_news_app/data/models/contact.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;
  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open([ContactSchema], directory: dir.path, inspector: true);

      return isar;
    }
    return Future.value(Isar.getInstance());
  }
}
