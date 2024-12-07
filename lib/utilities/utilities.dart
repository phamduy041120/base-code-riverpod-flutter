import 'package:flutter/cupertino.dart';

import '../data/models/api/responses/user_like_post/user_like_post.dart';
import '../resources/gen/assets.gen.dart';
import 'constants/app_constants.dart';
import 'constants/text_constants.dart';

class Utilities {
  Utilities._();

  static String getIconPath(
    String iconStatus,
    BuildContext context,
  ) {
    switch (iconStatus) {
      case TextConstants.like:
        return Assets.icons.like.path;
      case TextConstants.love:
        return Assets.icons.loverFavorite.path;
      case TextConstants.favorite:
        return Assets.icons.loverFavorite.path;
      case TextConstants.haha:
        return Assets.icons.haha.path;
      case TextConstants.wow:
        return Assets.icons.wow.path;
      case TextConstants.sad:
        return Assets.icons.sad.path;
      case TextConstants.angry:
        return Assets.icons.angry.path;
      default:
        return '';
    }
  }

  static List<String> getPostIconPath(
    BuildContext context,
    List<UserLikePost> listUserLikedPost,
  ) {
    if (listUserLikedPost.isNotEmpty) {
      final postListIconPath = listUserLikedPost
          .map((icon) => getIconPath(icon.status ?? '', context))
          .toSet()
          .toList();
      postListIconPath.removeWhere((item) => item == '');
      return postListIconPath;
    } else {
      return [];
    }
  }

  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return TextConstants.msg02;
    } else if (!RegExp(AppConstants.emailRegex).hasMatch(email)) {
      return TextConstants.msg03;
    } else {
      return null;
    }
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return TextConstants.msg04;
    } else if (password.length < AppConstants.maxPasswordLength) {
      return TextConstants.msg05;
    } else {
      return null;
    }
  }
}
