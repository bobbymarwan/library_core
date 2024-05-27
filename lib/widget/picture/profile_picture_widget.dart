import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePictureWidget extends StatelessWidget {
  final XFile? xFile;
  final String? mediaPath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String avatarAssets;
  final Decoration? decoration;

  const ProfilePictureWidget(
      {super.key,
        required this.avatarAssets,
      this.fit,
      this.xFile,
      this.mediaPath,
      this.width,
      this.height,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    if (xFile != null) {
      return Container(
        decoration: decoration ?? BoxDecoration(shape: BoxShape.circle),
        child: ClipOval(
          child: Image.network(
            xFile?.path ?? '',
            width: width ?? 60,
            height: height ?? 60,
            fit: fit ?? BoxFit.cover,
          ),
        ),
      );
    } else if (mediaPath != null) {
      return ClipOval(
        child: CachedNetworkImage(
          imageUrl: mediaPath ?? '',
          width: width ?? 60,
          height: height ?? 60,
          fit: fit ?? BoxFit.cover,
        ),
      );
    }
    return Container(
        decoration: decoration ?? BoxDecoration(shape: BoxShape.circle),
        child: SvgPicture.asset(
          avatarAssets,
          width: width ?? 60,
          height: height ?? 60,
          fit: BoxFit.cover,
        ));
  }
}
