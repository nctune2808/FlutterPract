class PostFragment {
  static const String POST_DATA = '''
    fragment PostData on posts{
      id,
      title,
      body,
      read,
      created_at,
    }
  ''';
}
