import '../../../../core/constant_variables.dart';
import '../../../account/doman/entities/app_user.dart';
import './darts_match.dart';

class Bobs extends DartsMatch {
  const Bobs(
      {required this.targetNumbers,
      required super.matchId,
      required super.dateTime,
      required super.players,
      required super.sets,
      required this.allowNegativeNumbers,
      super.winningPlayer})
      : super(
            matchType: 'b',
            name: 'Bobs 27s',
            startingScore: 27,
            firstTo: 1,
            playSets: false);
  final List<int> targetNumbers;
  final bool allowNegativeNumbers;

  @override
  Dart checkDartIsValid(Dart dartThrown) {
    final player = sets.last.legs.last.throws.last.player;
    final turn = players.indexWhere((element) => element == player);
    if (dartThrown.section != targetNumbers[turn]) {
      return Dart(dartIndex: dartThrown.dartIndex, multiplier: 1, section: 0);
    }
    if (dartThrown.multiplier == 2) {
      return dartThrown;
    }
    return Dart(dartIndex: dartThrown.dartIndex, multiplier: 1, section: 0);
  }

  @override
  Bobs updateAfterThrow() {
    var thrown = sets.last.legs.last.throws.last;
    var scored = 0;
    for (var dart in thrown.darts) {
      scored += dart.score;
    }
    thrown = thrown.updateScore(scored);
    var newSets = [...sets];
    newSets.last = sets.last.updateThrow(thrown);
    return copyWith(newSets: newSets);
  }

  @override
  bool checkForWin(int turn) {
    final thrown = sets.last.legs.last.throws.last;
    var allThrown = thrown.throwIndex == players.length * 21;
    if (thrown.darts.length < 3) return false;
    return allThrown;
  }

  @override
  bool checkForChangeTurn(int turn) =>
      sets.last.legs.last.throws.last.darts.length == 3;

  Bobs change(Bobs match) {
    final thrown = match.sets.last.legs.last.throws.last;
    var newSet = match.sets.last;
    var newSets = [...match.sets];
    var newTargetNumbers = [...targetNumbers];
    if (thrown.scored == 0 && thrown.darts.isNotEmpty) {
      newSet = newSet
          .updateThrow(thrown.updateScore(-targetNumbers[getTurn(match)]));
    }
    // update target numbers
    newTargetNumbers[getTurn(match)] = newTargetNumbers[getTurn(match)] == 20
        ? 25
        : newTargetNumbers[getTurn(match)] + 1;
    // ChangeTurn
    newSets.add(newSet.changeTurn(players[
        getNewTurn(length: players.length, currentIndex: getTurn(match))]));
    return copyWith(newSets: newSets, newTargetNumbers: newTargetNumbers);
  }

  @override
  Bobs changeTurn() {
    late Bobs match;
    for (var i = 0; i < players.length; i++) {
      match = change(this);
      var score = getScore(getTurn(match));
      if (score > 0 || allowNegativeNumbers) break;
    }
    return match;
  }

  Bobs updatetargetNumbers(List<int> targetNumbers) =>
      copyWith(newTargetNumbers: targetNumbers);

  @override
  int getScore(int playerIndex, [DartsMatch? newMatch]) {
    var throws = sets.last.legs.last.throws;
    if (newMatch != null) throws = newMatch.sets.last.legs.last.throws;
    var scored = startingScore;
    for (var thrown in throws) {
      if (thrown.player == players[playerIndex]) {
        scored = scored += thrown.scored;
      }
    }
    return scored;
  }

  @override
  List<Chalk> getChalks(int playerIndex) {
    final throws = sets.last.legs.last.throws;

    var chalks = <Chalk>[];
    var targetNumber = 1;
    for (var thrown in throws) {
      if (thrown == throws.last) continue;
      if (thrown.player != players[playerIndex]) continue;
      chalks.add(Chalk('$targetNumber) ${thrown.scored}'));
      targetNumber = targetNumber == 20 ? 25 : targetNumber + 1;
    }
    return chalks;
  }

  @override
  int getIndicatedScore(int turn) => targetNumbers[turn];

  factory Bobs.fromJson(Map<String, dynamic> data) => Bobs(
      targetNumbers: data['targetNumbers'] ?? [0, 0, 0],
      matchId: data['matchId'] ?? 'Error',
      dateTime: DateTime.parse(data['dateTime'] ?? '2024-09-23T22:15:31.779'),
      players: [
        for (final Map<String, dynamic> playerJson in data['players'] ?? [])
          Player.fromJson(playerJson)
      ],
      sets: [
        for (Map<String, dynamic> dartSet in data['sets'] ?? [])
          DartsSet.fromJson(dartSet)
      ],
      allowNegativeNumbers: data['allowNegativeNumbers'] ?? false,
      winningPlayer: Player.fromJson(data['winningPlayer']));

  @override
  Map<String, dynamic> get toJson => {
        'targetNumbers': targetNumbers,
        'matchId': matchId,
        'matchType': matchType.toString(),
        'dateTime': dateTime,
        'startingScore': startingScore,
        'firstTo': firstTo,
        'playSets': playSets,
        'players': [for (Player player in players) player.toJson],
        'sets': [for (final set in sets) set.toJson],
        'allowNegativeNumbers': allowNegativeNumbers,
        'winningPlayer': winningPlayer?.toJson
      };

  @override
  Bobs copyWith(
      {List<int>? newTargetNumbers,
      bool? newAllowNegativeNumbers,
      List<Player>? newPlayers,
      bool? newPlaySets,
      int? newFirstTo,
      List<DartsSet>? newSets,
      int? newStartingScore,
      Player? newWinningPlayer}) {
    return Bobs(
        matchId: matchId,
        dateTime: dateTime,
        targetNumbers: newTargetNumbers ?? targetNumbers,
        allowNegativeNumbers: newAllowNegativeNumbers ?? allowNegativeNumbers,
        players: newPlayers ?? players,
        sets: newSets ?? sets,
        winningPlayer: newWinningPlayer ?? winningPlayer);
  }
}
