import 'package:bottomsheetexample/general_datas.dart';
import 'package:bottomsheetexample/models/bottom_sheet_comment_card_model.dart';
import 'package:bottomsheetexample/widgets/circular_avatar.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_sheet_comment_card.dart';

class CommentBottomSheet extends StatefulWidget {
  const CommentBottomSheet({Key? key, required this.commentCount}) : super(key: key);
  final int commentCount;
  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final bool _isTextFieldFocused = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _commentText(context),
        const Divider(color: Colors.white, thickness: 1),
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
      "Yorumlar",
      style: Theme.of(context)
          .textTheme
          .titleSmall
          ?.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
    );
  }

  Padding _bottomEmojiSendButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: SizedBox(
        height: 45,
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

class BottomSheetCommentProductBottomComponent extends StatefulWidget {
  BottomSheetCommentProductBottomComponent(
      {Key? key,
      required this.isTextFieldFocused, required this.commentCount,})
      : super(key: key);
  final bool isTextFieldFocused;
  int commentCount;

  @override
  State<BottomSheetCommentProductBottomComponent> createState() =>
      _BottomSheetCommentProductBottomComponentState();
}

class _BottomSheetCommentProductBottomComponentState
    extends State<BottomSheetCommentProductBottomComponent> {
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
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    //custom circular avatar
                    const Padding(
                      padding: EdgeInsets.only(right: 25.0),
                      child: CustomCircularAvatar(),
                    ),
                    //custom textfield
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: TextField(
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.white),
                        //yazı kısmı rengi
                        decoration: InputDecoration(
                            hintStyle: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.grey),
                            hintText: "furkan_yildirimm olarak yorum yap...",
                            focusedBorder: InputBorder.none

                            ///default alttaki mavi border!
                            ),
                        maxLines: 1,
                        autofocus: true,
                        cursorColor: const Color(0xff00A0B8),
                        onSubmitted: (value) {
                          if(value != ""){
                            setState(() {
                              GeneralDatas.bottomSheetCommentCardDatas.add(
                                  BottomSheetCommentCardModel(
                                      imageUrl: "https://picsum.photos/200",
                                      name: "furkan_yildirimm",
                                      time: "1sn",
                                      comment: value));
                              GeneralDatas.commentCount++;
                            });
                          }
                        }
                      ),
                    )),
                    //gift place
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


  InkWell _giftButton() {
    return InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            )),
                        child: const Icon(
                          Icons.gif,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {});
  }
}

class _BottomSendEmojiButton extends StatelessWidget {
  const _BottomSendEmojiButton({required this.emoji, required this.index});

  final String emoji;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: index == 0
          ? const EdgeInsets.symmetric(horizontal: 8)
          : const EdgeInsets.only(right: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Container(
          width: 60,
          height: 45,
          decoration: BoxDecoration(
              color: const Color(0xff222222),
              borderRadius: BorderRadius.circular(20)),
          child:
              Center(child: Text(emoji, style: const TextStyle(fontSize: 24))),
        ),
      ),
    );
  }
}

/*

MediaQuery.of(context).viewInsets özelliği, Flutter uygulamasının mevcut ekranın içerisindeki içerik yerleşimini etkileyen
 bir değerdir. Bu değer, ekranın içerisinde klavye gibi ek ekran bileşenleri açıldığında veya sistem çubuğu gibi ekranın
  dışındaki unsurların görüntülendiğinde kullanılabilir.

viewInsets özelliği bir EdgeInsets nesnesidir ve dört tarafta (top, right, bottom, left) boşluk değerlerini içerir. Bu
değerler, ekranın içerisindeki içeriği kaydırmak veya düzenlemek için kullanılabilir. viewInsets.bottom özelliği, klavyenin
 açıldığı durumlarda ekranın altında yer alan boşluğun yüksekliğini temsil eder.
*/

