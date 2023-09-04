import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../resources.dart';
import '../../theme.dart';

class ProfileTransaction extends StatelessWidget {
  const ProfileTransaction({
    super.key,
    this.color,
    required this.transactionStatus,
    required this.name,
    this.profileUrl,
    this.radius = 24.0,
  });

  final Color? color;
  final String? profileUrl;
  final String name;
  final String transactionStatus;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: AppTheme.of(context).primaryColor,
          backgroundImage: profileUrl == null
              ? null
              : CachedNetworkImageProvider(
                  profileUrl!,
                ),
          child: profileUrl != null
              ? null
              : Text(
                  name.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: CircleAvatar(
            radius: 9.0,
            backgroundColor: Colors.white,
            child: transactionStatus == 'received'
                ? Transform.rotate(
                    angle: -45 * (math.pi / 180),
                    child: Icon(
                      Icons.arrow_circle_left_rounded,
                      color: color ?? AppTheme.of(context).successColor,
                      size: 15.0,
                    ),
                  )
                : CircleAvatar(
                    radius: 7.5,
                    backgroundColor: color ??
                        (transactionStatus == 'tipped'
                            ? AppTheme.of(context).darkGreyCircleColor
                            : AppTheme.of(context).errorColor),
                    child: transactionStatus == 'tipped'
                        ? Icon(
                            AppIcons.tipped,
                            color: Colors.white,
                          )
                        : Icon(
                            CupertinoIcons.refresh_thin,
                            color: Colors.white,
                            size: AppTheme.of(context).iconSize.iconSizeExtraSmall,
                          ),
                  ),
          ),
        ),
      ],
    );
  }
}
