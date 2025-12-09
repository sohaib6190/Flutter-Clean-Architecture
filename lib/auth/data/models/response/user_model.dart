

import '../../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.name,
    super.email,
    super.userId,
    super.userType,
    super.token,
    super.refreshToken,
    //super.roleAndActions,
    super.secretKey,
    super.isTotp,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json['name'] as String?,
    email: json['email'] as String?,
    userId: json['userId'] as String?,
    userType: json['userType'] as String?,
    token: json['token'] as String?,
    refreshToken: json['refreshToken'] as String?,
    secretKey: json['secretKey'] as String?,
    isTotp: json['isTotp'] as bool?,
  );
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      name: entity.name,
      email: entity.email,
      userId: entity.userId,
      userType: entity.userType,
      token: entity.token,
      refreshToken: entity.refreshToken,
      secretKey: entity.secretKey,
      isTotp: entity.isTotp,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'userId': userId,
    'userType': userType,
    'token': token,
    'refreshToken': refreshToken,
    'secretKey': secretKey,
    'isTotp': isTotp,
    // 'roleAndActions':
    //     roleAndActions
    //         ?.map((e) => (e as RoleAndActionsModel).toJson())
    //         .toList(),
  };
}

//
// class RoleAndActionsModel extends RoleAndActionsEntity {
//   const RoleAndActionsModel({
//     super.id,
//     super.name,
//     super.tag,
//     super.createdBy,
//     super.updatedBy,
//     super.updatedDate,
//     super.createdDate,
//     super.isActive,
//     super.actions,
//   });
//
//   factory RoleAndActionsModel.fromEntity(RoleAndActionsEntity entity) =>
//       RoleAndActionsModel(
//         id: entity.id,
//         name: entity.name,
//         tag: entity.tag,
//         createdBy: entity.createdBy,
//         updatedBy: entity.updatedBy,
//         updatedDate: entity.updatedDate,
//         createdDate: entity.createdDate,
//         isActive: entity.isActive,
//         actions: entity.actions,
//       );
//
//   factory RoleAndActionsModel.fromJson(Map<String, dynamic> json) =>
//       RoleAndActionsModel(
//         id: json['id'] as String?,
//         name: json['name'] as String?,
//         tag: json['tag'] as String?,
//         createdBy: json['createdBy'] as String?,
//         updatedBy: json['updatedBy'] as String?,
//         updatedDate: json['updatedDate'] as String?,
//         createdDate: json['createdDate'] as String?,
//         isActive: json['isActive'] as bool?,
//         // actions:
//         //     (json['actions'] as List<dynamic>?)
//         //         ?.map((e) => ActionsModel.fromJson(e))
//         //         .toList(),
//       );
//
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'name': name,
//     'tag': tag,
//     'createdBy': createdBy,
//     'updatedBy': updatedBy,
//     'updatedDate': updatedDate,
//     'createdDate': createdDate,
//     'isActive': isActive,
//   };
// }
