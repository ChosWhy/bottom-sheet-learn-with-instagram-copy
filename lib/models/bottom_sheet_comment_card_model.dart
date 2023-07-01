
class BottomSheetCommentCardModel{
  final String imageUrl;
  final String name;
  final String time;
  final String comment;
  final int? likeCount;

  BottomSheetCommentCardModel(
      {required this.imageUrl, required this.name, required this.time, required this.comment, this.likeCount});
}