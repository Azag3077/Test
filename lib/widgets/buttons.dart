import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/pages/models.dart';
import 'package:ecommerce/widgets/place_holders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NavButton extends StatelessWidget {
  const NavButton({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle
        ),
        child: icon
      ),
    );
  }
}

class ProductButton extends StatelessWidget {
  const ProductButton({
    Key? key,
    required this.product,
    required this.isCurrent,
    this.onPressed,
  }) : super(key: key);
  final String product;
  final bool isCurrent;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(
          isCurrent ? Colors.blueGrey.shade50 : Colors.blueGrey.shade600
        ),
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            fontSize: 18.0,
            fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal
          )
        )
      ),
      child: Text(product),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.isFavourite,
    this.onPressed,
  }) : super(key: key);
  final Product product;
  final bool isFavourite;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, right: 30.0),
      child: Card(
        elevation: 6,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ImageLoader(
                    height: 180,
                    width: double.infinity,
                    imageUrl: product.images.first,
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Icon(CupertinoIcons.car_detailed, color: Colors.blueGrey),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Card(
                    elevation: 4.0,
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(
                        color: Colors.grey
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 4.0),
                      child: Text(product.price),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        product.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.blueGrey
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => {},
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
                ],
              ),
            ),
            GestureDetector(
              onTap: onPressed,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade300.withOpacity(.4),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30.0)
                  )
                ),
                child: isFavourite ? const Icon(CupertinoIcons.heart_fill) : const Icon(CupertinoIcons.heart),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class TrendingProductCard extends StatelessWidget {
  const TrendingProductCard({
    Key? key,
    required this.product,
    this.onPressed,
  }) : super(key: key);
  final Product product;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: onPressed,
        child: ImageLoader(
          width: 100,
          height: 85,
          imageUrl: product.images.first,
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.order,
    this.status,
    this.onPressed,
  }) : super(key: key);
  final Product order;
  final String? status;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      clipBehavior: Clip.hardEdge,
      textColor: Colors.blueGrey,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)
      ),
      child: SizedBox(
        height: 130,
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: double.infinity,
                width: 180,
                child: Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: CachedNetworkImage(
                    imageUrl: order.images.first,
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
                    errorWidget: (context, url, error) => Image.asset('images/${order.images.first}'),
                    // errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        order.name,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            letterSpacing: .8,
                            fontSize: 16,
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                      Wrap(
                        children: <Widget>[
                          // DotLabel(label: order.year, first: true),
                          // DotLabel(label: order.condition),
                          // DotLabel(label: order.transmission),
                          // DotLabel(label: order.fuelType),
                          // DotLabel(label: order.driveType.split(' ').last.substring(1, 4)),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      const Spacer(),
                      Row(
                        children: <Widget>[
                          Text(
                            'Price:',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: Colors.black54
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Flexible(
                            child: Text(
                              order.price,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (status != null) Row(
                        children: <Widget>[
                          Text(
                            'Status:',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: Colors.black54
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Flexible(
                            child: Text(
                              status!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}