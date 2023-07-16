
part of"./main_page.dart";

//bu sekilde extract edebiliyorsun appbarı!
/*
ne yapıyorsun bunu ekliyorsun :   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
ve sunu da implemente ediyorsun : implements PreferredSizeWidget
 */
class _MainPageAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Color appbarFavoriteColor;
  _MainPageAppBar({required this.appbarFavoriteColor});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final String titleInstagram = "Instagram";

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: GeneralDatas.kZero,
      backgroundColor: Colors.transparent,
      title: InkWell(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              titleInstagram,
              style: context.getTextThemeWithContext(context).titleLarge,
            ),
            Icon(
              ProjectIconDatas.getIconPaths(iconPaths: IconPaths.keyboard_arrow_down_outlined),
            )
          ],
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(ProjectIconDatas.getIconPaths(iconPaths: IconPaths.favorite),color: appbarFavoriteColor,)),
        IconButton(
            onPressed: () {},
            icon: Icon(ProjectIconDatas.getIconPaths(iconPaths: IconPaths.facebookMessenger)))
      ],
    );
  }
}
