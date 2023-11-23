class RegistrationModel {
  final int id;
  final String token;

  RegistrationModel({required this.id, required this.token});

  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(
      id: json['id'],
      token: json['token'],
    );
  }
}
