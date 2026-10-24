import 'package:tanay_gupta_portfolio/core/layout/adaptive.dart';
import 'package:tanay_gupta_portfolio/presentation/pages/widgets/animated_footer.dart';
import 'package:tanay_gupta_portfolio/presentation/pages/widgets/page_header.dart';
import 'package:tanay_gupta_portfolio/presentation/widgets/animated_positioned_text.dart';
import 'package:tanay_gupta_portfolio/presentation/widgets/animated_text_slide_box_transition.dart';
import 'package:tanay_gupta_portfolio/presentation/widgets/content_area.dart';
import 'package:tanay_gupta_portfolio/presentation/widgets/content_builder.dart';
import 'package:tanay_gupta_portfolio/presentation/widgets/custom_spacer.dart';
import 'package:tanay_gupta_portfolio/presentation/widgets/page_wrapper.dart';
import 'package:tanay_gupta_portfolio/presentation/widgets/spaces.dart';
import 'package:tanay_gupta_portfolio/values/values.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ExperiencePage extends StatefulWidget {
  static const String experiencePageRoute = StringConst.EXPERIENCE_PAGE;
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  _ExperiencePageState createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage>
    with TickerProviderStateMixin {
  late AnimationController _navController;

  /// One controller per experience entry — sized automatically from the data
  /// list, so adding a new job in experiences.dart requires no changes here.
  late List<AnimationController> _itemControllers;

  @override
  void initState() {
    super.initState();
    _navController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _itemControllers = List.generate(
      AppExperiences.all.length,
      (_) => AnimationController(
        duration: const Duration(milliseconds: 1200),
        vsync: this,
      ),
    );
  }

  @override
  void dispose() {
    _navController.dispose();
    for (final c in _itemControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.8),
      assignWidth(context, 0.75),
      sm: assignWidth(context, 0.8),
    );
    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
      ),
      right: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.10),
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.15),
        assignHeight(context, 0.15),
      ),
    );

    return PageWrapper(
      selectedRoute: ExperiencePage.experiencePageRoute,
      selectedPageName: StringConst.EXPERIENCE,
      navBarAnimationController: _navController,
      onLoadingAnimationDone: () {
        _navController.forward();
      },
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          PageHeader(
            headingText: StringConst.EXPERIENCE,
            headingTextController: _navController,
          ),
          Padding(
            padding: padding,
            child: ContentArea(
              width: contentAreaWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildExperienceSection(
                  data: AppExperiences.all,
                  width: contentAreaWidth,
                ),
              ),
            ),
          ),
          AnimatedFooter(),
        ],
      ),
    );
  }

  List<Widget> _buildExperienceSection({
    required List<ExperienceData> data,
    required double width,
  }) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle? defaultTitleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_18,
        Sizes.TEXT_SIZE_20,
      ),
    );

    final List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      final controller = _itemControllers[index];
      items.add(
        VisibilityDetector(
          key: Key('experience-section-$index'),
          onVisibilityChanged: (info) {
            if (info.visibleFraction * 100 > 40) {
              controller.forward();
            }
          },
          child: ContentBuilder(
            controller: controller,
            number: "/0${index + 1}",
            width: width,
            section: data[index].duration.toUpperCase(),
            heading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedTextSlideBoxTransition(
                  controller: controller,
                  text: data[index].company,
                  textStyle: defaultTitleStyle,
                ),
                SpaceH16(),
                AnimatedTextSlideBoxTransition(
                  controller: controller,
                  text: data[index].position,
                  textStyle: defaultTitleStyle?.copyWith(
                    fontSize: responsiveSize(
                      context,
                      Sizes.TEXT_SIZE_16,
                      Sizes.TEXT_SIZE_18,
                    ),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildRoles(
                roles: data[index].roles,
                controller: controller,
                width: width * 0.75,
              ),
            ),
          ),
        ),
      );
      items.add(CustomSpacer(heightFactor: 0.1));
    }

    return items;
  }

  List<Widget> _buildRoles({
    required List<String> roles,
    required AnimationController controller,
    required double width,
  }) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle? bodyLargeStyle = textTheme.bodyLarge?.copyWith(
      fontSize: responsiveSize(context, Sizes.TEXT_SIZE_16, 17),
      color: AppColors.grey750,
      fontWeight: FontWeight.w300,
      height: 1.5,
    );

    final List<Widget> items = [];
    for (int index = 0; index < roles.length; index++) {
      items.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.play_arrow_outlined, color: AppColors.black, size: 12),
            SpaceW8(),
            Flexible(
              child: AnimatedPositionedText(
                text: roles[index],
                textStyle: bodyLargeStyle,
                maxLines: 7,
                width: width,
                controller: CurvedAnimation(
                  parent: controller,
                  curve: const Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
                ),
              ),
            ),
          ],
        ),
      );
      items.add(SpaceH12());
    }

    return items;
  }
}
