import 'package:flutter/material.dart';
import 'package:motels/core/helpers/extensions/responsive_extension.dart';
import 'package:motels/core/ui/styles/colors_app.dart';
import 'package:motels/core/ui/styles/text_styles.dart';
import 'package:motels/core/utils/di/di_provider.dart';
import 'package:motels/core/widgets/line_divider_widget.dart';
import 'package:motels/features/home/store/home_store.dart';
import 'package:motels/features/home/view/components/filter_widget.dart';
import 'package:motels/features/home/view/components/go_now_body.dart';
import 'package:motels/features/home/view/components/header_go_another_day_widget.dart';
import 'package:motels/features/home/view/components/header_go_now_widget.dart';
import 'package:motels/features/home/view/components/home_appbar.dart';
import 'package:motels/features/home/view/components/skeleton_go_now_widget.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeStore store;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      store = context.di<HomeStore>();
      _initialized = true;
      WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
        await _setupConfigs();
      });
    }
  }

  Future<void> _setupConfigs() async {
    await store.setupConfigs();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: store,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: context.colors.primary,
          appBar: HomeAppBar(
            store: store,
          ),
          body: Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 60.height, minHeight: 60.height),
                child: PageView(
                  controller: store.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  children: [
                    HeaderGoNowWidget(
                      store: store,
                    ),
                    HeaderGoAnotherDayWidget(
                      store: store,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: context.colors.neutralShade100,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.adaptive),
                    topRight: Radius.circular(16.adaptive),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 12.height),
                    FilterWidget(store: store),
                    LineDividerWidget(
                      firstPadding: 12.height,
                      secondPadding: 0,
                    ),
                  ],
                ),
              ),
              ValueListenableBuilder(
                valueListenable: store.screenLoaded,
                builder: (context, isLoaded, _) {
                  return !isLoaded
                      ? const Expanded(
                          child: SkeletonGoNowWidget(),
                        )
                      : Expanded(
                          child: GoNowBody(
                            store: store,
                          ),
                        );
                },
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: 16.height),
            child: FloatingActionButton.extended(
              elevation: 2,
              backgroundColor: context.colors.neutralWhite,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.adaptive)),
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    PhosphorIconsRegular.mapTrifold,
                    color: context.colors.primary,
                    size: 24.icon,
                  ),
                  SizedBox(width: 8.width),
                  Text(
                    'mapa',
                    style: context.textStyles.bodyTextMedium,
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }
}
