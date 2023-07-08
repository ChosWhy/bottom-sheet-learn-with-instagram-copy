part of"./main_page.dart";

class _UserProfileImageListView extends StatelessWidget with _UserProfileUtility{
  _UserProfileImageListView();
  final ProjectColors _projectColors = ProjectColors();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPaddings.projectGeneralSymmetricPadding,
      child: SizedBox(
        height: generalProfileHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: index == 9
                  ? ProjectPaddings.smallTopPadding
                  : customUserProfilePadding,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: profileContainerSize,
                        height: profileContainerSize,
                        decoration: BoxDecoration(
                            color: _projectColors.red,
                            borderRadius: profileContainerSizeBorderRadius),
                      ),
                      Positioned(
                        top: positionedSize,
                        left: positionedSize,
                        child: Container(
                          width: (profileContainerSize - 10),
                          height: (profileContainerSize - 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: _projectColors.black, width: 2),
                              borderRadius: profileContainerSizeBorderRadius,
                              image: DecorationImage(
                                  image: AssetImage(personGirl
                                      ),
                                  fit: BoxFit.cover)),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: ProjectPaddings.normalTopPadding,
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

mixin _UserProfileUtility{
  final double generalProfileHeight = 110;
  final EdgeInsets customUserProfilePadding = const EdgeInsets.only(right: 10.0, top: 5);
  final double profileContainerSize = 80;
  final double positionedSize = 5;
  final BorderRadius profileContainerSizeBorderRadius = BorderRadius.circular(40);
  final String personGirl = "assets/images/person_girl4.jpg";
}