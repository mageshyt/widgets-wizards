import 'dart:io';
import 'dart:typed_data'; // Import necessary for Uint8List

import 'package:flutter/material.dart';
import 'package:widgets_wigets/common/sizes.dart';

enum AvatarSizes { sm, md, lg }

enum AvatarPathType { asset, network, memory, file }

class CustomAvatar extends StatelessWidget {
  final String path;
  final AvatarSizes size;
  final AvatarPathType pathType;

  const CustomAvatar({
    Key? key,
    required this.path,
    required this.pathType,
    this.size = AvatarSizes.md,
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

    Widget avatar;
    switch (pathType) {
      case AvatarPathType.asset:
        avatar = CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 206, 205, 205),
          radius: avatarsize,
          backgroundImage: AssetImage(path),
        );
        break;
      case AvatarPathType.network:
        avatar = CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: avatarsize,
          backgroundImage: NetworkImage(path),
        );
        break;
      case AvatarPathType.memory:
        // For memory path, path should be Uint8List representing image data
        // Example: Uint8List bytes = await someFunctionToLoadImageAsBytes();
        // Then pass 'bytes' to the path parameter
        avatar = CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: avatarsize,
          backgroundImage: MemoryImage(Uint8List.fromList(path.codeUnits)),
        );
        break;
      case AvatarPathType.file:
        avatar = CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: avatarsize,
          backgroundImage: FileImage(File(path)),
        );
        break;
    }

    return avatar;
  }
}
