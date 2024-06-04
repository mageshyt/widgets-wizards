import 'dart:io';
import 'dart:typed_data'; // Import necessary for Uint8List

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:widgets_wigets/common/sizes.dart';

enum AvatarSizes { sm, md, lg }

enum AvatarPathType { asset, network, memory, file }

class Avatar extends StatelessWidget {
  final String path;
  final AvatarSizes size;
  final AvatarPathType pathType;
  final String? fallback;

  const Avatar({
    Key? key,
    required this.path,
    required this.pathType,
    this.size = AvatarSizes.md,
    this.fallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double avatarsize;
    switch (size) {
      case AvatarSizes.sm:
        avatarsize =
            Sizes.avatarSm; // Adjust the size according to your requirements
        break;
      case AvatarSizes.md:
        avatarsize =
            Sizes.avatarMd; // Adjust the size according to your requirements
        break;
      case AvatarSizes.lg:
        avatarsize =
            Sizes.avatarLg; // Adjust the size according to your requirements
        break;
    }

    return path.isEmpty && fallback!.isNotEmpty
        ? CircleAvatar(
            backgroundColor: Colors.grey[900],
            radius: avatarsize,
            child: Text(
              fallback!.substring(0, 2).toUpperCase(),
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 16,
              ),
            ),
          )
        : _buildAvatar(path, pathType, avatarsize);
  }

  _buildAvatar(String path, AvatarPathType pathType, double avatarsize) {
    switch (pathType) {
      case AvatarPathType.asset:
        return CircleAvatar(
          radius: avatarsize,
          backgroundImage: AssetImage(
            path,
          ),
        );
      case AvatarPathType.network:
        return CircleAvatar(
          radius: avatarsize,
          backgroundImage: CachedNetworkImageProvider(
            path,
          ),
        );
      case AvatarPathType.memory:
        return CircleAvatar(
          radius: avatarsize,
          backgroundImage:
              MemoryImage(Uint8List.fromList(File(path).readAsBytesSync())),
        );
      case AvatarPathType.file:
        return CircleAvatar(
          radius: avatarsize,
          backgroundImage: FileImage(File(path)),
        );
    }
  }
}
