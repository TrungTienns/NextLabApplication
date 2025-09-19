import '../../domain/entities/contact.dart';

class ContactModel {
  final String name;
  final String phone;

  ContactModel({required this.name, required this.phone});

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
    };
  }

  Contact toEntity() {
    return Contact(name: name, phone: phone);
  }

  factory ContactModel.fromEntity(Contact contact) {
    return ContactModel(
      name: contact.name,
      phone: contact.phone,
    );
  }
}