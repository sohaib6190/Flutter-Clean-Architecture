

import '../../../domain/entities/user_entity.dart';
import 'user_model.dart';

extension UserModelMapper on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      name: name,
      email: email,
      userId: userId,
      userType: userType,
      token: token,
      refreshToken: refreshToken,
      secretKey: secretKey,
      isTotp: isTotp,
    );
  }
}
