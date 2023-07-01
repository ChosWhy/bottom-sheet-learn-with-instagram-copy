import 'package:flutter/material.dart';
import 'models/bottom_sheet_comment_card_model.dart';

class GeneralDatas{
  static final List<String> customBottomSheetBottomSendEmojiDatas = [
    "\u{2764}","\u{1F44C}",'\u{1F525}','\u{1F44A}','\u{1F622}', '\u{1F60D}','\u{1F62E}','\u{1F602}',
  ];

  static List<BottomSheetCommentCardModel> bottomSheetCommentCardDatas = [
    BottomSheetCommentCardModel(imageUrl: "https://picsum.photos/200", name: "eva", time: "34dk", comment: "Canımsın :)",likeCount: 18),
  ];

  static Color appbarFavoriteColor = Colors.white;
  static int commentCount = 1;

}