import 'package:amplify_flutter/amplify.dart';

class ImageUrlCache {
  ImageUrlCache._privateConstructor();

  static final ImageUrlCache _instance = ImageUrlCache._privateConstructor();

  static ImageUrlCache get instance => _instance;

  Map<String, String> _urlCache = Map();

  Future<String> getUrl(String imageKey) async {
    String url = _urlCache[imageKey];

    if (url == null) {
      try {
        url = (await Amplify.Storage.getUrl(key: imageKey)).url;
        _urlCache[imageKey] = url;
      } catch (e) {
        print(e);
      }
    }

    return url;
  }
}
