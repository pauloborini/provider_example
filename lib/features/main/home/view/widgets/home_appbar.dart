import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HomeViewModel homeViewModel;

  const HomeAppBar({super.key, required this.homeViewModel});

  @override
  Size get preferredSize => Size.fromHeight(64.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: context.colors.primary,
      toolbarHeight: 64.height,
      automaticallyImplyLeading: false,
      centerTitle: true,
      titleSpacing: 0,
      leadingWidth: 56.width,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              SizedBox(width: 8.width),
              CustomIconButton(
                icon: PhosphorIconsRegular.list,
                iconColor: context.colors.neutralWhite,
                onPressed: _leadingPressed,
              ),
            ],
          ),
        ],
      ),
      title: SizedBox(
        height: 64.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: constraints.maxWidth,
                  height: 40.height,
                  decoration: BoxDecoration(
                    color: context.colors.primaryDark,
                    borderRadius: BorderRadius.circular(100.adaptive),
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        left: homeViewModel.selectedIndex == 0 ? 0 : constraints.maxWidth / 2,
                        child: Container(
                          width: constraints.maxWidth / 2,
                          height: 40.height,
                          decoration: BoxDecoration(
                            color: context.colors.neutralWhite,
                            borderRadius: BorderRadius.circular(100.adaptive),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _onTabChanged(0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 40.height,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      PhosphorIconsFill.lightning,
                                      size: 18.icon,
                                      color: homeViewModel.selectedIndex == 0
                                          ? context.colors.primary
                                          : context.colors.neutralWhite,
                                    ),
                                    SizedBox(width: 4.width),
                                    Flexible(
                                      child: Text(
                                        'ir agora',
                                        style: context.textStyles.bodyTextMedium.copyWith(
                                          color: homeViewModel.selectedIndex == 0
                                              ? context.colors.textColor
                                              : context.colors.neutralWhite,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _onTabChanged(1),
                              child: Container(
                                alignment: Alignment.center,
                                height: 40.height,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      PhosphorIconsRegular.calendarCheck,
                                      size: 18.icon,
                                      color: homeViewModel.selectedIndex == 1
                                          ? context.colors.primary
                                          : context.colors.neutralWhite,
                                    ),
                                    SizedBox(width: 4.width),
                                    Flexible(
                                      child: Text(
                                        'ir outro dia',
                                        style: context.textStyles.bodyTextMedium.copyWith(
                                          color: homeViewModel.selectedIndex == 1
                                              ? context.colors.textColor
                                              : context.colors.neutralWhite,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 56.width,
              child: CustomIconButton(
                icon: PhosphorIconsRegular.magnifyingGlass,
                iconColor: context.colors.neutralWhite,
                onPressed: _actionPressed,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _leadingPressed() {}

  void _actionPressed() {}

  void _onTabChanged(int index) {
    homeViewModel.setSelectedIndex(index);
  }
}
