import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums.dart';
import '../entities/darts_match.dart';

part 'scoring_screen_event.freezed.dart';

@freezed
class ScoringScreenEvent with _$ScoringScreenEvent {
  const factory ScoringScreenEvent.selectMatch(DartsMatch match) = SelectMatch;
  const factory ScoringScreenEvent.startGame(DartsMatch newMatch) = StartGame;
  const factory ScoringScreenEvent.selectInputMethod(
      ScoringInputMethod method) = SelectInputMethod;
  const factory ScoringScreenEvent.selectMultiplier(
      SelectedMultiplier multiplier) = SelectMultiplier;
  const factory ScoringScreenEvent.inputIndicatedScore(String keyed) =
      InputIndicatedScore;
  const factory ScoringScreenEvent.throwDart(Dart dartThrown) = ThrowDart;
  const factory ScoringScreenEvent.submitScored(int keyed) = SubmitScored;
  const factory ScoringScreenEvent.updateNumberOfDartsThrown(int num) =
      UpdateNumberOfDartsThrown;
  const factory ScoringScreenEvent.endLeg() = EndLeg;
}
