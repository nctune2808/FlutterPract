class PhotoFragment {
  static const String PHOTO_DATA = '''
    fragment PhotoData on photos{
      id,
      path,
      url,
      type,
      created_at,
    }
  ''';
}
