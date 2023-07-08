part of "./main_page.dart";

class _VideoBodyAndInformation extends StatefulWidget {
  _VideoBodyAndInformation({
    required this.appbarFavoriteColor,
  });

  Color appbarFavoriteColor;

  @override
  State<_VideoBodyAndInformation> createState() =>
      _VideoBodyAndInformationState();
}

class _VideoBodyAndInformationState extends State<_VideoBodyAndInformation>
    with MainBottomSheet, _VideoBodyUtility {
  final ProjectColors _projectColors = ProjectColors();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPaddings.normalBottomPadding,
      child: SizedBox(
        width: context.getWidthWithContext(context),
        height: context.getHeightWithContext(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VideoComponent(),
            _iconPlaceComponent(context),
            _textPlaceComponent(context)
          ],
        ),
      ),
    );
  }

  Padding _textPlaceComponent(BuildContext context) {
    return Padding(
      padding: ProjectPaddings.projectGeneralSymmetricPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleTextPlaceFavoriteCount,
            style: context.getTextThemeWithContext(context).titleSmall,
          ),
          Padding(
            padding: ProjectPaddings.smallTopPadding,
            child: Text(
              titleTextPlaceOwner,
              style: context.getTextThemeWithContext(context).titleSmall,
            ),
          ),
          Padding(
            padding: ProjectPaddings.smallTopPadding,
            child: InkWell(
              onTap: () {},
              child: Text(
                  "${GeneralDatas.commentCount} $titleTextPlaceSeeAllComment}",
                  style: context.getTextThemeWithContext(context).titleSmall),
            ),
          ),
          Padding(
            padding: ProjectPaddings.smallTopPadding,
            child: Text(
              titleTextPlaceTime,
              style: context.getTextThemeWithContext(context).titleSmall,
            ),
          ),
        ],
      ),
    );
  }

  Row _iconPlaceComponent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  iconFavoriteOutlined,
                  color: _projectColors.white,
                )),
            IconButton(
                onPressed: () {
                  _customBottomSheetIconMethod(context);
                },
                icon: Icon(
                  iconFontAwesomeComment,
                  color: _projectColors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  iconSendOutlined,
                  color: _projectColors.white,
                )),
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconSaveOutlined,
              color: _projectColors.white,
            ))
      ],
    );
  }

  Future<void> _customBottomSheetIconMethod(BuildContext context) async {
    {
      final result = await showCustomMainBottomSheet(
          context: context,
          child: CommentBottomSheet(
            commentCount: GeneralDatas.commentCount,
          ));
      if (result is bool) {
        setState(() {
          GeneralDatas.appbarFavoriteColor = _projectColors.red;
        });
      }
    }
  }
}

class VideoComponent extends StatefulWidget {
  const VideoComponent({Key? key}) : super(key: key);

  @override
  State<VideoComponent> createState() => _VideoComponentState();
}

class _VideoComponentState extends VideoComponentStateManage
    with _VideoComponentUtility {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          fit: StackFit.expand,
          children: [
            //video
            videoPlayerController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(videoPlayerController),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      Padding(
                        padding: ProjectPaddings.normalTopPadding,
                        child: Text(
                          titleVideoComponentLoading,
                          style: context
                              .getTextThemeWithContext(context)
                              .titleMedium,
                        ),
                      )
                    ],
                  ),
            //top
            _topComponent(context)
          ],
        );
      },
    ));
  }

  ListTile _topComponent(BuildContext context) {
    return ListTile(
        leading: Container(
          width: avatarSize,
          height: avatarSize,
          decoration: BoxDecoration(
            color: projectColors.blue,
            borderRadius: avatarBorderRadius,
            image: DecorationImage(
                image: NetworkImage(GeneralDatas.randomImageGenerator),
                fit: BoxFit.cover),
          ),
        ),
        title: Text(
          avatarName,
          style: context
              .getTextThemeWithContext(context)
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        trailing: InkWell(
          onTap: () {},
          child: Container(
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(borderRadius: avatarBorderRadius),
              child: Icon(
                iconTopMore,
                size: topIconSize,
                color: projectColors.white,
              )),
        ));
  }
}

mixin _VideoComponentUtility {
  final String titleVideoComponentLoading = "Video is loading";
  final double avatarSize = 40;
  final BorderRadius avatarBorderRadius = BorderRadius.circular(20);
  final avatarName = "bgyeter";
  final double topIconSize = 25;
  final IconData iconTopMore = Icons.more_vert_outlined;
}

mixin _VideoBodyUtility {
  final String titleTextPlaceSeeAllComment = "yorumun hepsini gör";
  final String titleTextPlaceFavoriteCount = "4.719 beğenme";
  final String titleTextPlaceOwner = "bgyeter";
  final String titleTextPlaceTime = "20 saat önce";
  final IconData iconFavoriteOutlined = Icons.favorite_border_rounded;
  final IconData iconFontAwesomeComment = FontAwesomeIcons.comment;
  final IconData iconSendOutlined = Icons.send_outlined;
  final IconData iconSaveOutlined = Icons.save_outlined;
}
