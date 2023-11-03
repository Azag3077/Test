import 'dart:math';
import 'package:ecommerce/widgets/paints.dart';
import 'package:ecommerce/widgets/place_holders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models.dart';

final currentIndexStateProvider = StateProvider<int>((ref) => 0);

class DescriptionPage extends ConsumerWidget {
  const DescriptionPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = product.images;
    final imageUrls = images.sublist(0, min(3, images.length));
    final extra = images.length - imageUrls.length;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.grey.shade200,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        iconTheme: const IconThemeData(color: Colors.blueGrey),
        // title: const Text("Toyota corolla"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                CustomPaint(
                  foregroundPainter: PageViewIndicatorEllipse(
                    length: product.images.length,
                    activeIndex: ref.watch(currentIndexStateProvider),
                    activeColor: const Color.fromRGBO(22, 37, 51, 1),
                    inactiveColor: const Color.fromRGBO(22, 37, 51, 1).withOpacity(.25)
                  ),
                  child: PageView(
                    onPageChanged: (int index) => ref.read(currentIndexStateProvider.notifier).update((state) => index),
                    children: product.images.map((imagePath) => ImageLoader(imagePath: imagePath)).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Card(
                  elevation: 4,
                  color: Colors.grey.shade100,
                  margin: const EdgeInsets.only(top: 16.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const Expanded(
                          child: SingleChildScrollView(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              // children: <Widget>[
                              //   SpecChip(
                              //       name: "Transmission",
                              //       value: "Auto"
                              //   ),
                              //   SpecChip(
                              //       name: "Fuel Type",
                              //       value: "Electric"
                              //   ),
                              //   SpecChip(
                              //       name: "Drive Type",
                              //       value: "rear-wheel drive (RWD)"
                              //   ),
                              //   SpecChip(
                              //       name: "Negotiable",
                              //       value: "Yes"
                              //   ),
                              //   SpecChip(
                              //       name: "Built-in GPS",
                              //       value: "Yes"
                              //   ),
                              //   SpecChip(
                              //       name: "Rear Camera",
                              //       value: "Yes"
                              //   ),
                              //   SpecChip(
                              //       name: "Interior Color",
                              //       value: "Grey"
                              //   ),
                              //   SpecChip(
                              //       name: "Exterior Color",
                              //       value: "Off-White"
                              //   ),
                              //   SpecChip(
                              //       name: "Engine Size",
                              //       value: "3.0"
                              //   ),
                              //   SpecChip(
                              //       name: "Steering",
                              //       value: "Right"
                              //   ),
                              //   SpecChip(
                              //       name: "Wheel Cover",
                              //       value: "Alloy"
                              //   ),
                              //   SpecChip(
                              //       name: "Cylinders",
                              //       value: "12"
                              //   ),
                              //   SpecChip(
                              //       name: "Condition",
                              //       value: "Brand new"
                              //   ),
                              //   SpecChip(
                              //       name: "Year",
                              //       value: "2022"
                              //   ),
                              //   SpecChip(
                              //       name: 'VIN',
                              //       value: "19404231"
                              //   ),
                              //
                              //   SpecChip(
                              //       name: "Cylinders",
                              //       value: "12"
                              //   ),
                              //   SpecChip(
                              //       name: "Condition",
                              //       value: "Brand new"
                              //   ),
                              //   SpecChip(
                              //       name: "Year",
                              //       value: "2022"
                              //   ),
                              //   SpecChip(
                              //       name: 'VIN',
                              //       value: "19404231"
                              //   ),
                              // ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: imageUrls.asMap().entries.map((e) => SizedBox.square(
                      dimension: 44,
                      child: Card(
                        margin: const EdgeInsets.all(4.0),
                        color: Colors.grey.shade300,
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          fit: StackFit.expand,
                          children: <Widget>[
                            Center(
                              child: ImageLoader(imagePath: e.value),
                            ),
                            if (e.key == imageUrls.length - 1 && extra > 0) Container(
                              color: Colors.black.withOpacity(.4),
                              child: Center(
                                child: Text(
                                  '+$extra',
                                  style: TextStyle(
                                    color: Colors.blueGrey.shade50,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                    )).toList(),
                  ),
                )
              ],
            ),
          ),
          Card(
            elevation: 8.0,
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        Color.fromRGBO(22, 37, 51, 1)
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                        )
                      )
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Add to cart'),
                        SizedBox(width: 10.0),
                        Icon(CupertinoIcons.cart, size: 20.0,)
                      ],
                    ),
                  ),
                  Text(product.price)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}