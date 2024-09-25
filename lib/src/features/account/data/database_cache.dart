import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localstore/localstore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../doman/entities/app_user.dart';
import '../doman/usecases/i_cache_facade.dart';

final databaseCacheProvider =
    Provider((ref) => SharedPreferencesCacheFacade(ref));

class SharedPreferencesCacheFacade implements ICacheFacade {
  SharedPreferencesCacheFacade(this.ref);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final Ref ref;
  final db = Localstore.instance;

  @override
  Future<AppUser> cacheBasicUser({required String displayName}) async {
    final AppUser appUser =
        AppUser.createAppUserWithRandomId(ref: ref, name: displayName);
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
    prefs.setString('userId', appUser.id);
    await db.collection('users').delete();
    await db.collection('users').doc(appUser.id).set(appUser.toJson);
    return appUser;
  }

  @override
  Future<AppUser> checkForCachedUser() async {
    final SharedPreferences prefs = await _prefs;
    final id = prefs.getString('userId');
    if (id == null) return AppUser.defaultUser(ref);
    var details = await db.collection('users').doc(id).get();
    if (details == null) return AppUser.defaultUser(ref);
    return AppUser.fromJson(details);
  }

  @override
  Future<void> clearCachedUser() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
    await db.collection('users').delete();
  }

  @override
  Future<AppUser> updateUserDetails(AppUser appUser) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.clear();
    await prefs.setString('userId', appUser.id);
    await db.collection('users').doc(appUser.id).delete();
    await db.collection('users').doc(appUser.id).set(appUser.toJson);
    return appUser;
  }
}
