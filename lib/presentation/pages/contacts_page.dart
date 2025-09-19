import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/contact/contacts_bloc.dart';
import '../blocs/contact/contacts_event.dart';
import '../blocs/contact/contacts_state.dart';
import '../../domain/usecases/get_contacts_usecase.dart';
import '../../data/repositories_impl/contact_repository_impl.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ContactsBloc(GetContactsUseCase(ContactRepositoryImpl()))..add(LoadContacts()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Contacts"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: BlocBuilder<ContactsBloc, ContactsState>(
          builder: (context, state) {
            if (state is ContactsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ContactsLoaded) {
              final contacts = state.contacts;
              return ListView.separated(
                itemCount: contacts.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.pinkAccent,
                      child: Text(
                        contact.name[0], // chữ cái đầu
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      contact.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(contact.phone),
                    trailing: const Icon(Icons.phone, color: Colors.green),
                  );
                },
              );
            } else if (state is ContactsFailure) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text("No contacts found"));
          },
        ),
      ),
    );
  }
}