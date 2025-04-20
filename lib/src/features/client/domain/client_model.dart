class ClientModel {
  final int? id;
  final String name;
  final String phoneNumber;
  final String email;
  final String createdAt;

  const ClientModel(
    this.name,
    this.phoneNumber,
    this.email,
    this.createdAt, {
    this.id,
  });

  @override
  String toString() {
    return 'ClientModel(name: $name, phoneNumber: $phoneNumber, email: $email, createdAt: $createdAt)';
  }

  ClientModel shallowCopyWithId(int id) {
    final now = DateTime.now();
    return ClientModel(
      name,
      phoneNumber,
      email,
      createdAt == ''
          ? '${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year}'
          : createdAt,
      id: id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone_number': phoneNumber,
      'email': email,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      map['name'],
      map['phone_number'],
      map['email'],
      map['created_at'],
      id: map['id'],
    );
  }
}
