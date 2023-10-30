import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageLoader extends StatelessWidget {
  const ImageLoader({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.decoration,
  }) : super(key: key);
  final String imageUrl;
  final double? height;
  final double? width;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: decoration ?? BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20)
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: SizedBox.expand(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Image.asset('images/$imageUrl'),
        // errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}

class DataLoader extends StatelessWidget {
  const DataLoader({
    Key? key,
    this.radius = 12.0,
    this.height,
    this.width,
    this.margin,
  }) : super(key: key);
  final double radius;
  final double? height;
  final double? width;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: SizedBox(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingPlaceHolder extends StatelessWidget {
  const LoadingPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: List.generate(6, (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: SizedBox(
            height: 130,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DataLoader(
                  height: 130,
                  width: MediaQuery.of(context).size.width/2,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const DataLoader(
                        height: 20.0,
                        margin: EdgeInsets.only(top: 5.0),
                      ),
                      const DataLoader(
                          height: 10.0,
                          margin: EdgeInsets.only(right: 30.0, top: 5.0)
                      ),
                      const DataLoader(
                          height: 10.0,
                          margin: EdgeInsets.only(right: 45.0, top: 5.0)
                      ),
                      const Spacer(),
                      Row(
                        children: const <Widget>[
                          Expanded(
                            child: DataLoader(
                              height: 30,
                              margin: EdgeInsets.only(bottom: 5.0),
                            ),
                          ),
                          // DataLoader(),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
