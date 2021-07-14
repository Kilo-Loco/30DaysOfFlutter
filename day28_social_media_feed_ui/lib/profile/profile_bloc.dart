import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/auth/form_submission_status.dart';
import 'package:social_media_app/data_repository.dart';
import 'package:social_media_app/image_url_cache.dart';
import 'package:social_media_app/models/User.dart';
import 'package:social_media_app/profile/profile_event.dart';
import 'package:social_media_app/profile/profile_state.dart';

import '../storage_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final DataRepository dataRepo;
  final StorageRepository storageRepo;
  final _picker = ImagePicker();

  ProfileBloc({
    @required this.dataRepo,
    @required this.storageRepo,
    @required User user,
    @required bool isCurrentUser,
  }) : super(ProfileState(user: user, isCurrentUser: isCurrentUser)) {
    ImageUrlCache.instance
        .getUrl(user.avatarKey)
        .then((url) => add(ProvideImagePath(avatarPath: url)));
  }

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ChangeAvatarRequest) {
      yield state.copyWith(imageSourceActionSheetIsVisible: true);
    } else if (event is OpenImagePicker) {
      yield state.copyWith(imageSourceActionSheetIsVisible: false);
      final pickedImage = await _picker.getImage(source: event.imageSource);
      if (pickedImage == null) return;

      final imageKey = await storageRepo.uploadFile(File(pickedImage.path));

      final updatedUser = state.user.copyWith(avatarKey: imageKey);

      final results = await Future.wait([
        dataRepo.updateUser(updatedUser),
        storageRepo.getUrlForFile(imageKey),
      ]);

      yield state.copyWith(avatarPath: results.last);
    } else if (event is ProvideImagePath) {
      yield state.copyWith(avatarPath: event.avatarPath);
    } else if (event is ProfileDescriptionChanged) {
      yield state.copyWith(userDescription: event.description);
    } else if (event is SaveProfileChanges) {
      yield state.copyWith(formStatus: FormSubmitting());

      final updatedUser =
          state.user.copyWith(description: state.userDescription);

      try {
        await dataRepo.updateUser(updatedUser);
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
