import 'package:bottomsheetexample/const/project_colors.dart';
import 'package:bottomsheetexample/const/project_icons.dart';
import 'package:bottomsheetexample/const/project_padding.dart';
import 'package:bottomsheetexample/extension/text_theme.dart';
import 'package:flutter/material.dart';
import '../../models/bottom_sheet_comment_card_model.dart';
import 'circular_avatar.dart';

class BottomSheetCommentCard extends StatefulWidget {
  const BottomSheetCommentCard(
      {super.key, required this.index, required this.model});

  final int index;
  final BottomSheetCommentCardModel model;

  @override
  State<BottomSheetCommentCard> createState() => _BottomSheetCommentCardState();
}

class _BottomSheetCommentCardState extends State<BottomSheetCommentCard>
    with _BottomSheetCommentCardUtility {
  @override
  void initState() {
    super.initState();
    _model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: customGeneralPadding,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomCircularAvatar(image: _model.imageUrl),
        const SizedBox(
          width: 12,
        ),
        _body(context: context),
        _commentCardIconButton(context),
      ]),
    );
  }

  Expanded _body({required BuildContext context, Widget? child}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(_model.name,
                  style: context.getTextThemeWithContext(context).titleSmall),
              Text(
                _model.time,
                style: context
                    .getTextThemeWithContext(context)
                    .titleSmall
                    ?.copyWith(color: _projectColors.grey),
              )
            ],
          ),
          Padding(
            padding: ProjectPaddings.smallTopPadding,
            child: Text(
              _model.comment,
              style: context
                  .getTextThemeWithContext(context)
                  .titleSmall
                  ?.copyWith(
                      color: _projectColors.grey,
                      overflow: TextOverflow.ellipsis),
              maxLines: 100,
            ),
          ),
          Padding(
            padding: ProjectPaddings.smallTopPadding,
            child: InkWell(
              onTap: () {},
              child: Text(
                yanitla,
                style: context
                    .getTextThemeWithContext(context)
                    .titleSmall
                    ?.copyWith(color: _projectColors.grey),
              ),
            ),
          ),
          //Alt alta yorumlar!
        ],
      ),
    );
  }

  Column _commentCardIconButton(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: xLargeBorderRadius,
          onTap: () {},
          child: SizedBox(
            width: commentCardIconSize,
            height: commentCardIconSize,
            child: Icon(
              ProjectIconDatas.getIconPaths(iconPaths: IconPaths.favorite_border_rounded),
              color: _projectColors.grey,
            ),
          ),
        ),
        Text(
          _model.likeCount == null ? "" : _model.likeCount.toString(),
          style: context
              .getTextThemeWithContext(context)
              .titleSmall
              ?.copyWith(color: _projectColors.grey),
        ),
      ],
    );
  }
}

mixin _BottomSheetCommentCardUtility {
  final ProjectColors _projectColors = ProjectColors();
  final EdgeInsets customGeneralPadding =
      const EdgeInsets.only(top: 10.0, left: 18, right: 12);
  final String yanitla = "Yanıtla";
  final BorderRadius xLargeBorderRadius = BorderRadius.circular(25);
  final double commentCardIconSize = 45;
  late final BottomSheetCommentCardModel _model;
}
