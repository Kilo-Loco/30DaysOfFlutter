import 'package:image_picker/image_picker.dart';

abstract class ProfileEvent {}

class ChangeAvatarRequest extends ProfileEvent {}

class OpenImagePicker extends ProfileEvent {
  final ImageSource imageSource;

  OpenImagePicker({this.imageSource});
}

class ProvideImagePath extends ProfileEvent {
  final String avatarPath;

  ProvideImagePath({this.avatarPath});
}

class ProfileDescriptionChanged extends ProfileEvent {
  final String description;

  ProfileDescriptionChanged({this.description});
}

class SaveProfileChanges extends ProfileEvent {}
