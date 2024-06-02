import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../images/network_image_provider.dart';

enum AvatarSize {
  small,
  medium,
  large,
  extraLarge,
}

const _avatarSizes = {
  AvatarSize.small: 38.0,
  AvatarSize.medium: 48.0,
  AvatarSize.large: 56.0,
  AvatarSize.extraLarge: 76.0,
};

class Avatar extends StatelessWidget {
  const Avatar._({
    required this.placeholder,
    required this.imageProvider,
    required this.size,
    this.onTap,
    this.badge,
    this.border,
    this.shape,
    this.customSize,
  });

  final AvatarSize size;
  final ImageProvider? imageProvider;
  final AssetImage placeholder;
  final VoidCallback? onTap;
  final Widget? badge;
  final BoxBorder? border;
  final BoxShape? shape;
  final Size? customSize;

  static Widget network(
    String? url, {
    required AssetImage placeholder,
    AvatarSize? size,
    VoidCallback? onTap,
    Widget? badge,
    BoxBorder? border,
    BoxShape? shape,
    Size? customSize,
  }) {
    return Builder(builder: (context) {
      final configs = NetworkImageProvider.of(context);
      return FutureBuilder(
        future: configs.headers(),
        builder: (context, snapshot) {
          CachedNetworkImageProvider? provider;
          if (snapshot.hasData && url != null) {
            final imageUrl = '${configs.baseUrl}/$url';
            provider = CachedNetworkImageProvider(
              imageUrl,
              headers: snapshot.requireData,
              maxWidth: 80,
              maxHeight: 80,
              cacheKey: imageUrl,
            );
          }
          return Avatar._(
            size: size ?? AvatarSize.medium,
            imageProvider: provider,
            placeholder: placeholder,
            onTap: onTap,
            badge: badge,
            border: border,
            shape: shape,
            customSize: customSize,
          );
        },
      );
    });
  }

  factory Avatar.file(
    File? file, {
    required AssetImage placeholder,
    AvatarSize? size,
    VoidCallback? onTap,
    Widget? badge,
    BoxBorder? border,
    BoxShape? shape,
  }) {
    return Avatar._(
      size: size ?? AvatarSize.medium,
      imageProvider: file != null ? FileImage(file) : null,
      placeholder: placeholder,
      badge: badge,
      onTap: onTap,
      border: border,
      shape: shape,
    );
  }

  factory Avatar.asset({
    required AssetImage placeholder,
    AvatarSize? size,
    VoidCallback? onTap,
    Widget? badge,
    BoxBorder? border,
    BoxShape? shape,
  }) {
    return Avatar._(
      size: size ?? AvatarSize.medium,
      imageProvider: null,
      placeholder: placeholder,
      badge: badge,
      border: border,
    );
  }

  @override
  Widget build(BuildContext context) {
    final box = shape ?? BoxShape.circle;
    var avatarSizes = customSize?.height ?? _avatarSizes[size]!;
    final radius = box == BoxShape.circle ? avatarSizes / 2 : avatarSizes;
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: box,
              border: border,
            ),
            child: box == BoxShape.rectangle
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image(
                      image: imageProvider ?? placeholder,
                      fit: BoxFit.cover,
                      width: customSize?.height ?? radius,
                      height: customSize?.width ?? radius,
                    ),
                  )
                : CircleAvatar(
                    radius: radius,
                    foregroundImage: imageProvider,
                    backgroundColor: const Color(0xFFE3E3E3),
                    child: ClipOval(
                      child: Image(
                        image: placeholder,
                        fit: BoxFit.cover,
                        width: customSize?.height ?? radius,
                        height: customSize?.width ?? radius,
                      ),
                    ),
                  ),
          ),
          if (badge != null)
            Positioned(
              bottom: -1,
              right: -1,
              child: badge!,
            ),
        ],
      ),
    );
  }
}
