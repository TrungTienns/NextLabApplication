import '../../domain/entities/contact.dart';
import '../../domain/repositories/contact_repository.dart';
import '../datasources/mock_data_source.dart';

class ContactRepositoryImpl implements ContactRepository {
  @override
  Future<List<Contact>> getContacts() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return MockDataSource.contacts
        .map((c) => Contact(name: c.name, phone: c.phone))
        .toList();
  }
}