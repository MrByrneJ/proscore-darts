import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../router/router.dart';
import '../../../welcome/presentation/screens/welcome_screen.dart';
import '../../data/database_cache.dart';
import '../../doman/entities/app_user.dart';
import '../../doman/usecases/i_cache_facade.dart';
import '../../doman/usecases/user_services_event.dart';

final appUserProvider = StateNotifierProvider<AppUserServices, AppUser?>(
    (ref) => AppUserServices(cacheFacade: ref.read(databaseCacheProvider)));

class AppUserServices extends StateNotifier<AppUser?> {
  AppUserServices({required this.cacheFacade}) : super(null);
  final ICacheFacade cacheFacade;

  Future<void> handleEvent(UserServicesEvent event) async {
    event.map(
        checkForUser: (event) async =>
            state = await cacheFacade.checkForCachedUser(),
        createBasicUser: (event) async => state =
            await cacheFacade.cacheBasicUser(displayName: event.displayName),
        clearData: (event) async {
          await cacheFacade.clearCachedUser(event.user);
          state = null;
          return router.go(WelcomeScreen.path);
        },
        updateUserDetails: (UpdateUserDetails value) async {
          await cacheFacade.clearCachedUser(value.newDetails);
          await cacheFacade.updateUserDetails(value.newDetails);
          state = value.newDetails;
        });
  }
}
