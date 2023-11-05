import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageLoader extends StatelessWidget {
  const ImageLoader({
    Key? key,
    required this.imagePath,
    this.height,
    this.width,
    this.decoration,
  }) : super(key: key);
  final String imagePath;
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
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
      )
      // child: CachedNetworkImage(
      //   imageUrl: imagePath,
      //   height: height,
      //   width: width,
      //   placeholder: (context, url) => Shimmer.fromColors(
      //     baseColor: Colors.grey.shade300,
      //     highlightColor: Colors.grey.shade100,
      //     enabled: true,
      //     child: SizedBox.expand(
      //       child: Container(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(12.0),
      //           color: Colors.white,
      //         ),
      //       ),
      //     ),
      //   ),
      //   errorWidget: (context, url, error) => Image.asset(imagePath),
      // ),
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

class ProductLoadingCard extends StatefulWidget {
  const ProductLoadingCard({Key? key}) : super(key: key);

  @override
  State<ProductLoadingCard> createState() => _ProductLoadingCardState();
}

class _ProductLoadingCardState extends State<ProductLoadingCard> {
  final PageController pageLoadingController = PageController(initialPage: 1, viewportFraction: .6);

  @override
  void dispose() {
    pageLoadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      controller: pageLoadingController,
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, int index) => Padding(
        padding: const EdgeInsets.only(bottom: 10.0, right: 30.0),
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 3,
          color: Colors.grey.shade50,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DataLoader(
                  height: 180,
                  width: double.infinity,
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: DataLoader(
                          height: 25,
                        ),
                      ),
                    ),
                    DataLoader(
                      height: 30,
                      width: 30,
                    ),
                  ],
                ),
                SizedBox(height: 6.0),
                Spacer(),
                DataLoader(
                  height: 32,
                  width: double.infinity,
                ),
                SizedBox(height: 12.0),
              ],
            ),
          ),
        ),
      )
    );
  }
}

class ProductLoadingCard2 extends StatelessWidget {
  const ProductLoadingCard2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 10,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 16.0, // Spacing between columns
          mainAxisSpacing: 16.0, // Spacing between rows
          childAspectRatio: .8
        ),
        itemBuilder: (_, int index) {
          return Card(
            elevation: .2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: DataLoader(
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: DataLoader(
                          height: 25.0,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      DataLoader(
                        width: 30,
                        height: 30,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
