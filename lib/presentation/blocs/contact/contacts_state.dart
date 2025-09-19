import '../../../domain/entities/contact.dart';

abstract class ContactsState {}

class ContactsInitial extends ContactsState {}

class ContactsLoading extends ContactsState {}

class ContactsLoaded extends ContactsState {
  final List<Contact> contacts;
  ContactsLoaded(this.contacts);
}

class ContactsFailure extends ContactsState {
  final String message;
  ContactsFailure(this.message);
}