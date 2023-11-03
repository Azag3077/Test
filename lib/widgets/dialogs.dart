import 'package:flutter/material.dart';

class RemoveFromCartDialog extends StatelessWidget {
  const RemoveFromCartDialog({
    Key? key,
    this.onRemove,
  }) : super(key: key);
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Remove item from cart'),
      content: const Text('This item will be removed from your cart and may have sold off to another customer the next time you come back.'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('No, keep item'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            onRemove?.call();
          },
          child: const Text('Remove'),
        )
      ],
    );
  }
}
