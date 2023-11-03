import 'package:ecommerce/pages/models.dart';
import 'package:ecommerce/widgets/place_holders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    this.onLike,
    this.onCard,
    this.onButton,
  }) : super(key: key);
  final Product product;
  final bool isFavourite;
  final VoidCallback? onLike;
  final VoidCallback? onCard;
  final VoidCallback? onButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, right: 30.0),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        minWidth: 0,
        onPressed: onCard,
        elevation: 6,
        color: Colors.white,
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
                    imagePath: product.images.first,
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          product.name,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.blueGrey
                          ),
                        ),
                      ),
                      const Icon(Icons.stars_outlined, color: Colors.blueGrey),
                    ],
                  ),
                  const SizedBox(height: 6.0),
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
                      child: Text(product.price, style: const TextStyle(color: Colors.blueGrey),),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        '${product.qty} more pcs left in store.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.blueGrey
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: onButton,
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
            MaterialButton(
              color: Colors.blueGrey.shade300.withOpacity(.4),
              padding: const EdgeInsets.all(10),
              minWidth: 0.0,
              elevation: 0.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0)
                )
              ),
              onPressed: onLike,
              child: isFavourite ? const Icon(CupertinoIcons.heart_fill) : const Icon(CupertinoIcons.heart),
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
          imagePath: product.images.first,
        ),
      ),
    );
  }
}

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key? key,
    required this.product,
    this.onPressed,
    this.onButton,
  }) : super(key: key);
  final Product product;
  final VoidCallback? onPressed;
  final VoidCallback? onButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: MaterialButton(
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
                  width: 150,
                  child: Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: ImageLoader(
                      height: 180,
                      width: double.infinity,
                      imagePath: product.images.first,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        product.name,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          letterSpacing: .8,
                          fontSize: 16,
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                      const Wrap(
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
                              product.price,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: onButton,
                        style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(
                            Color.fromRGBO(22, 37, 51, 1)
                          ),
                          foregroundColor: const MaterialStatePropertyAll(
                            Colors.white
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
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FavCard extends StatelessWidget {
  const FavCard({
    Key? key,
    required this.product,
    this.onPressed,
    this.onDislike,
  }) : super(key: key);
  final Product product;
  final VoidCallback? onPressed;
  final VoidCallback? onDislike;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        clipBehavior: Clip.hardEdge,
        textColor: Colors.blueGrey,
        color: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            SizedBox(
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
                        child: ImageLoader(
                          height: 180,
                          width: double.infinity,
                          imagePath: product.images.first,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              product.name,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                letterSpacing: .8,
                                fontSize: 16,
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w800
                              ),
                            ),
                            const Wrap(
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
                                    product.price,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),
            MaterialButton(
              color: Colors.blueGrey.shade300.withOpacity(.4),
              padding: const EdgeInsets.all(10),
              minWidth: 0.0,
              elevation: 0.0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0)
                  )
              ),
              onPressed: onDislike,
              child: const Icon(CupertinoIcons.heart_fill),
            )
          ],
        ),
      ),
    );
  }
}

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.product,
    this.onPressed,
    this.onAddCart,
    this.onRemoveCart,
  }) : super(key: key);
  final Product product;
  final VoidCallback? onPressed;
  final VoidCallback? onAddCart;
  final VoidCallback? onRemoveCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        clipBehavior: Clip.hardEdge,
        textColor: Colors.blueGrey,
        color: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)
        ),
        child: SizedBox(
          height: 180,
          child: Row(
            children: <Widget>[
              Expanded(
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
                          child: ImageLoader(
                            height: 180,
                            width: double.infinity,
                            imagePath: product.images.first,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                product.name,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  letterSpacing: .8,
                                  fontSize: 16,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w800
                                ),
                              ),
                              const Wrap(
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
                                      product.price,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: onRemoveCart,
                    style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(
                        EdgeInsets.all(8.0)
                      ),
                      minimumSize: const MaterialStatePropertyAll(
                        Size.zero
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        )
                      ),
                      backgroundColor: const MaterialStatePropertyAll(
                          Colors.white
                      ),
                      foregroundColor: const MaterialStatePropertyAll(
                          Color.fromRGBO(22, 37, 51, 1)
                      )
                    ),
                    child: const Icon(CupertinoIcons.minus, size: 16),
                  ),
                  Text(product.count??'az'),
                  ElevatedButton(
                    onPressed: onAddCart,
                    style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(
                        EdgeInsets.all(8.0)
                      ),
                      minimumSize: const MaterialStatePropertyAll(
                        Size.zero
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        )
                      ),
                      backgroundColor: const MaterialStatePropertyAll(
                        Color.fromRGBO(22, 37, 51, 1)
                      )
                    ),
                    child: const Icon(CupertinoIcons.plus, size: 16),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}