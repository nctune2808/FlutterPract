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
      yield state.copyWith(isImagePickerVisible: false);
      final pickedImg = await _imgPicker.getImage(source: event.imageSource);
      if (pickedImg == null) return;
      // await _profRepo.upload(pickedImg);
      await _profRepo.uploadGraph(pickedImg); // test ok

      String avt = await _profRepo.getAvatar();
      yield state.copyWith(avatarPath: avt);
    }

    if (event is ImgPathProfileEvent) {
      yield state.copyWith(avatarPath: event.avatarPath);
    }

    if (event is SaveProfileEvent) {
      // handle save changes
    }
  }
}
