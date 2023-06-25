
class UserModel {
  final String name;
  final String email;
  final String token;
  final String imageUrl;

  UserModel({
    required this.name,
    required this.email,
    required this.token,
    this.imageUrl = 'https://static.thenounproject.com/png/4188723-200.png',
  });
}
