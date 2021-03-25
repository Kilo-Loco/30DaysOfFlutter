import 'package:flutter/material.dart';
import 'package:social_media_app/auth/form_submission_status.dart';
import 'package:social_media_app/models/User.dart';

class ProfileState {
  final User user;
  final bool isCurrentUser;
  final String avatarPath;
  final String userDescription;

  String get username => user.username;
  String get email => user.email;

  final FormSubmissionStatus formStatus;

  ProfileState({
    @required User user,
    @required bool isCurrentUser,
    String avatarPath,
    String userDescription,
    this.formStatus = const InitialFormStatus(),
  })  : this.user = user,
        this.isCurrentUser = isCurrentUser,
        this.avatarPath = avatarPath,
        this.userDescription = userDescription ?? user.description;

  ProfileState copyWith({
    User user,
    String avatarPath,
    String userDescription,
    FormSubmissionStatus formStatus,
  }) {
    return ProfileState(
      user: user ?? this.user,
      isCurrentUser: this.isCurrentUser,
      avatarPath: avatarPath ?? this.avatarPath,
      userDescription: userDescription ?? this.userDescription,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
