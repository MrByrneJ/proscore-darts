import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/app_user.dart';
part 'user_services_event.freezed.dart';

@freezed
class UserServicesEvent with _$UserServicesEvent {
  const factory UserServicesEvent.checkForUser() = CheckForUser;
  const factory UserServicesEvent.createBasicUser(String displayName) =
      CreateBasicUser;
  const factory UserServicesEvent.updateUserDetails(AppUser newDetails) =
      UpdateUserDetails;
  const factory UserServicesEvent.clearData(AppUser? user) = ClearData;
}
