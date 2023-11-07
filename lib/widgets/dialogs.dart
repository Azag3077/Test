import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';
import 'buttons.dart';

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
      content: const Text('This item will be removed from your cart and could get sold off to another customer the next time you come back.'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          style: const ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(
              Color.fromRGBO(22, 37, 51, 1)
            )
          ),
          child: const Text('No, keep item'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            onRemove?.call();
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Color.fromRGBO(22, 37, 51, 1)
            )
          ),
          child: const Text('Remove'),
        )
      ],
    );
  }
}

class SortModalBottomSheetDialog extends ConsumerWidget {
  const SortModalBottomSheetDialog({
    Key? key,
    // required this.gender,
    this.onGenderSelection,
    this.onSizeSelection,
    this.onFilter,
  }) : super(key: key);
  // final String gender;
  final ValueChanged<String>? onGenderSelection;
  final ValueChanged<String>? onSizeSelection;
  final Function(String, String)? onFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gender = StateProvider.autoDispose<String>((ref) => ref.watch(genderStateProvider));
    final size = StateProvider.autoDispose<String>((ref) => ref.watch(sizeStateProvider));
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .8,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const Text(
                      'Filter',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        letterSpacing: 1.2
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      'Gender',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 1.2
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: genders.map((g) => FilterButton(
                        text: g,
                        isSelected: g == ref.watch(gender),
                        // onSelected: () {
                        //   print(g);
                        //   ref.read(gender.notifier).update((state) => g);
                        // },
                        onSelected: () => onGenderSelection?.call(g),
                      )).toList(),
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      'Size',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 1.2
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: sizes.map((g) => FilterButton(
                        text: g,
                        isSelected: g == ref.watch(sizeStateProvider),
                        onSelected: () => onSizeSelection?.call(g),
                      )).toList(),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                onFilter?.call(
                  ref.watch(gender),
                  ref.watch(size),
                );
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.all(13)
                ),
                backgroundColor: const MaterialStatePropertyAll(
                  Color.fromRGBO(22, 37, 51, 1)
                ),
                foregroundColor: const MaterialStatePropertyAll(
                  Colors.white
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  )
                ),
              ),
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text('Apply filter')
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}

