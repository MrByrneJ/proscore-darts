import '../../../../core/validators.dart';

class WelcomeScreenState {
  WelcomeScreenState(
      {required this.displayName,
      required this.isLoading,
      required this.errorMessage,
      required this.showErrorMessages});
  final String displayName;
  final bool isLoading;
  final String errorMessage;
  final bool showErrorMessages;

  WelcomeScreenState.initial()
      : displayName = '',
        isLoading = false,
        errorMessage = '',
        showErrorMessages = false;

  WelcomeScreenState inputDisplayName(String displayName) {
    var errorMessage = displayNameValidationError(displayName);
    return copyWith(
      newDisplayName: displayName,
      newErrorMessage: errorMessage,
    );
  }

  WelcomeScreenState? inputtingComplete() {
    final displayNameErrorMessage = displayNameValidationError(displayName);
    if (displayNameErrorMessage.isEmpty) return null;
    return copyWith(
      newShowErrorMessages: true,
      newErrorMessage: displayNameErrorMessage,
      newIsLoading: false,
    );
  }

  WelcomeScreenState copyWith(
          {String? newDisplayName,
          bool? newIsLoading,
          String? newErrorMessage,
          bool? newShowErrorMessages}) =>
      WelcomeScreenState(
          displayName: newDisplayName ?? displayName,
          isLoading: newIsLoading ?? isLoading,
          errorMessage: newErrorMessage ?? errorMessage,
          showErrorMessages: newShowErrorMessages ?? showErrorMessages);
}
