import 'package:isar/isar.dart';
import 'package:krish_news_app/domain/entities/enums.dart';

part 'contact.g.dart';

@collection
@Name('contacts')
class Contact {
  Id id = Isar.autoIncrement;
  @Name('name')
  late String firstName;
  late String lastName;
  late int age;
  @enumerated
  late ContactType contactType;

  late Address address;
}

@embedded
class Address {
  String? street;
  String? postcode;
}
