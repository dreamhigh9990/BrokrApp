enum TypeUser { unknown, admin, company, customer }

enum TypeRegister { unknown, email, facebook, google, apple }

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final TypeUser typeUser;
  final String email;
  final String password;
  final DateTime dateRegister;
  final DateTime dateLastActivity;
  final String? avatarUrl;
  final TypeRegister typeRegister;
  final String? phone;
  final String? fcmToken;
  final String language;
  final bool isNew;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.typeUser,
    required this.email,
    required this.password,
    required this.dateRegister,
    required this.dateLastActivity,
    this.avatarUrl,
    required this.typeRegister,
    this.phone,
    this.fcmToken,
    required this.language,
    this.isNew = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    
    return UserModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      typeUser: TypeUser.values[json['type_user'] ?? 0],
      email: json['email'],
      password: json['password'] ?? '',
      dateRegister: json['date_register'] != null
          ? DateTime.parse(json['date_register'])
          : DateTime.now(),
      dateLastActivity: json['date_last_activity'] != null
          ? DateTime.parse(json['date_last_activity'])
          : DateTime.now(),
      avatarUrl: json['avatar_url'], // defineAvatarUrl(json['avatar_url']),
      typeRegister: TypeRegister.values[json['type_register'] ?? 0],
      phone: json['phone'],
      fcmToken: json['fcm_token'],
      language: json['language'],
      isNew: json['is_new'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'type_user': typeUser.index,
        'email': email,
        'password': password,
        'date_register': dateRegister.toIso8601String(),
        'date_last_activity': dateLastActivity.toIso8601String(),
        'avatar_url': avatarUrl,
        'type_register': typeRegister.index,
        'phone': phone,
        'fcm_token': fcmToken,
        'language': language,
        'is_new': isNew,
      };
}
