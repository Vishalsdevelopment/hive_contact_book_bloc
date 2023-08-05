abstract class ContactEvent {}

class ContactAddEvent extends ContactEvent {
  Map contact;

  ContactAddEvent({required this.contact});
}

class ContactSearchEvent extends ContactEvent {
  String value;

  ContactSearchEvent({required this.value});
}

class ContactUpdateEvent extends ContactEvent {
  Map contact;
  int key;

  ContactUpdateEvent({required this.contact, required this.key});
}

class ContactDeleteEvent extends ContactEvent {
  int key;

  ContactDeleteEvent({required this.key});
}
