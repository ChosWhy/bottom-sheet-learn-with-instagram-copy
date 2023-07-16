import 'package:bottomsheetexample/const/project_colors.dart';
import 'package:bottomsheetexample/const/project_icons.dart';
import 'package:bottomsheetexample/const/project_padding.dart';
import 'package:bottomsheetexample/extension/text_theme.dart';
import 'package:bottomsheetexample/general_datas.dart';
import 'package:bottomsheetexample/models/bottom_sheet_comment_card_model.dart';
import 'package:bottomsheetexample/product/widgets/circular_avatar.dart';
import 'package:flutter/material.dart';
import '../../product/widgets/bottom_sheet_comment_card.dart';
part 'bottom_send_emoji_button.dart';
part 'bottom_comment_product_bottom_component.dart';

class CommentBottomSheet extends StatefulWidget {
  const CommentBottomSheet({Key? key, required this.commentCount}) : super(key: key);
  final int commentCount;
  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> with _CommentBottomSheetUtility {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _commentText(context),
        Divider(color: _projectColors.white, thickness: 1),
        _bottomSheetBodyPlace(),
        BottomSheetCommentProductBottomComponent(
          isTextFieldFocused: _isTextFieldFocused,
          commentCount: widget.commentCount,
        )
      ],
    );
  }

  Expanded _bottomSheetBodyPlace() {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: GeneralDatas.bottomSheetCommentCardDatas.length,
              itemBuilder: (context, index) {
                return BottomSheetCommentCard(index: index,model: GeneralDatas.bottomSheetCommentCardDatas[index],);
              },
            ),
          ),
          if (!_isTextFieldFocused) _bottomEmojiSendButton(),
        ],
      ),
    );
  }

  Text _commentText(BuildContext context) {
    return Text(
      _titleComment,
      style: context.getTextThemeWithContext(context).titleSmall,
    );
  }

  Padding _bottomEmojiSendButton() {
    return Padding(
      padding: ProjectPaddings.smallBottomPadding,
      child: SizedBox(
        height: bottomEmojiSendButtonHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: GeneralDatas.customBottomSheetBottomSendEmojiDatas.length,
          itemBuilder: (context, index) {
            return _BottomSendEmojiButton(
              emoji: GeneralDatas.customBottomSheetBottomSendEmojiDatas[index],
              index: index,
            );
          },
        ),
      ),
    );
  }
}

mixin _CommentBottomSheetUtility{
  final bool _isTextFieldFocused = false;
  final ProjectColors _projectColors = ProjectColors();
  final String _titleComment = "Yorumlar";
  final double bottomEmojiSendButtonHeight = 45;
}


