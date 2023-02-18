// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      email: json['email'] as String?,
      fatherName: json['fatherName'] as String?,
      name: json['name'] as String?,
      password: json['password'] as String?,
      role: json['role'] as String?,
      surname: json['surname'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'fatherName': instance.fatherName,
      'role': instance.role,
      'email': instance.email,
      'password': instance.password,
    };
