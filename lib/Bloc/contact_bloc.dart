import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_dbms/Bloc/contact_event.dart';
import 'package:hive_dbms/Bloc/contact_state.dart';
import 'package:hive_dbms/Hive%20Database/hive_database.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitialState()) {
    on((event, emit) => null);

    on<ContactAddEvent>((event, emit) async {
      await HiveDatabase.contacts.add(event.contact).then((value) =>
          emit(ContactViewState(contacts: HiveDatabase.viewContacts())));
    });
    List<Map> contacts = [];
    on<ContactSearchEvent>((event, emit) {
      List<Map> contactsList = HiveDatabase.viewContacts();
      if (event.value.isNotEmpty) {
        contacts.clear();
        for (var i in contactsList) {
          if (i['name'].contains(event.value) ||
              i['contact'].contains(event.value)) {
            contacts.add(i);
          }
        }
        emit(ContactViewState(contacts: contacts));
      } else {
        emit(ContactViewState(contacts: HiveDatabase.viewContacts()));
      }
    });

    on<ContactUpdateEvent>((event, emit) async {
      await HiveDatabase.contacts.put(event.key, event.contact).then((value) =>
          emit(ContactViewState(contacts: HiveDatabase.viewContacts())));
    });

    on<ContactDeleteEvent>((event, emit) async {
      await HiveDatabase.contacts.delete(event.key).then((value) =>
          emit(ContactViewState(contacts: HiveDatabase.viewContacts())));
    });
  }
}
