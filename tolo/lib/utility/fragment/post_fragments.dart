class PostFragment {
  static const String POST_DATA = '''
    fragment PostData on posts{
      id,
      title,
      body,
      isLiked,
      created_at,
    }
  ''';
}
