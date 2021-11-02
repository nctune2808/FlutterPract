import 'package:tolo/utility/fragment/photo_fragment.dart';

class UserFragment {
  //call with avatar id and photo object relationship
  static const String USER_DATA = '''
    ${PhotoFragment.PHOTO_DATA}
    fragment UserData on users{
      id,
      UUID,
      email,
      username,
      fullname,
      avatar_id,
      photo{
        ...PhotoData
      }
    }
  ''';
}
