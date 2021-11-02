import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tolo/model/photo.dart';
import 'package:tolo/model/user.dart';
import 'package:tolo/src/profile/profile_repository.dart';
import 'package:tolo/utility/state/status.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitState());
  ProfileRepository _profRepo = ProfileRepository();
  final _imgPicker = ImagePicker();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is UpAvatarProfileEvent) {
      yield state.copyWith(isImagePickerVisible: true);
    }

    if (event is ImgPickerProfileEvent) {
      // handle img path
      yield state.copyWith(isImagePickerVisible: false);
      final pickedImg = await _imgPicker.getImage(source: event.imageSource);
      if (pickedImg == null) return;
      yield state.copyWith(avatarPath: pickedImg.path);
    }

    if (event is SaveProfileEvent) {
      Photo avatar = await _profRepo.updateAvatar(
          path: state.avatarPath!, user: event.user); // test ok - check?
      yield state.copyWith(photo: avatar);
    }
  }
}
