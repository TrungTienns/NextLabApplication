import 'package:flutter_bloc/flutter_bloc.dart';
import 'contacts_event.dart';
import 'contacts_state.dart';
import '../../../domain/usecases/get_contacts_usecase.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final GetContactsUseCase getContactsUseCase;

  ContactsBloc(this.getContactsUseCase) : super(ContactsInitial()) {
    on<LoadContacts>((event, emit) async {
      emit(ContactsLoading());
      try {
        final contacts = await getContactsUseCase.execute();
        emit(ContactsLoaded(contacts));
      } catch (e) {
        emit(ContactsFailure("Failed to load contacts"));
      }
    });
  }
}