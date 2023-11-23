// User class represents the user entity in your domain
class UserEntity {
  final int? id;
  final String? token;

  UserEntity({this.id, this.token});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          token == other.token;

  @override
  int get hashCode => id.hashCode ^ token.hashCode;

  @override
  String toString() {
    return 'User{id: $id, token: $token}';
  }
}
