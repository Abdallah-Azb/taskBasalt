import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_basalt/widgets/images/image_full_screen/image_full_screen.dart';

class MyNetworkImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxFit? boxFit;
  final bool? useBaseUrl;

  const MyNetworkImage(this.url, {Key? key, this.width, this.height, this.boxFit, this.useBaseUrl = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MyNetworkImageFullScreen(
            url,
            useBaseUrl: useBaseUrl,
          );
        }));
      },
      child: Hero(
        tag: 'imageHero',
        child:
            MyNetworkImageWidget(url, height: height, width: width, useBaseUrl: useBaseUrl, boxFit: boxFit),
      ),
    );
  }
}

class MyNetworkImageWidget extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxFit? boxFit;
  final bool? useBaseUrl;

  const MyNetworkImageWidget(this.url,
      {Key? key, this.width, this.height, this.boxFit, this.useBaseUrl = false})
      : super(key: key);

  final String _baseUrl = '';

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: useBaseUrl == true ? _baseUrl + url : url,
        height: height,
        width: width,
        fit: boxFit ?? BoxFit.cover,
        fadeOutDuration: const Duration(milliseconds: 1500),
        fadeInDuration: const Duration(milliseconds: 700),
        errorWidget: (context, url, error) {
          return const Icon(Icons.error);
        },
        //useOldImageOnUrlChange: true,
        placeholder: (context, url) => const CircularProgressIndicator(),
      ),
    );
  }
}
