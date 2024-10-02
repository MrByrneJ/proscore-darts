import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proscore_darts/src/features/account/doman/entities/app_user.dart';
import 'package:proscore_darts/src/features/game_selection/presentation/screens/game_selection_screen.dart';
import 'package:proscore_darts/src/features/welcome/presentation/screens/welcome_screen.dart';

import 'core/constant_variables.dart';
import 'core/widgets/loading.dart';
import 'features/account/doman/usecases/user_services_event.dart';
import 'features/account/presentation/providers/app_user_provider.dart';
import 'router/router.dart';
import 'settings/settings_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  static const path = '/';

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Set the radius of buttons and input fields
    final r = BorderRadius.circular(100);

    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black,
              foregroundColor: primaryWhite,
              elevation: 0,
              centerTitle: true,
            ),
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(borderRadius: r),
                enabledBorder: OutlineInputBorder(borderRadius: r),
                focusedBorder: OutlineInputBorder(borderRadius: r),
                filled: true,
                fillColor: Colors.white),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(Colors.green),
                    foregroundColor: const WidgetStatePropertyAll(Colors.white),
                    minimumSize:
                        const WidgetStatePropertyAll(Size(double.infinity, 50)),
                    shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(borderRadius: r)))),
          ),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          routerConfig: router,
        );
      },
    );
  }
}

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});
  static const path = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Rebuild!!!!!!!');
    // final state = ref.watch(appUserProvider);
    // if (state == null) {
    //   ref
    //       .read(appUserProvider.notifier)
    //       .handleEvent(const UserServicesEvent.checkForUser());
    // }
    return FutureBuilder(
        future: ref
            .read(appUserProvider.notifier)
            .handleEvent(const UserServicesEvent.checkForUser()),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          }
          final state = ref.watch(appUserProvider);
          print(state?.id ?? 'NULL');
          return state == null || state.id.isEmpty
              ? const WelcomeScreen()
              : const GameSelectionScreen();
        });
  }
}
