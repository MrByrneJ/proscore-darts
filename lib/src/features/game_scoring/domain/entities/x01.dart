import '../../../../core/constant_variables.dart';
import '../../../account/doman/entities/app_user.dart';
import './darts_match.dart';

class X01 extends DartsMatch {
  const X01(
      {required this.doubleIn,
      required this.doubleOut,
      required super.matchId,
      required super.dateTime,
      required super.players,
      required super.firstTo,
      required super.playSets,
      required super.sets,
      required super.startingScore,
      super.winningPlayer})
      : super(matchType: 'x', name: '$startingScore');

  final bool doubleIn;
  final bool doubleOut;

  @override
  Dart checkDartIsValid(Dart dartThrown) {
    final player = sets.last.legs.last.throws.last.player;
    final score = getScore(
        players.indexWhere((final Player p) => p.playerId == player.playerId));
    // Incase of [doubleIn] dart must be a double
    if (score == startingScore && doubleIn) {
      return dartThrown.multiplier == 2 ? dartThrown : Dart.missed();
    }
    // Incase of [doubleOut] dart must be a double
    if (score - dartThrown.score == 0) {
      if (doubleOut && dartThrown.multiplier != 2) {
        dartThrown = Dart.missed();
      }
      return dartThrown;
    }
    // Any score less the 2 if [doubleOut] or 1 otherwise is bust
    if (score - dartThrown.score == 1 && doubleOut) {
      return Dart.missed();
    }
    return score <= 0 ? Dart.missed() : dartThrown;
  }

  @override
  X01 updateAfterThrow() {
    var thrown = sets.last.legs.last.throws.last;
    final dart = thrown.darts.last;
    thrown =
        sets.last.legs.last.throws.last.updateScore(thrown.scored + dart.score);
    var newSets = [...sets];
    newSets.last = sets.last.updateThrow(thrown);
    return copyWith(newSets: newSets);
  }

  @override
  bool checkForWin(int turn) => getScore(turn) == 0;

  @override
  bool checkForChangeTurn(int turn) =>
      sets.last.legs.last.throws.last.darts.length == 3;

  @override
  X01 changeTurn() {
    var nextTurn =
        getNewTurn(length: players.length, currentIndex: getTurn(this));
    var newSets = [...sets];
    newSets.last = sets.last.changeTurn(players[nextTurn]);
    return copyWith(newSets: newSets);
  }

  @override
  int getScore(int playerIndex) {
    final throws = sets.last.legs.last.throws;
    var scored = startingScore;
    for (var thrown in throws) {
      if (thrown.player.playerId == players[playerIndex].playerId) {
        scored -= thrown.scored;
      }
    }
    return scored;
  }

  @override
  List<Chalk> getChalks(int playerIndex) {
    final throws = sets.last.legs.last.throws;
    var score = startingScore;
    var chalks = <Chalk>[];
    for (var thrown in throws) {
      if (thrown.player == players[playerIndex]) {
        if (thrown.scored == 0) continue;
        chalks.add(Chalk('${score - thrown.scored}'));
        score -= thrown.scored;
      }
    }
    return chalks;
  }

  @override
  int getIndicatedScore(int turn) => sets.last.legs.last.throws.last.scored;

  @override
  Map<String, dynamic> get toJson => {
        'matchType': matchType,
        'matchId': matchId,
        'dateTime': dateTime.toIso8601String(),
        'startingScore': startingScore,
        'playSets': playSets,
        'doubleIn': doubleIn,
        'doubleOut': doubleOut,
        'firstTo': firstTo,
        'players': [for (final player in players) player.toJson],
        'sets': [for (final set in sets) set.toJson],
        'winningPlayer': winningPlayer?.toJson
      };

  factory X01.fromJson(Map<String, dynamic> data) => X01(
      matchId: data['matchId'] ?? 'Error',
      dateTime: DateTime.parse(data['dateTime'] ?? '2024-09-23T22:15:31.779'),
      startingScore: data['startingScore'] ?? 0,
      playSets: data['playSets'] ?? false,
      doubleIn: data['doubleIn'] ?? false,
      doubleOut: data['doubleOut'] ?? true,
      firstTo: data['firstTo'] ?? 0,
      players: [
        for (Map<String, dynamic> playerData in data['players'] ?? [])
          Player.fromJson(playerData)
      ],
      sets: [
        for (Map<String, dynamic> setData in data['sets'] ?? [])
          DartsSet.fromJson(setData)
      ],
      winningPlayer: Player.fromJson(data['winningPlayer']));

  @override
  X01 copyWith(
          {List<Player>? newPlayers,
          bool? newPlaySets,
          int? newFirstTo,
          List<DartsSet>? newSets,
          int? newStartingScore,
          bool? newDoubleIn,
          bool? newDoubleOut,
          Player? newWinningPlayer}) =>
      X01(
          matchId: matchId,
          dateTime: dateTime,
          doubleIn: newDoubleIn ?? doubleIn,
          doubleOut: newDoubleOut ?? doubleOut,
          players: newPlayers ?? players,
          firstTo: newFirstTo ?? firstTo,
          playSets: newPlaySets ?? playSets,
          sets: newSets ?? sets,
          startingScore: newStartingScore ?? startingScore,
          winningPlayer: newWinningPlayer ?? winningPlayer);
}
