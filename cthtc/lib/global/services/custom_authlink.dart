import 'dart:async';

import 'package:graphql/client.dart';

typedef _RequestTransformer = FutureOr<Request> Function(Request request);

class CustomAuthLink extends AsyncReqTransformLink {
  CustomAuthLink({
    required this.getHeaders,
  }) : super(requestTransformer: transform(getHeaders));

  final FutureOr<Map<String, String>>? Function() getHeaders;

  static _RequestTransformer transform(
    FutureOr<Map<String, String>>? Function() getHeaders,
  ) =>
      (Request request) async {
        final Map<String, String>? headers = await getHeaders();
        return request.updateContextEntry<HttpLinkHeaders>(
          (_headers) => HttpLinkHeaders(
            headers: headers!,
          ),
        );
      };
}

class AsyncReqTransformLink extends Link {
  final _RequestTransformer requestTransformer;

  AsyncReqTransformLink({
    required this.requestTransformer,
  });

  @override
  Stream<Response> request(
    Request request, [
    NextLink? forward,
  ]) async* {
    final req = await requestTransformer(request);

    yield* forward!(req);
  }
}
