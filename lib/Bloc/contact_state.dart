import '../Hive Database/hive_database.dart';

abstract class ContactState {}

class ContactInitialState extends ContactState {
  List<Map> contacts = HiveDatabase.viewContacts();
}

class ContactViewState extends ContactState {
  List<Map> contacts = [];

  ContactViewState({required this.contacts});
}
