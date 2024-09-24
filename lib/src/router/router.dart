import 'package:go_router/go_router.dart';

import '../app.dart';
import '../features/account/presentation/screens/match_history_screen.dart';
import '../features/game_scoring/presentation/screens/scoring_screen.dart';
import '../features/game_selection/presentation/screens/add_player_screen.dart';
import '../features/game_selection/presentation/screens/game_selection_screen.dart';
import '../features/game_selection/presentation/screens/match_settings_screen.dart';
import '../features/game_selection/presentation/screens/player_settings_screen.dart';
import '../features/game_selection/presentation/screens/starting_score_screen.dart';
import '../features/welcome/presentation/screens/welcome_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
      path: SplashScreen.path,
      builder: (context, state) => const SplashScreen()),
  GoRoute(
      path: WelcomeScreen.path,
      builder: (context, state) => const WelcomeScreen()),
  GoRoute(
      path: GameSelectionScreen.path,
      builder: (context, state) => const GameSelectionScreen()),
  GoRoute(
      path: ScoringScreen.path,
      builder: (context, state) => const ScoringScreen()),
  GoRoute(
      path: StartingScoreScreen.path,
      builder: (context, state) => const StartingScoreScreen()),
  GoRoute(
      path: PlayerSettingsScreen.path,
      builder: (context, state) => const PlayerSettingsScreen()),
  GoRoute(
      path: AddPlayerScreen.path,
      builder: (context, state) => const AddPlayerScreen()),
  GoRoute(
      path: MatchSettingsScreen.path,
      builder: (context, state) => const MatchSettingsScreen()),
  GoRoute(
      path: MatchHistoryScreen.path,
      builder: (context, state) => const MatchHistoryScreen()),
]);
