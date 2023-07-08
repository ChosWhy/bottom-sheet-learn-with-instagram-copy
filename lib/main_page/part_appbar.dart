
part of"./main_page.dart";

//bu sekilde extract edebiliyorsun appbarı!
/*
ne yapıyorsun bunu ekliyorsun :   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
ve sunu da implemente ediyorsun : implements PreferredSizeWidget
 */
class _MainPageAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Color appbarFavoriteColor;
  final _MainPageUtility _mainPageUtility = _MainPageUtility();
  _MainPageAppBar({required this.appbarFavoriteColor});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

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
              _mainPageUtility.titleInstagram,
              style: context.getTextThemeWithContext(context).titleLarge,
            ),
            Icon(
              _mainPageUtility.iconArrowDown,
            )
          ],
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(_mainPageUtility.iconFavorite,color: appbarFavoriteColor,)),
        IconButton(
            onPressed: () {},
            icon: Icon(_mainPageUtility.fontAwesomeFacebookMessenger))
      ],
    );
  }
}