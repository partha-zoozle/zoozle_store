import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';


class RemoteConfigUtils {
  RemoteConfigUtils._();

  static final RemoteConfigUtils instance = RemoteConfigUtils._();

  static FirebaseRemoteConfig? _remoteConfig;


  static Future<FirebaseRemoteConfig> getRemoteConfig() async {
    if (_remoteConfig == null) {
      _remoteConfig = FirebaseRemoteConfig.instance;
      await _remoteConfig?.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 6),
      ));
      await _remoteConfig?.fetchAndActivate();
    }
    return _remoteConfig!;
  }
  String getFirebaseUrl(String encodedPath, {String? token}) =>
      _remoteConfig == null
          ? ""
          : _remoteConfig!
          .getString("firebase_url")
          .replaceAll("{encodedPath}", encodedPath) +
          (token == null ? "" : "&token=$token");

  String getCDNFirebaseUrl(String path, {String? token}) => _remoteConfig ==
      null
      ? ""
      : _remoteConfig!.getString("firebase_path").replaceAll("{path}", path) +
      (token == null ? "" : "&token=$token");

  String getProductCDNFirebaseUrl(String path, {String? token}) =>
      _remoteConfig == null
          ? ""
          : _remoteConfig!
          .getString("product_firebase_path")
          .replaceAll("{path}", path) +
          (token == null ? "" : "&token=$token");

}
