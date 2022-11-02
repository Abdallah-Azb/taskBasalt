import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_basalt/widgets/images/network_image/network_image_widget.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class MyNetworkImageFullScreen extends StatelessWidget {
  final String url;
  final bool? useBaseUrl;

  const MyNetworkImageFullScreen(this.url, {Key? key, this.useBaseUrl = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Hero(
            tag: 'imageHero',
            child: Stack(
              children: [
                PinchZoom(
                  resetDuration: const Duration(milliseconds: 400),
                  child: MyNetworkImageWidget(
                    url,
                    useBaseUrl: useBaseUrl,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                    top: 30,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _icon(
                            icon: Icons.arrow_back_ios_new,
                            onTap: () {
                              Get.back();
                            }),
                        _icon(icon: Icons.download, onTap: () {}),
                      ],
                    )),
              ],
            ),
          )),
    );
  }

  Widget _icon({required IconData icon, var onTap}) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Icon(icon),
    );
  }
}
