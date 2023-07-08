import 'package:flutter/material.dart';

import '../../models/bottom_sheet_comment_card_model.dart';
import 'circular_avatar.dart';

class BottomSheetCommentCard extends StatefulWidget {
  const BottomSheetCommentCard({super.key, required this.index, required this.model});
  final int index;
  final BottomSheetCommentCardModel model;

  @override
  State<BottomSheetCommentCard> createState() => _BottomSheetCommentCardState();
}

class _BottomSheetCommentCardState extends State<BottomSheetCommentCard> {
  late final BottomSheetCommentCardModel _model;

  @override
  void initState() {
    super.initState();
    _model = widget.model;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 18, right: 12),
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
              Text(
                _model.name,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.white),
              ),
              Text(
                _model.time,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.grey),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              _model.comment,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.white, overflow: TextOverflow.ellipsis),
              maxLines: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: InkWell(
              onTap: () {},
              child: Text(
                "Yanıtla",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.grey),
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
          borderRadius: BorderRadius.circular(25),
          onTap: () {},
          child: const SizedBox(
            width: 45,
            height: 45,
            child: Icon(
              Icons.favorite_border_rounded,
              color: Colors.grey,
            ),
          ),
        ),
        Text(
          _model.likeCount == null ? "" : _model.likeCount.toString(),
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}