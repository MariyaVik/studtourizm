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
  Map? bids;

  User(
      {this.id,
      this.email,
      this.fatherName,
      this.name,
      this.password,
      this.role,
      this.surname,
      this.bids});

  @override
  String toString() {
    return 'id $id\nname $name\nsurname $surname\nfatherName $fatherName\nrole $role\nemail $email\npassword $password';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
