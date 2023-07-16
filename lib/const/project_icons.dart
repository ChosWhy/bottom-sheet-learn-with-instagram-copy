
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum IconPaths{
  favorite_border_rounded,
  more_vert_outlined,
  comment,
  send_outlined,
  iconArrowDown,
  keyboard_arrow_down_outlined,
  favorite,
  facebookMessenger,
  arrow_back,
  gif,
  save_outlined,
}

class ProjectIconDatas{
  static final Map<IconPaths,IconData> iconMap = {
    IconPaths.favorite_border_rounded: Icons.favorite_border_rounded,
    IconPaths.more_vert_outlined : Icons.more_vert_outlined,
    IconPaths.comment : FontAwesomeIcons.comment,
    IconPaths.send_outlined : Icons.send_outlined,
    IconPaths.keyboard_arrow_down_outlined : Icons.keyboard_arrow_down_outlined,
    IconPaths.favorite : Icons.favorite,
    IconPaths.facebookMessenger : FontAwesomeIcons.facebookMessenger,
    IconPaths.arrow_back : Icons.arrow_back,
    IconPaths.gif : Icons.gif,
    IconPaths.save_outlined : Icons.save_outlined
  };
  static IconData? getIconPaths({required IconPaths iconPaths}){
    final bool result = ProjectIconDatas.iconMap.containsKey(iconPaths);
    if(result){
      return ProjectIconDatas.iconMap[iconPaths];
    }
    return Icons.error;
  }
}