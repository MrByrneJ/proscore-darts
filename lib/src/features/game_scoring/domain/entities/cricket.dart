import '../../../../core/constant_variables.dart';
import '../../../account/doman/entities/app_user.dart';
import './darts_match.dart';

class Cricket extends DartsMatch {
  const Cricket(
      {required this.cricketNumbers,
      required super.matchId,
      required super.dateTime,
      required super.players,
      required super.firstTo,
      required super.sets,
      super.winningPlayer})
      : super(
            matchType: 'c', name: 'Cricket', startingScore: 0, playSets: false);
  final List<Map<int, int>> cricketNumbers;

  Cricket setCricketNumbers(List<int> numbers) {
    List<Map<int, int>> cNums = [
      for (var _ in players) {for (var number in numbers) number: 0}
    ];
    return copyWith(newCricketNumbers: cNums);
  }

  @override
  Dart checkDartIsValid(Dart dartThrown) {
    final section = dartThrown.section == 50 ? 25 : dartThrown.section;
    if (canScore(section: section, turn: getTurn(this))) return dartThrown;
    if (cricketNumbers[getTurn(this)][section]! >= 3) {
      return Dart(dartIndex: dartThrown.dartIndex, section: 0, multiplier: 1);
    }
    if (cricketNumbers[getTurn(this)][section] == 0) return dartThrown;
    if (cricketNumbers[getTurn(this)][section] == 1) {
      return dartThrown.multiplier == 1
          ? dartThrown
          : Dart(
              dartIndex: dartThrown.dartIndex, section: section, multiplier: 2);
    }
    return dartThrown;
  }

  @override
  Cricket updateAfterThrow() {
    var thrown = sets.last.legs.last.throws.last;
    final dartThrown = thrown.darts.last;
    Map<int, int> temp = {};
    temp.addEntries(cricketNumbers[getTurn(this)].entries);
    var set = sets.last.updateThrow(thrown);
    temp.forEach((key, value) {
      if (dartThrown.section == key) {
        temp[key] = temp[key]! + dartThrown.multiplier;
        final n = temp[key]!;
        if (canScore(section: dartThrown.section, turn: getTurn(this))) {
          set = set.updateThrow(DartThrow(
              throwIndex: thrown.throwIndex,
              player: thrown.player,
              scored:
                  thrown.scored + ((n <= 3 ? 0 : n - 3) * dartThrown.section),
              numberOfDartsThrown: thrown.numberOfDartsThrown));
        }
      }
    });
    final newCricketNumbers = [...cricketNumbers];
    newCricketNumbers[getTurn(this)] = temp;
    var newSets = [...sets];
    newSets.last = set;
    return copyWith(newCricketNumbers: newCricketNumbers, newSets: newSets);
  }

  bool canScore({required int section, required int turn}) {
    var canScore = false;
    for (var i = 0; i < cricketNumbers.length; i++) {
      if (i == turn) continue;
      final temp = cricketNumbers[i][section] ?? 0;
      if (temp < 3) canScore = true;
    }
    return canScore;
  }

  @override
  bool checkForWin(int turn) {
    // check to see if player has thrown 3 at allnumbers
    bool allOut = true;
    cricketNumbers[turn].forEach((key, value) {
      if (value < 3) allOut = false;
    });
    // check if player has highestscore
    var highScore = 0;
    for (var i = 0; i < players.length; i++) {
      var score = getScore(i);
      if (score > highScore) highScore = score;
    }
    return allOut && getScore(turn) == highScore;
  }

  Cricket resetCricketNumbers() {
    var newCricketNumbers = [...cricketNumbers];
    for (var i = 0; i < players.length; i++) {
      newCricketNumbers[i]
          .forEach((key, value) => newCricketNumbers[i][key] = 0);
    }
    return copyWith(newCricketNumbers: newCricketNumbers);
  }

  @override
  bool checkForChangeTurn(int turn) {
    final thrown = sets.last.legs.last.throws.last;
    return thrown.numberOfDartsThrown == 3;
  }

  @override
  Cricket changeTurn() {
    var newSets = [...sets];
    final nextPlayer = players[
        getNewTurn(length: players.length, currentIndex: getTurn(this))];
    newSets.last = sets.last.changeTurn(nextPlayer);
    return copyWith(newSets: newSets);
  }

  @override
  int getScore(int playerIndex) {
    final throws = sets.last.legs.last.throws;
    var scored = startingScore;
    for (var thrown in throws) {
      if (thrown.player == players[playerIndex]) {
        scored += thrown.scored;
      }
    }
    return scored;
  }

  @override
  List<Chalk> getChalks(int playerIndex) {
    Map<int, int> temp = cricketNumbers[playerIndex];
    List<Chalk> chalks = [];
    temp.forEach((key, value) => chalks.add(Chalk('$value')));
    return chalks;
  }

  @override
  int getIndicatedScore(int turn) => sets.last.legs.last.throws.last.scored;

  factory Cricket.fromJson(Map<String, dynamic> data) => Cricket(
      cricketNumbers: const [],
      matchId: data['matchId'] ?? 'Error',
      dateTime: DateTime.parse(data['dateTime'] ?? '2024-09-23T22:15:31.779'),
      players: [
        for (final Map<String, dynamic> playerJson in data['players'] ?? [])
          Player.fromJson(playerJson)
      ],
      firstTo: data['firstTo'],
      sets: [
        for (final Map<String, dynamic> setJson in data['sets'] ?? [])
          DartsSet.fromJson(setJson)
      ],
      winningPlayer: Player.fromJson(data['winningPlayer']));

  @override
  Map<String, dynamic> get toJson => {
        'matchId': matchId,
        'matchType': matchType,
        'dateTime': dateTime.toIso8601String(),
        'startingScore': startingScore,
        'playSets': playSets,
        'players': [for (final Player player in players) player.toJson],
        'firstTo': firstTo,
        'sets': [for (final DartsSet set in sets) set.toJson],
        'winningPlayer': winningPlayer?.toJson
      };

  @override
  Cricket copyWith(
          {List<Map<int, int>>? newCricketNumbers,
          List<Player>? newPlayers,
          bool? newPlaySets,
          int? newFirstTo,
          List<DartsSet>? newSets,
          int? newStartingScore,
          Player? newWinningPlayer}) =>
      Cricket(
          matchId: matchId,
          dateTime: dateTime,
          cricketNumbers: newCricketNumbers ?? cricketNumbers,
          players: newPlayers ?? players,
          firstTo: newFirstTo ?? firstTo,
          sets: newSets ?? sets,
          winningPlayer: newWinningPlayer ?? winningPlayer);
}
