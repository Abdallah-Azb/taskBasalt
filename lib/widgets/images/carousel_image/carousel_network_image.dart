import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:task_basalt/widgets/images/network_image/network_image_widget.dart';

class MyCarouselNetworkImages extends StatelessWidget {
  final List<String> imagesUrl;
  final double? height;
  final double? width;
  final BoxFit? boxFit;
  final bool? useBaseUrl;

  const MyCarouselNetworkImages(
      {Key? key, required this.imagesUrl, this.width, this.height, this.boxFit, this.useBaseUrl = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imagesUrl.isEmpty
        ? const SizedBox()
        : CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.5,
              enlargeCenterPage: true,
              height: height,
              disableCenter: true,
              padEnds: true,
            ),
            items: List.generate(
              imagesUrl.length,
              (index) => MyNetworkImage(
                imagesUrl[index],
                width: width,
                height: height,
                useBaseUrl: useBaseUrl,
                boxFit: boxFit,
              ),
            ),
          );
  }
}
