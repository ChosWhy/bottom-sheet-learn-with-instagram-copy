import 'package:bottomsheetexample/const/project_colors.dart';
import 'package:bottomsheetexample/const/project_icons.dart';
import 'package:bottomsheetexample/core/custom_divider.dart';
import 'package:bottomsheetexample/extension/size_extension.dart';
import 'package:flutter/material.dart';

mixin MainBottomSheet {
  Future<T?> showCustomMainBottomSheet<T>(
      {required BuildContext context, Widget? child}) async {
    const Color darkToneInk = Color(0xff121212);
    const BorderRadius generalModalBottomSheetBorderRadius =
        BorderRadius.vertical(top: Radius.circular(12));
    return showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: darkToneInk,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: generalModalBottomSheetBorderRadius),
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
        _BaseSheetHeaderComponent(),
        Expanded(
          child: child ?? const SizedBox.shrink(),
        )
      ],
    );
  }
}

class _BaseSheetHeaderComponent extends StatelessWidget
    with _BaseSheetHeaderComponentUtility {
  _BaseSheetHeaderComponent();

  final ProjectColors _projectColors = ProjectColors();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: generalSize,
      child: Row(
        children: [
          InkWell(
              borderRadius: BorderRadius.circular(generalSize / 2),
              child: Container(
                  width: generalSize,
                  height: generalSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(generalSize / 2)),
                  child: Icon(
                    ProjectIconDatas.getIconPaths(iconPaths: IconPaths.arrow_back),
                    color: _projectColors.white,
                  )),
              onTap: () {
                Navigator.of(context).pop<bool>(true);
              }),
          Expanded(
            child: CustomDivider(
              dividerHeight: dividerDefaultHeight,
              indent: context.getWidthWithContext(context) * 0.35,
              endIndent: context.getWidthWithContext(context) * 0.45,
              decoration: BoxDecoration(
                color: _projectColors.grey,
                borderRadius: BorderRadius.circular(dividerDefaultHeight / 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

mixin _BaseSheetHeaderComponentUtility {
  final double generalSize = 40;
  final double dividerDefaultHeight = 5;
}
