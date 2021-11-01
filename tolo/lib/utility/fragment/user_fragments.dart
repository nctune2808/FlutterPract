import 'package:tolo/utility/fragment/photo_fragment.dart';

class UserFragment {
  static const String USER_DATA = '''
    ${PhotoFragment.PHOTO_DATA}
    fragment UserData on users{
      id,
      UUID,
      email,
      username,
      fullname,
      photo{
        ...PhotoData
      }
    }
  ''';
}
