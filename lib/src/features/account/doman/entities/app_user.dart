import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../game_scoring/domain/entities/bobs.dart';
import '../../../game_scoring/domain/entities/atc.dart';
import '../../../game_scoring/domain/entities/cricket.dart';
import '../../../game_scoring/domain/entities/darts_match.dart';
import '../../../game_scoring/domain/entities/x01.dart';

class AppUser {
  const AppUser(
      {required this.id, required this.displayName, required this.history});
  final String id;
  final String displayName;
  final List<DartsMatch> history;

  AppUser.defaultUser(Ref ref)
      : id = '',
        displayName = '',
        history = [];

  AppUser.createAppUserWithRandomId({required Ref ref, required String name})
      : id = const Uuid().v1(),
        displayName = name,
        history = [];

  AppUser updateMatchHistory({required DartsMatch newMatch}) {
    return _copyWith(newHistory: [...history, newMatch]);
  }

  // AppUser updateAvatarColor(Color avatarColor) =>
  //     _copyWith(newAvatarColor: avatarColor);
  Map<String, dynamic> get toJson => {
        'userId': id,
        'displayName': displayName,
        // 'matchHistory': [for (final match in history) match.toJson]
      };

  factory AppUser.fromJson(Map<String, dynamic> data) {
    DartsMatch? convertMatchData({required Map<String, dynamic> matchData}) {
      switch (matchData['matchType']) {
        case 'a':
          return ATC.fromJson(matchData);
        case 'b':
          return Bobs.fromJson(matchData);
        case 'c':
          return Cricket.fromJson(matchData);
        case 'x':
          return X01.fromJson(matchData);
      }
      return null;
    }

    return AppUser(
        id: data['userId'],
        displayName: data['displayName'],
        // history: [
        //   for (Map<String, dynamic> matchData in data['matchHistory'] ?? [])
        //     convertMatchData(matchData: matchData)!
        // ]
        history: []);
  }

  AppUser _copyWith({
    String? newId,
    String? newDisplayName,
    List<DartsMatch>? newHistory,
    // Color? newAvatarColor,
  }) =>
      AppUser(
          id: newId ?? id,
          displayName: newDisplayName ?? displayName,
          history: newHistory ?? history);
}

class Player {
  Player({required this.playerId, required this.displayName});

  final String playerId;
  final String displayName;

  factory Player.createAppUserWithRandomId(
          {required Ref ref, required String name}) =>
      Player(playerId: const Uuid().v1(), displayName: name);

  factory Player.hasError(String error) =>
      Player(playerId: 'ERROR: $error', displayName: 'ERROR');

  Map<String, dynamic> get toJson =>
      {'playerId': playerId, 'displayName': displayName};

  factory Player.fromJson(Map<String, dynamic> playerJson) {
    final String playerId = playerJson['playerId'] ?? '';
    final String displayName = playerJson['displayName'] ?? '';
    if (playerId.isEmpty || displayName.isEmpty) {
      return Player.hasError('Empty values given');
    }
    return Player(playerId: playerId, displayName: displayName);
  }
}
