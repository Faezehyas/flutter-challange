class UserEntity {
  final int id;
  final String username;
  final String password; // Added password field

  const UserEntity(
      {required this.id, required this.username, required this.password});
}
