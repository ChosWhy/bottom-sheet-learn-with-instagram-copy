import 'package:bottomsheetexample/core/custom_divider.dart';
import 'package:flutter/material.dart';

mixin MainBottomSheet {
  Future<T?> showCustomMainBottomSheet<T>(
      {required BuildContext context, Widget? child}) async {
    return showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: const Color(0xff121212),
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      builder: (context) {
        return _CustomMainBottomSheet(
          child: child,
        );
      },
    );
  }
}

class _CustomMainBottomSheet extends StatelessWidget {
  const _CustomMainBottomSheet({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _BaseSheetHeaderComponent(),
        Expanded(
          child: child ?? const SizedBox.shrink(),
        )
      ],
    );
  }
}

class _BaseSheetHeaderComponent extends StatelessWidget {
  const _BaseSheetHeaderComponent();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                  child: const Icon(
                Icons.arrow_back,
                    color: Colors.white,
              )),
              onTap: () {
                Navigator.of(context).pop<bool>(true);
              }),
          Expanded(
            child: CustomDivider(
              dividerHeight: 5,
              indent: MediaQuery.of(context).size.width * 0.35,
              endIndent: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5 / 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
