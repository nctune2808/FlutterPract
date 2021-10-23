class UserFragment {
  static const String USER_DATA = '''
    fragment UserData on users{
      id,
      UUID,
      email,
      username,
      fullname,
    }
  ''';
}
