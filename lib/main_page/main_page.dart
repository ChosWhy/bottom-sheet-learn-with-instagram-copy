import 'package:bottomsheetexample/bottom_sheets/main_bottom_sheet.dart';
import 'package:bottomsheetexample/const/project_colors.dart';
import 'package:bottomsheetexample/const/project_padding.dart';
import 'package:bottomsheetexample/extension/size_extension.dart';
import 'package:bottomsheetexample/extension/text_theme.dart';
import 'package:bottomsheetexample/general_datas.dart';
import 'package:bottomsheetexample/state_manage/main_page_state_manage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import '../bottom_sheets/show_comment_bottom_sheet.dart';
part './part_appbar.dart';
part './part_video_body.dart';
part './part_user_profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _MainPageAppBar(appbarFavoriteColor: GeneralDatas.appbarFavoriteColor,),
      body: SafeArea(
        child: SizedBox(
          width: context.getWidthWithContext(context),
          height: context.getHeightWithContext(context),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              if (index == GeneralDatas.kZero) {
                return _UserProfileImageListView();
              } else {
                return _VideoBodyAndInformation(appbarFavoriteColor: GeneralDatas.appbarFavoriteColor,);
              }
            },
          ),
        ),
      ),
    );
  }
}

class _MainPageUtility{
  final String titleInstagram = "Instagram";
  final IconData iconArrowDown = Icons.keyboard_arrow_down_outlined;
  final IconData iconFavorite = Icons.favorite;
  final IconData fontAwesomeFacebookMessenger = FontAwesomeIcons.facebookMessenger;
}

