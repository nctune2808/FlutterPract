part of 'profile_bloc.dart';

class ProfileState {
  User? user;
  Photo? photo;
  String? avatarPath;
  Status? status;
  bool isImagePickerVisible;

  ProfileState({
    this.user,
    this.photo,
    this.avatarPath,
    this.status = const StatusInitial(),
    this.isImagePickerVisible = false,
  });

  ProfileState copyWith({
    User? user,
    Photo? photo,
    String? avatarPath,
    Status? status,
    bool? isImagePickerVisible,
  }) {
    return ProfileState(
      user: user ?? this.user,
      photo: photo ?? this.photo,
      avatarPath: avatarPath ?? this.avatarPath,
      status: status ?? this.status,
      isImagePickerVisible: isImagePickerVisible ?? this.isImagePickerVisible,
    );
  }
}

class ProfileInitState extends ProfileState {}
