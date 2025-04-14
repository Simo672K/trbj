class ClientModel {
  final String name;
  final String phoneNumber;
  final String email;
  final String createdAt;

  const ClientModel(this.name, this.phoneNumber, this.email, this.createdAt);

  @override
  String toString() {
    return 'ClientModel(name: $name, phoneNumber: $phoneNumber, email: $email, createdAt: $createdAt)';
  }
}
