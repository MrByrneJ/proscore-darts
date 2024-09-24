import 'package:freezed_annotation/freezed_annotation.dart';
part 'welcome_screen_event.freezed.dart';

@freezed
class WelcomeScreenEvent with _$WelcomeScreenEvent {
  const factory WelcomeScreenEvent.userInputting(String displayName) =
      UserInputting;
  const factory WelcomeScreenEvent.inputtingComplete() = InputtingComplete;
}
