import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zoozle_store/app/widgets/remote_config.dart';

class FirebaseImage extends StatelessWidget {
  final String? path;
  final BoxFit boxFit;
  final double? height;
  final double? width;
  final bool? compress;
  final Alignment? alignment;
  final Color backgroundColor;
  final String? imageBaseUrl;
  final String? token;
  final bool? isPrivate;
  final bool? isProduct;
  final Widget? placeholder;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;

  // static Reference ref = FirebaseStorage.instance.ref();
  static Map<String, String> urls = {};

  const FirebaseImage(this.path,
      {Key? key,
        this.boxFit = BoxFit.cover,
        this.width,
        this.height,
        this.imageBuilder,
        this.compress = true,
        this.alignment,
        this.imageBaseUrl,
        this.token,
        this.backgroundColor = Colors.white,
        this.isPrivate,
        this.placeholder,
        this.isProduct})
      : super(key: key);

  String getFirebaseURL() {
    var encodedPath = Uri.encodeComponent(path!);
    if (imageBaseUrl == null) {
      if (isPrivate == true) {
        return RemoteConfigUtils.instance
            .getFirebaseUrl(encodedPath, token: token);
      } else {
        if (isProduct == true) {
          return RemoteConfigUtils.instance
              .getProductCDNFirebaseUrl(encodedPath, token: token);
        } else {
          return RemoteConfigUtils.instance
              .getCDNFirebaseUrl(encodedPath, token: token);
        }
      }
    } else {
      return "$imageBaseUrl/$encodedPath?alt=media${token == null ? "" : "&token=$token"}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return path == null
        ? Container(
      height: height,
      width: width,
      color: Colors.grey[200],
    )
        : Container(
      color: backgroundColor,
      child: CachedNetworkImage(
        imageUrl: getFirebaseURL(),
        imageBuilder: imageBuilder,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: boxFit,
        placeholder: placeholder != null
            ? (ctx, _) {
          return placeholder!;
        }
            : null,
        alignment: alignment ?? Alignment.center,
        height: height,
        width: width,
        memCacheHeight: compress == true ? 500 : null,
      ),
    );
  }
}
