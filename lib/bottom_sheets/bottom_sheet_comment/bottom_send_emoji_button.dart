part of"./show_comment_bottom_sheet.dart";

class _BottomSendEmojiButton extends StatelessWidget with _BottomSendEmojiButtonUtility{
  _BottomSendEmojiButton({required this.emoji, required this.index});

  final String emoji;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: index == GeneralDatas.kZero
          ? horizontalDefault
          : rightDefault,
      child: InkWell(
        borderRadius: largeBorderRadius,
        onTap: () {},
        child: Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
              color: blackOut,
              borderRadius: largeBorderRadius),
          child:
          Center(child: Text(emoji, style: TextStyle(fontSize: textFontSize))),
        ),
      ),
    );
  }
}

mixin _BottomSendEmojiButtonUtility{
  final EdgeInsets horizontalDefault = const EdgeInsets.symmetric(horizontal: 8);
  final EdgeInsets rightDefault = const EdgeInsets.only(right: 8);
  final BorderRadius largeBorderRadius = BorderRadius.circular(20);
  final double containerWidth = 60;
  final double containerHeight = 45;
  final Color blackOut = const Color(0xff222222);
  final double textFontSize = 24;
}