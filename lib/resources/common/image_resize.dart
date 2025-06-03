import 'dart:async';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

enum kSize { small, medium, large }

class ImageResize extends StatelessWidget {
  final String? url;
  final kSize? size;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? tag;
  final double offset;
  final bool isResize;
  final bool hidePlaceHolder;
  final bool forceWhiteBackground;
  final String kImageProxy;
  final Alignment? alignmentImage;

  const ImageResize({
    Key? key,
    this.url,
    this.size,
    this.width,
    this.height,
    this.fit,
    this.tag,
    this.isResize = false,
    this.hidePlaceHolder = false,
    this.offset = 0.0,
    this.forceWhiteBackground = false,
    this.kImageProxy = '',
    this.alignmentImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imgWidth = width ?? 300.0;
    final imgHeight = height ?? imgWidth;

    if (url?.isEmpty ?? true) {
      return FutureBuilder<bool>(
        future: Future.delayed(const Duration(seconds: 10), () => false),
        initialData: true,
        builder: (context, snapshot) {
          final showSkeleton = snapshot.data!;
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: showSkeleton
                ? Container(
              width: imgWidth,
              height: imgHeight,
              color: Colors.grey[300],
            )
                : SizedBox(
              width: imgWidth,
              height: imgHeight,
              child: const Icon(Icons.error_outline),
            ),
          );
        },
      );
    }

    final cacheWidth =
    (this.width != null && this.width! > 0) ? (this.width! * 2.5).toInt() : 700;

    final image = ExtendedImage.network(
      url!,
      width: imgWidth,
      height: imgHeight,
      fit: fit,
      cache: true,
      timeRetry: const Duration(milliseconds: 500),
      clearMemoryCacheWhenDispose: true,
      cacheWidth: cacheWidth,
      enableLoadState: false,
      alignment: alignmentImage ??
          Alignment(
            (offset >= -1 && offset <= 1)
                ? offset
                : (offset > 0)
                ? 1.0
                : -1.0,
            0.0,
          ),
      loadStateChanged: (ExtendedImageState state) {
        Widget? widget;
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            widget = hidePlaceHolder
                ? const SizedBox()
                : Container(
              width: imgWidth,
              height: imgHeight,
              color: Colors.grey[300],
            );
            break;
          case LoadState.completed:
            return state.completedWidget;
          case LoadState.failed:
            widget = Container(
              width: imgWidth,
              height: imgHeight,
              color: Colors.black12,
              child: const Icon(Icons.broken_image),
            );
            break;
        }
        return widget;
      },
    );

    if (forceWhiteBackground && url!.toLowerCase().endsWith('.png')) {
      return Container(
        color: Colors.white,
        child: image,
      );
    }

    return image;
  }
}
