import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tolo/utility/state/status.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitState());
  final _imgPicker = ImagePicker();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is UpAvatarProfileEvent) {
      yield state.copyWith(isImagePickerVisible: true);
    } else if (event is ImgPickerProfileEvent) {
      yield state.copyWith(isImagePickerVisible: false);
      final pickedImg = await _imgPicker.getImage(source: event.imageSource);
      if (pickedImg == null) return;
      yield state.copyWith(avatarPath: pickedImg.path);
    } else if (event is ImgPathProfileEvent) {
      yield state.copyWith(avatarPath: event.avatarPath);
    } else if (event is UpDescriptionProfileEvent) {
      yield state.copyWith(userDescription: event.description);
    } else if (event is SaveProfileEvent) {
      // handle save changes
    }
  }
}
