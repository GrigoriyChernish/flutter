import 'path.dart';

class UrlApi {
  String _url;

  UrlApi(this._url);

  get uri => Uri.http(PathApi.base, PathApi.api + _url);
}
