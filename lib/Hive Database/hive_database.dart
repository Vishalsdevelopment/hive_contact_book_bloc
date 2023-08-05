import 'package:hive/hive.dart';

class HiveDatabase {
  static Box contacts = Hive.box('Hive_Example');

  static viewContacts() {
    List contactsList = [];
    contactsList = contacts.keys.map((key) {
      var item = contacts.get(key);
      return {'key': key, 'name': item['name'], 'contact': item['contact']};
    }).toList();
    contactsList.sort((a, b) {
      return a['name'].compareTo(b['name']);
    });
    return contactsList;
  }
}
