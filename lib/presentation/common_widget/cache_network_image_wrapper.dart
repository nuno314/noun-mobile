import 'package:cached_network_image/cached_network_image.dart';
import 'package:emotee/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'loading.dart';

class CachedNetworkImageWrapper extends CachedNetworkImage {
  CachedNetworkImageWrapper({
    super.key,
    required String url,
    double? width,
    double? height,
    BoxFit? fit,
  }) : super(
          imageUrl: url,
          width: width,
          height: height,
          fit: fit,
          placeholder: (context, url) => const Loading(
            brightness: Brightness.light,
            radius: 10,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );

  CachedNetworkImageWrapper.avatar({
    super.key,
    required String url,
    double? width,
    double? height,
    BoxFit? fit,
  }) : super(
          imageUrl: url,
          width: width,
          height: height,
          fit: fit,
          placeholder: (context, url) => const Loading(
            brightness: Brightness.light,
            radius: 10,
          ),
          errorWidget: (context, url, error) => SvgPicture.asset(
            Assets.svg.icAvatar,
            width: width,
          ),
        );

  CachedNetworkImageWrapper.item({
    super.key,
    required String url,
    double? width,
    double? height,
    BoxFit? fit,
  }) : super(
          imageUrl: url,
          width: width,
          height: height,
          fit: fit,
          placeholder: (context, url) => const Loading(
            brightness: Brightness.light,
            radius: 10,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );

  CachedNetworkImageWrapper.banner({
    super.key,
    required String url,
    double? width,
    double? height,
    BoxFit? fit,
  }) : super(
          imageUrl: url,
          width: width,
          height: height,
          fit: fit,
          placeholder: (context, url) => const Loading(
            brightness: Brightness.light,
            radius: 10,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );

  CachedNetworkImageWrapper.background({
    super.key,
    required String url,
    double? width,
    double? height,
    BoxFit? fit,
  }) : super(
          imageUrl: url,
          width: width,
          height: height,
          fit: fit,
          placeholder: (context, url) => const Loading(
            brightness: Brightness.light,
            radius: 10,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );
}
