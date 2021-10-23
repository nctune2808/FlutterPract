part of 'profile_bloc.dart';

class ProfileState {
  final User? user;
  final bool? isCurrentUser;
  final String? avatarPath;
  final String? userDescription;
  final Status? status;
  bool isImagePickerVisible;

  ProfileState({
    this.user,
    this.isCurrentUser,
    this.avatarPath,
    this.userDescription,
    this.status = const StatusInitial(),
    this.isImagePickerVisible = false,
  });

  ProfileState copyWith({
    User? user,
    bool? isCurrentUser,
    String? avatarPath,
    String? userDescription,
    Status? status,
    bool? isImagePickerVisible,
  }) {
    return ProfileState(
      user: user ?? this.user,
      isCurrentUser: isCurrentUser ?? this.isCurrentUser,
      avatarPath: avatarPath ?? this.avatarPath,
      userDescription: userDescription ?? this.userDescription,
      status: status ?? this.status,
      isImagePickerVisible: isImagePickerVisible ?? this.isImagePickerVisible,
    );
  }
}

class ProfileInitState extends ProfileState {}
