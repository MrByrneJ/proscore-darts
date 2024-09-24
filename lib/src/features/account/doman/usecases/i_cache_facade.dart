import 'package:flutter/material.dart';

import '../entities/app_user.dart';

@immutable
abstract class ICacheFacade {
  Future<AppUser> cacheBasicUser({required String displayName});
  Future<AppUser> checkForCachedUser();
  Future<void> clearCachedUser(AppUser? user);
  Future<AppUser> updateUserDetails(AppUser details);
}
