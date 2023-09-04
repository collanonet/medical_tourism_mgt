import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../extensions/context_exts.dart';

class BannerInfo extends StatelessWidget {
  const BannerInfo({
    super.key,
    required this.title,
    this.message,
    this.imageUrl,
    this.trailing,
  });

  final String title;
  final String? message;
  final String? imageUrl;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFFFF4D7),
            Colors.white,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.screenSize.width * 0.6,
                child: Text(
                  title,
                  style: context.textTheme.labelMedium,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              if (message != null)
                Text(
                  message!,
                  style: context.theme.textTheme.labelMedium,
                ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: trailing ??
                CachedNetworkImage(
                  imageUrl: imageUrl!,
                  width: 48,
                  height: 48,
                  placeholder: (context, url) => const CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 150,
                  ),
                  imageBuilder: (context, image) => CircleAvatar(
                    backgroundImage: image,
                    radius: 150,
                  ),
                ),
          )
        ],
      ),
    );
  }
}
