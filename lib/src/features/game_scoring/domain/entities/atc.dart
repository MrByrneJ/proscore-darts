import '../../../../core/constant_variables.dart';
import '../../../../core/enums.dart';
import '../../../account/doman/entities/app_user.dart';
import './darts_match.dart';

class ATC extends DartsMatch {
  const ATC(
      {required this.targetNumbers,
      required super.matchId,
      required super.dateTime,
      required super.players,
      required super.sets,
      super.winningPlayer})
      : super(
            matchType: 'a',
            name: 'Around The Clock',
            startingScore: 1,
            firstTo: 1,
            playSets: false);
  final List<int> targetNumbers;

  @override
  Dart checkDartIsValid(Dart dartThrown) {
    final player = sets.last.legs.last.throws.last.player;
    final turn =
        players.indexWhere((Player e) => e.playerId == player.playerId);
    if (dartThrown.section == targetNumbers[turn]) return dartThrown;

    return Dart(dartIndex: dartThrown.dartIndex, multiplier: 1, section: 0);
  }

  @override
  ATC updateAfterThrow() {
    var newSets = [...sets];
    newSets.removeLast();
    newSets.add(sets.last.updateThrow(sets.last.legs.last.throws.last
        .updatenumberOfDartsThrown(
            sets.last.legs.last.throws.last.darts.length)));
    return copyWith(newSets: [...newSets]);
  }

  @override
  bool checkForWin(int turn) {
    return sets.last.legs.last.throws.last.darts.last.section == 50 &&
        targetNumbers[turn] == 50;
  }

  @override
  bool checkForChangeTurn(int turn) =>
      sets.last.legs.last.throws.last.darts.length == 3;

  @override
  ATC changeTurn() {
    var thrown = sets.last.legs.last.throws.last;
    var newSets = [...sets];
    var retrigger = true;
    if (thrown.darts.any((e) => e.section == 0)) {
      retrigger = false;
    }
    var nextTurn = retrigger
        ? players.indexWhere((Player e) => e.playerId == thrown.player.playerId)
        : getNewTurn(length: players.length, currentIndex: getTurn(this));
    newSets.last = sets.last.changeTurn(players[nextTurn]);
    return copyWith(newSets: newSets);
  }

  ATC updateTargetNumbers(int turn, int multiplier) {
    var newTargetNumbers = [...targetNumbers];
    if (multiplier == 3 && newTargetNumbers[turn] >= 18) {
      newTargetNumbers[turn] = 25;
      return copyWith(newTargetNumbers: newTargetNumbers);
    }
    if (multiplier == 2 && newTargetNumbers[turn] >= 19) {
      newTargetNumbers[turn] = 25;
      return copyWith(newTargetNumbers: newTargetNumbers);
    }
    if (newTargetNumbers[turn] == 20) {
      newTargetNumbers[turn] = 25;
      return copyWith(newTargetNumbers: newTargetNumbers);
    }
    if (newTargetNumbers[turn] == 25) {
      newTargetNumbers[turn] = 50;
      return copyWith(newTargetNumbers: newTargetNumbers);
    }
    newTargetNumbers[turn] += multiplier;
    return copyWith(newTargetNumbers: newTargetNumbers);
  }

  @override
  int getScore(int playerIndex) => targetNumbers[playerIndex];

  @override
  List<Chalk> getChalks(int playerIndex) {
    final throws = sets.last.legs.last.throws;
    var chalks = <Chalk>[];
    for (var thrown in throws) {
      if (thrown.player != players[playerIndex]) continue;
      for (var dart in thrown.darts) {
        var temp = '${dart.section}) ';
        if (dart.section == 0) continue;
        if (dart.multiplier == 3) {
          temp = '$temp${getScoreIcon(ScoreIcon.circle)}';
        }
        if (dart.multiplier == 2) {
          temp = '$temp${getScoreIcon(ScoreIcon.cross)}';
        }
        if (dart.multiplier == 1) {
          temp = '$temp${getScoreIcon(ScoreIcon.line)}';
        }
        chalks.add(Chalk(temp));
      }
    }
    return chalks;
  }

  @override
  int getIndicatedScore(int turn) => targetNumbers[turn];

  @override
  factory ATC.fromJson(Map<String, dynamic> data) => ATC(
      targetNumbers: data['targetNumbers'] ?? [0, 0, 0],
      matchId: data['matchId'] ?? 'Error',
      dateTime: DateTime.parse(data['dateTime'] ?? '2024-09-23T22:15:31.779'),
      players: [
        for (final Map<String, dynamic> playerJson in data['players'] ?? [])
          Player.fromJson(playerJson)
      ],
      sets: [
        for (Map<String, dynamic> setData in data['sets'] ?? [])
          DartsSet.fromJson(setData)
      ],
      winningPlayer: data['winningPlayer']);

  @override
  Map<String, dynamic> get toJson {
    return {
      'targetNumbers': targetNumbers,
      'matchId': matchId,
      'matchType': matchType,
      'dateTime': dateTime.toIso8601String(),
      'startingScore': startingScore,
      'firstTo': firstTo,
      'playSets': playSets,
      'players': [for (final Player player in players) player.toJson],
      'sets': [for (final DartsSet set in sets) set.toJson],
      'winningPlayer': winningPlayer?.toJson
    };
  }

  @override
  ATC copyWith(
          {List<int>? newTargetNumbers,
          List<Player>? newPlayers,
          bool? newPlaySets,
          int? newFirstTo,
          List<DartsSet>? newSets,
          int? newStartingScore,
          Player? newWinningPlayer}) =>
      ATC(
          matchId: matchId,
          dateTime: dateTime,
          targetNumbers: newTargetNumbers ?? targetNumbers,
          players: newPlayers ?? players,
          sets: newSets ?? sets,
          winningPlayer: newWinningPlayer ?? winningPlayer);
}
