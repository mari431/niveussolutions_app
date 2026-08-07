class UserModel {
  final String name;
  final String language;
  final String id;
  final String bio;
  final double version;

  UserModel({
    required this.name,
    required this.language,
    required this.id,
    required this.bio,
    required this.version,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      language: json['language'] ?? '',
      id: json['id'] ?? '',
      bio: json['bio'] ?? '',
      version: (json['version'] as num).toDouble(),
    );
  }
}