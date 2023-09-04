import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core_ui.dart';
import '../../resources.dart';

class AccountProfile extends StatelessWidget {
  const AccountProfile({
    super.key,
    this.profileFile,
    this.profileUrl = '',
    this.onTap,
    this.radius = 38,
    this.isUser = false,
    this.isStore = false,
    this.backgroundColor,
    this.icon,
  });

  final String profileUrl;
  final File? profileFile;
  final void Function()? onTap;
  final bool isUser;
  final double radius;
  final bool isStore;
  final Color? backgroundColor;
  final Widget? icon;

  String getImageAsset() {
    return Images.icUser;
  }

  Widget getStackIcon(BuildContext context) {
    if (onTap != null) {
      return Positioned(
        bottom: 0,
        right: 0,
        child: CircleAvatar(
          radius: 11,
          backgroundColor: Colors.white,
          child: icon ??
              Icon(
                CupertinoIcons.camera_circle_fill,
                color: context.appTheme.primaryColor,
                size: 20,
              ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          CircleAvatar(
            radius: radius,
            backgroundColor:
                backgroundColor ?? context.appTheme.primaryBackgroundColor,
            backgroundImage: getBackgroundImage(),
            child: (profileFile == null && profileUrl.isEmpty)
                ? Image.asset(
                    getImageAsset(),
                    height: radius,
                    package: 'core_ui',
                  )
                : null,
          ),
          getStackIcon(context)
        ],
      ),
    );
  }

  ImageProvider? getBackgroundImage() {
    if (profileUrl.isNotEmpty) {
      return CachedNetworkImageProvider(profileUrl);
    } else if (profileFile != null) {
      return FileImage(profileFile!);
    } else {
      return null;
    }
  }
}
