class IUser {
  int id;
  String name;
  String email;

  IUser({
    required this.name,
    required this.email,
    required this.id,
  });

  factory IUser.from(Map<String, dynamic> item) {
    return IUser(
      id: item['id'],
      name: item['name'],
      email: item['email'],
    );
  }
}
