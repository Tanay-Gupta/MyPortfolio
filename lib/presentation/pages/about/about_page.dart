import 'package:tanay_gupta_portfolio/core/layout/adaptive.dart';
import 'package:tanay_gupta_portfolio/core/utils/functions.dart';
import 'package:tanay_gupta_portfolio/presentation/pages/about/widgets/about_header.dart';
import 'package:tanay_gupta_portfolio/presentation/pages/about/widgets/technology_section.dart';
import 'package:tanay_gupta_portfolio/presentation/pages/widgets/animated_footer.dart';
import 'package:tanay_gupta_portfolio/presentation/pages/widgets/socials.dart';
import 'package:tanay_gupta_portfolio/presentation/widgets/animated_line_through_text.dart';
import 'package:tanay_gupta_portfolio/presentation/widgets/animated_positioned_text.dart';
import 'package:tanay_gupta_portfolio/presentation/widgets/animated_text_slide_box_transition.dart';
import 'package:tanay_gupta_portfolio/presentation/widgets/content_area.dart';
import 'package:tanay_gupta_portfolio/presentation/widgets/custom_spacer.dart';
import 'package:tanay_gupta_portfolio/presentation/widgets/page_wrapper.dart';
import 'package:tanay_gupta_portfolio/presentation/widgets/spaces.dart';
import 'package:tanay_gupta_portfolio/values/values.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../widgets/content_builder.dart';

class AboutPage extends StatefulWidget {
  static const String aboutPageRoute = StringConst.ABOUT_PAGE;
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _storyController;
  late AnimationController _technologyController;
  late AnimationController _contactController;
  late AnimationController _technologyListController;
  late AnimationController _quoteController;
  late AnimationController _codingProfileController;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _storyController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _technologyController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _technologyListController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _contactController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _quoteController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _codingProfileController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _storyController.dispose();
    _technologyController.dispose();
    _technologyListController.dispose();
    _contactController.dispose();
    _quoteController.dispose();
    _codingProfileController.dispose();
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
        // sm: assignWidth(context, 0.10),
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.15),
        assignHeight(context, 0.15),
        // sm: assignWidth(context, 0.10),
      ),
    );

    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? bodyLargeStyle = textTheme.bodyLarge?.copyWith(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      height: 2.0,
      // letterSpacing: 2,
    );
    TextStyle? bodyMediumStyle =
        textTheme.bodyLarge?.copyWith(color: AppColors.grey750);
    TextStyle? titleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_20,
      ),
    );
    CurvedAnimation _storySectionAnimation = CurvedAnimation(
      parent: _storyController,
      curve: Interval(0.6, 1.0, curve: Curves.ease),
    );
    CurvedAnimation _technologySectionAnimation = CurvedAnimation(
      parent: _technologyController,
      curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
    );
    double widthOfBody = responsiveSize(
      context,
      assignWidth(context, 0.75),
      assignWidth(context, 0.5),
    );
    return PageWrapper(
      selectedRoute: AboutPage.aboutPageRoute,
      selectedPageName: StringConst.ABOUT,
      navBarAnimationController: _controller,
      onLoadingAnimationDone: () {
        _controller.forward();
      },
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          Padding(
            padding: padding,
            child: ContentArea(
              width: contentAreaWidth,
              child: Column(
                children: [
                  AboutHeader(
                    width: contentAreaWidth,
                    controller: _controller,
                  ),
                  CustomSpacer(heightFactor: 0.1),
                  VisibilityDetector(
                    key: Key('story-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage >
                          responsiveSize(context, 40, 70, md: 50)) {
                        _storyController.forward();
                      }
                    },
                    child: ContentBuilder(
                      controller: _storyController,
                      number: "/01 ",
                      width: contentAreaWidth,
                      section: AppAbout.storySectionLabel.toUpperCase(),
                      title: AppAbout.storyTitle,
                      body: Column(
                        children: [
                          for (final para in AppAbout.storyParagraphs)
                            AnimatedPositionedText(
                              controller: _storySectionAnimation,
                              width: widthOfBody,
                              maxLines: 30,
                              text: para,
                              textStyle: bodyLargeStyle,
                            ),
                        ],
                      ),
                    ),
                  ),

                  //---------------------------------adding coding profiles---------------------------------------
                  CustomSpacer(heightFactor: 0.1),
                  VisibilityDetector(
                    key: Key('coding-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage >
                          responsiveSize(context, 40, 70, md: 50)) {
                        _codingProfileController.forward();
                      }
                    },
                    child: ContentBuilder(
                      controller: _codingProfileController,
                      number: "/02 ",
                      width: contentAreaWidth,
                      section: AppAbout.codingSectionLabel.toUpperCase(),
                      title: AppAbout.codingSectionTitle,
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SpaceH20(),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: _buildCodingProfile(Data.socialData3),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //--------------------------------coding profile ends-----------------------------------------
                  CustomSpacer(heightFactor: 0.1),
                  VisibilityDetector(
                    key: Key('technology-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage > 10) {
                        _technologyController.forward();
                      }
                    },
                    child: ContentBuilder(
                      controller: _technologyController,
                      number: "/03 ",
                      width: contentAreaWidth,
                      section: AppAbout.technologySectionLabel.toUpperCase(),
                      title: AppAbout.technologyTitle,
                      body: Column(
                        children: [
                          AnimatedPositionedText(
                            controller: _technologySectionAnimation,
                            width: widthOfBody,
                            maxLines: 12,
                            text: AppAbout.technologyDescription,
                            textStyle: bodyLargeStyle,
                          ),
                        ],
                      ),
                      footer: VisibilityDetector(
                        key: Key('technology-list'),
                        onVisibilityChanged: (visibilityInfo) {
                          double visiblePercentage =
                              visibilityInfo.visibleFraction * 100;
                          if (visiblePercentage > 60) {
                            _technologyListController.forward();
                          }
                        },
                        child: Column(
                          children: [
                            SpaceH40(),
                            TechnologySection(
                              width: contentAreaWidth,
                              controller: _technologyListController,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomSpacer(heightFactor: 0.1),
                  VisibilityDetector(
                    key: Key('contact-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      _contactController.forward();
                      if (visiblePercentage > 50) {}
                    },
                    child: ContentBuilder(
                      controller: _contactController,
                      number: "/04 ",
                      width: contentAreaWidth,
                      section: AppAbout.contactSectionLabel.toUpperCase(),
                      title: AppAbout.contactSectionSocialTitle,
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SpaceH20(),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: _buildSocials(Data.socialData2),
                          ),
                        ],
                      ),
                      footer: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SpaceH40(),
                          AnimatedTextSlideBoxTransition(
                            controller: _contactController,
                            text: AppAbout.contactSectionEmailTitle,
                            textStyle: titleStyle,
                          ),
                          SpaceH40(),
                          AnimatedLineThroughText(
                            text: StringConst.DEV_EMAIL,
                            hasSlideBoxAnimation: true,
                            controller: _contactController,
                            onTap: () {
                              Functions.launchUrl(StringConst.EMAIL_URL);
                            },
                            textStyle: bodyMediumStyle,
                          ),
                        ],
                      ),
                    ),
                  ),

                  CustomSpacer(heightFactor: 0.1),
                  VisibilityDetector(
                    key: Key('quote-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage > 50) {
                        _quoteController.forward();
                      }
                    },
                    child: Column(
                      children: [
                        AnimatedTextSlideBoxTransition(
                          controller: _quoteController,
                          text: AppAbout.quote,
                          maxLines: 5,
                          width: contentAreaWidth,
                          textAlign: TextAlign.center,
                          textStyle: titleStyle?.copyWith(
                            fontSize: responsiveSize(
                              context,
                              Sizes.TEXT_SIZE_24,
                              Sizes.TEXT_SIZE_36,
                              md: Sizes.TEXT_SIZE_28,
                            ),
                            height: 2.0,
                          ),
                        ),
                        SpaceH20(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AnimatedTextSlideBoxTransition(
                            controller: _quoteController,
                            text: "— ${AppAbout.quoteAuthor}",
                            textStyle: textTheme.bodyLarge?.copyWith(
                              fontSize: responsiveSize(
                                context,
                                Sizes.TEXT_SIZE_16,
                                Sizes.TEXT_SIZE_18,
                                md: Sizes.TEXT_SIZE_16,
                              ),
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomSpacer(heightFactor: 0.2),
                ],
              ),
            ),
          ),
          // SlidingBanner(),
          AnimatedFooter()
        ],
      ),
    );
  }

  List<Widget> _buildSocials(List<SocialData> data) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyLarge?.copyWith(color: AppColors.grey750);
    TextStyle? slashStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    );
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        AnimatedLineThroughText(
          text: data[index].name,
          isUnderlinedByDefault: true,
          controller: _contactController,
          hasSlideBoxAnimation: true,
          isUnderlinedOnHover: false,
          onTap: () {
            Functions.launchUrl(data[index].url);
          },
          textStyle: style,
        ),
      );

      if (index < data.length - 1) {
        items.add(
          Text('/', style: slashStyle),
        );
      }
    }

    return items;
  }

  List<Widget> _buildCodingProfile(List<SocialData> data) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyLarge?.copyWith(color: AppColors.grey750);
    TextStyle? slashStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    );
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        AnimatedLineThroughText(
          text: data[index].name,
          isUnderlinedByDefault: true,
          controller: _codingProfileController,
          hasSlideBoxAnimation: true,
          isUnderlinedOnHover: false,
          onTap: () {
            Functions.launchUrl(data[index].url);
          },
          textStyle: style,
        ),
      );

      if (index < data.length - 1) {
        items.add(
          Text('/', style: slashStyle),
        );
      }
    }

    return items;
  }
}
