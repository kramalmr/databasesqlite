class ContactModel {
  int? id;
  String? name;
  String? phone;
  String? email;

  ContactModel({this.id, this.name, this.phone, this.email});

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
    );
  }
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'phone': phone, 'email': email};
  }
}
