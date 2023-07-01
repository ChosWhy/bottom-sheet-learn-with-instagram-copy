import 'package:bottomsheetexample/bottom_sheets/main_bottom_sheet.dart';
import 'package:bottomsheetexample/general_datas.dart';
import 'package:bottomsheetexample/state_manage/main_page_state_manage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

import 'bottom_sheets/show_comment_bottom_sheet.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends MainPageStateManage {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _MainPageAppBar(appbarFavoriteColor: GeneralDatas.appbarFavoriteColor,),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return const _UserProfileImageListView();
              } else {
                return _VideoBodyAndInformation(videoPlayerController: videoPlayerController, appbarFavoriteColor: GeneralDatas.appbarFavoriteColor,);
              }
            },
          ),
        ),
      ),
    );
  }
}

//bu sekilde extract edebiliyorsun appbarı!
/*
ne yapıyorsun bunu ekliyorsun :   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
ve sunu da implemente ediyorsun : implements PreferredSizeWidget
 */
class _MainPageAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Color appbarFavoriteColor;

  const _MainPageAppBar({required this.appbarFavoriteColor});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: InkWell(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Instagram",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
            )
          ],
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite,color: appbarFavoriteColor,)),
        IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.facebookMessenger))
      ],
    );
  }

}

class _VideoBodyAndInformation extends StatefulWidget{
  _VideoBodyAndInformation({
    required VideoPlayerController videoPlayerController, required this.appbarFavoriteColor,
  }) : _videoPlayerController = videoPlayerController;

  final VideoPlayerController _videoPlayerController;
  Color appbarFavoriteColor;

  @override
  State<_VideoBodyAndInformation> createState() => _VideoBodyAndInformationState();
}

class _VideoBodyAndInformationState extends State<_VideoBodyAndInformation>  with MainBottomSheet{

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///video companent
            Expanded(
                //height: 600,
                //color: Colors.orange,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        //video
                        widget._videoPlayerController.value.isInitialized ? AspectRatio(
                          aspectRatio: widget._videoPlayerController.value.aspectRatio,
                          child: VideoPlayer(widget._videoPlayerController),
                        ) : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircularProgressIndicator(),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text("Video is loading",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),),
                            )
                          ],
                        ),
                        //top
                        ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://picsum.photos/200"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            title: Text(
                              "bgyeter",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: InkWell(
                              onTap: () {},
                              child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25)
                                  ),
                                  child: const Icon(
                                    Icons.more_vert_outlined,
                                    size: 25,
                                    color: Colors.white,
                                  )),
                            ))
                      ],
                    );
                  },
                )),
            ///Icons place
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () async {
                          final result = await showCustomMainBottomSheet(
                              context: context,
                              child: CommentBottomSheet(
                                commentCount: GeneralDatas.commentCount,
                              ));
                          if(result is bool){
                            setState(() {
                              GeneralDatas.appbarFavoriteColor = Colors.red;
                            });
                          }
                          ///resultı cas edeceksin sonra backgrounda renk değiştir!
                        },
                        icon: const Icon(
                          FontAwesomeIcons.comment,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send_outlined,
                          color: Colors.white,
                        )),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.save_outlined,
                      color: Colors.white,
                    ))
              ],
            ),
            ///texts place
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("4.719 beğenme",style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text("bgyeter KLASGKDKASMLDFASMKDASL",style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: InkWell(
                      onTap: () {},
                      child: Text("${GeneralDatas.commentCount} yorumun hepsini gör",style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text("20 saat önce",style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _UserProfileImageListView extends StatelessWidget {
  const _UserProfileImageListView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: index == 9
                  ? const EdgeInsets.only(top: 5)
                  : const EdgeInsets.only(right: 10.0, top: 5),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                      Positioned(
                        top: 5,
                        left: 5,
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(40),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/person_girl4.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text("$index",
                        style:
                            Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: Colors.white,
                                )),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
