class ModelClass {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  ModelClass({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory ModelClass.fromJson(Map<String, dynamic> json) {
    return ModelClass(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}