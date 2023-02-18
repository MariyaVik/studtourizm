import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? name;
  String? surname;
  String? fatherName;
  String? role;
  String? email;
  String? password;

  User({
    this.id,
    this.email,
    this.fatherName,
    this.name,
    this.password,
    this.role,
    this.surname,
  });

  @override
  String toString() {
    return 'id $id\nname $name\nsurname $surname\nfatherName $fatherName\nrole $role\nemail $email\npassword $password';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
