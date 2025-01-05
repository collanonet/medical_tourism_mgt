// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

// Project imports:
import '../../core_ui.dart';
import '../../resources.dart';

/// A circular profile avatar widget that can display an image from a URL, file, or default user icon.
///
/// This widget supports displaying profile images from different sources:
/// - Network image via URL
/// - Local file image
/// - Default user icon when no image is provided
///
/// It also supports an optional camera icon overlay for photo selection functionality.
///
/// Example usage:
/// ```dart
/// AccountProfile(
///   profileUrl: 'https://example.com/profile.jpg',
///   radius: 40,
///   onTap: () => handleProfileTap(),
/// )
/// ```
class AccountProfile extends StatelessWidget {
  /// Creates an account profile avatar.
  ///
  /// Either [profileUrl] or [profileFile] can be provided to display a profile image.
  /// If neither is provided, a default user icon will be shown.
  const AccountProfile({
    super.key,
    this.profileFile,
    this.profileUrl = '',
    this.onTap,
    this.radius = 38,
    this.backgroundColor,
    this.icon,
  });

  /// The URL of the profile image to be displayed.
  final String profileUrl;

  /// A local file containing the profile image.
  final File? profileFile;

  /// Callback function when the profile avatar is tapped.
  final void Function()? onTap;

  /// The radius of the circular avatar.
  /// Defaults to 38.
  final double radius;

  /// Background color of the avatar when no image is present.
  /// If null, uses the primary background color from the theme.
  final Color? backgroundColor;

  /// Custom icon widget to display instead of the default camera icon.
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
