import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:livesscore/core/constants/app_colors.dart';

import 'package:shimmer/shimmer.dart';

class CircleWidget extends StatelessWidget {
  Widget child;
  double? width;
  double? height;
  Color? background;
  CircleWidget(
      {super.key,
      required this.child,
      this.width,
      this.height,
      this.background});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32), color: background),
      child: child,
    );
  }
}

// ignore: must_be_immutable
class ImageLoader extends StatelessWidget {
  ImageLoader(
      {this.width,
      this.height,
      this.elevation = .0,
      this.curve = 20,
      this.path,
      this.file,
      this.color,
      this.dColor,
      this.border,
      this.borderColor,
      this.radius = 16,
      this.borderWidth = .0,
      this.isOnline = false,
      this.isCircular = false,
      this.isCurvedEdge = false,
      this.showInitialTextAbovePicture = false,
      this.onTap,
      this.blob,
      this.fit = BoxFit.contain,
      Key? key})
      : super(key: key);

  double? elevation;
  double? width;
  double? height;
  double? borderWidth;
  double? radius;
  double? curve;
  String? path;
  File? file;
  Uint8List? blob;
  Color? color;
  Color? dColor;
  Color? borderColor;
  bool? isOnline;
  Function()? onTap;
  BoxFit fit;
  bool isCircular;
  bool isCurvedEdge;
  bool showInitialTextAbovePicture;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    if (blob != null) {
      if (isCircular) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(height! / 2),
          child: Image.memory(
            blob!,
            width: width,
            height: height,
            fit: fit,
          ),
        );
      } else if (isCurvedEdge) {
        return Container(
          decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.circular(radius ?? 0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius ?? 0),
            child: Image.memory(
              blob!,
              width: width,
              height: height,
              fit: fit,
            ),
          ),
        );
      } else {
        return Image.memory(
          blob!,
          width: width,
          height: height,
          fit: fit,
        );
      }
    }
    if (file != null) {
      if (isCurvedEdge) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: border,
              borderRadius: BorderRadius.circular(radius ?? 0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius ?? 0),
              child: Image.file(
                file!,
                width: width,
                height: height,
                fit: fit,
              ),
            ),
          ),
        );
      } else if (isCircular) {
        return GestureDetector(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(height! / 2),
            child: Image.file(
              file!,
              width: width,
              height: height,
              fit: fit,
            ),
          ),
        );
      } else {
        return GestureDetector(
          onTap: onTap,
          child: Image.file(
            file!,
            width: width,
            height: height,
            fit: fit,
          ),
        );
      }
    } else if (path == null || path!.isEmpty) {
      return /*isCircular
          ? GestureDetector(
              onTap: onTap,
              child: CircularProfileAvatar(AppAssets.noImage,
                  radius: radius!,
                  backgroundColor: Pallet.colorPrimaryLight,
                  borderWidth: borderWidth!,
                  initialsText: Text(
                    "",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  borderColor:
                      borderColor != null ? borderColor! : Colors.transparent,
                  elevation: elevation!,
                  foregroundColor: Colors.brown.withOpacity(0.5),
                  onTap: onTap,
                  showInitialTextAbovePicture: showInitialTextAbovePicture),
            )
          : */
          GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius ?? 16),
          child: const Icon(Icons.image_not_supported_outlined),
        ),
      );
    } else if (path!.contains("http")) {
      if (isCurvedEdge) {
        return GestureDetector(
          onTap: onTap,
          child: CachedNetworkImage(
              width: width ?? 1.sw,
              height: height ?? 1.sh,
              fit: fit,
              imageUrl: path!,
              imageBuilder: (context, imageProvider) => Container(
                    width: width ?? 1.sw,
                    height: height ?? 1.sh,
                    decoration: BoxDecoration(
                      border: border ?? const Border(),
                      borderRadius: BorderRadius.circular(radius!),
                      image: DecorationImage(image: imageProvider, fit: fit),
                    ),
                  ),
              fadeInDuration: const Duration(seconds: 1),
              placeholderFadeInDuration: const Duration(seconds: 1),
              progressIndicatorBuilder: (ctx, value, progress) =>
                  Shimmer.fromColors(
                    baseColor: Pallet.greyColor.shade100,
                    highlightColor: Pallet.border,
                    child: Container(
                      width: width ?? 1.sw,
                      height: height ?? 1.sh,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius ?? 0)),
                    ),
                  ),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.image_not_supported_outlined)),
        );
      }
      return GestureDetector(
        onTap: onTap,
        child: CachedNetworkImage(
          width: width ?? 1.sw,
          height: height ?? 1.sh,
          fit: fit,
          imageUrl: path!,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              border: border ?? const Border(),
              image: DecorationImage(image: imageProvider, fit: fit),
            ),
          ),
          fadeInDuration: const Duration(seconds: 1),
          placeholderFadeInDuration: const Duration(seconds: 1),
          progressIndicatorBuilder: (ctx, value, progress) =>
              Shimmer.fromColors(
            baseColor: Pallet.greyColor.shade100,
            highlightColor: Pallet.border,
            child: Container(
              width: width ?? 1.sw,
              height: height ?? 1.sh,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius ?? 0)),
            ),
          ),
          errorWidget: (context, url, error) =>
              const Icon(Icons.image_not_supported_outlined),
        ),
      );
    } else {
      return SizedBox(
        width: width,
        height: height,
        child: GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: color ?? Colors.transparent,
            child: path!.contains(".svg")
                ? SvgPicture.asset(
                    path!,
                    width: width,
                    height: height,
                    color: dColor,
                    fit: fit,
                  )
                : isCircular
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          path!,
                          width: width,
                          height: height,
                          fit: fit,
                        ),
                      )
                    : isCurvedEdge
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(radius ?? 8.r),
                            child: Image.asset(
                              path!,
                              width: width,
                              height: height,
                              fit: fit,
                            ),
                          )
                        : Container(
                            width: width,
                            height: height,
                            color: color,
                            child: Image.asset(
                              path!,
                              width: width,
                              height: height,
                              fit: fit,
                              //color: color,
                            ),
                          ),
          ),
        ),
      );
    }
  }
}
