import 'package:flutter/foundation.dart';

import 'path.dart';

class UrlApi {
  String _url;

  UrlApi(this._url);

  get uri =>
      kReleaseMode ? Uri.https(PathApi.base, PathApi.api + _url) : Uri.http(PathApi.base, PathApi.api + _url);
}
