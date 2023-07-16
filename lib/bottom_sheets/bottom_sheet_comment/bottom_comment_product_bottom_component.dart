part of "./show_comment_bottom_sheet.dart";

class BottomSheetCommentProductBottomComponent extends StatefulWidget {
  BottomSheetCommentProductBottomComponent({
    Key? key,
    required this.isTextFieldFocused,
    required this.commentCount,
  }) : super(key: key);
  final bool isTextFieldFocused;
  int commentCount;

  @override
  State<BottomSheetCommentProductBottomComponent> createState() =>
      _BottomSheetCommentProductBottomComponentState();
}

class _BottomSheetCommentProductBottomComponentState
    extends State<BottomSheetCommentProductBottomComponent>
    with _BottomSheetCommentProductBottomComponentPageUtility {
  late final bool _isTextFieldFocused;

  _BottomSheetCommentProductBottomComponentState();

  @override
  void initState() {
    super.initState();
    _isTextFieldFocused = widget.isTextFieldFocused;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      ///kod calısıyor ama bi kodu incele neden bu sekilde yapıldıgını!
      height: _isTextFieldFocused
          ? MediaQuery.of(context).size.height * 0.069
          : MediaQuery.of(context).viewInsets.bottom +
              MediaQuery.of(context).size.height * 0.069,
      child: Stack(
        children: [
          Positioned(
            bottom: GeneralDatas.kZero,
            left: GeneralDatas.kZero,
            right: GeneralDatas.kZero,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Padding(
                padding: ProjectPaddings.normalSymmetricHorizontalPadding,
                child: Row(
                  children: [
                    Padding(
                      padding: largeRightPadding,
                      child: const CustomCircularAvatar(),
                    ),
                    _customProductTextField(context),
                    _giftButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _customProductTextField(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: smallRightPadding,
      child: TextField(
          style: context.getTextThemeWithContext(context).titleMedium,
          //yazı kısmı rengi
          decoration: InputDecoration(
              hintStyle: context
                  .getTextThemeWithContext(context)
                  .titleMedium
                  ?.copyWith(color: _projectColors.grey),
              hintText: customProductTextFieldHintText,
              focusedBorder: InputBorder.none

              ///default alttaki mavi border!
              ),
          maxLines: 1,
          autofocus: true,
          cursorColor: _projectColors.januaryBlue,
          onSubmitted: (value) {
            if (value != "") {
              setState(() {
                GeneralDatas.bottomSheetCommentCardDatas.add(
                    BottomSheetCommentCardModel(
                        imageUrl: GeneralDatas.randomImageGenerator,
                        name: addName,
                        time: addTime,
                        comment: value));
                GeneralDatas.commentCount++;
              });
            }
          }),
    ));
  }

  InkWell _giftButton() {
    return InkWell(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: defaultBorderRadius,
              border: Border.all(
                color: _projectColors.white,
                width: 2,
              )),
          child: Icon(
            ProjectIconDatas.getIconPaths(iconPaths: IconPaths.gif),
            size: giftButtonSize,
            color: _projectColors.white,
          ),
        ),
        onTap: () {});
  }
}

mixin _BottomSheetCommentProductBottomComponentPageUtility {
  final BorderRadius defaultBorderRadius = BorderRadius.circular(8);
  final double giftButtonSize = 30;
  final EdgeInsets largeRightPadding = const EdgeInsets.only(right: 25.0);
  final EdgeInsets smallRightPadding = const EdgeInsets.only(right: 15.0);
  final String customProductTextFieldHintText = "furkan_yildirimm olarak yorum yap...";
  final String addName = "furkan_yildirimm";
  final String addTime = "1sn";
  final ProjectColors _projectColors = ProjectColors();
}

/*

MediaQuery.of(context).viewInsets özelliği, Flutter uygulamasının mevcut ekranın içerisindeki içerik yerleşimini etkileyen
 bir değerdir. Bu değer, ekranın içerisinde klavye gibi ek ekran bileşenleri açıldığında veya sistem çubuğu gibi ekranın
  dışındaki unsurların görüntülendiğinde kullanılabilir.

viewInsets özelliği bir EdgeInsets nesnesidir ve dört tarafta (top, right, bottom, left) boşluk değerlerini içerir. Bu
değerler, ekranın içerisindeki içeriği kaydırmak veya düzenlemek için kullanılabilir. viewInsets.bottom özelliği, klavyenin
 açıldığı durumlarda ekranın altında yer alan boşluğun yüksekliğini temsil eder.
*/
