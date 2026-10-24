part of 'values.dart';

class CertificationData {
  CertificationData({
    required this.title,
    required this.image,
    required this.imageSize,
    required this.url,
    required this.awardedBy,
  });

  final String image;
  final double imageSize;
  final String url;
  final String title;
  final String awardedBy;
}

class NoteWorthyProjectDetails {
  NoteWorthyProjectDetails({
    required this.projectName,
    required this.isOnPlayStore,
    required this.isPublic,
    required this.technologyUsed,
    required this.isWeb,
    required this.isLive,
    this.projectDescription,
    this.playStoreUrl,
    this.webUrl,
    this.hasBeenReleased,
    this.gitHubUrl,
  });

  final String projectName;
  final bool isPublic;
  final bool isOnPlayStore;
  final bool isWeb;
  final String? projectDescription;
  final bool isLive;
  final bool? hasBeenReleased;
  final String? playStoreUrl;
  final String? gitHubUrl;
  final String? webUrl;
  final String? technologyUsed;
}

class ExperienceData {
  ExperienceData({
    required this.position,
    required this.roles,
    required this.location,
    required this.duration,
    required this.company,
    this.companyUrl,
  });

  final String company;
  final String? companyUrl;
  final String location;
  final String duration;
  final String position;
  final List<String> roles;
}

class SkillData {
  SkillData({
    required this.skillName,
    required this.skillLevel,
  });

  final String skillName;
  final double skillLevel;
}

class SubMenuData {
  SubMenuData({
    required this.title,
    this.isSelected,
    this.content,
    this.skillData,
    this.isAnimation = false,
  });

  final String title;
  final String? content;
  final List<SkillData>? skillData;
  bool isAnimation;
  bool? isSelected;
}

class Data {
  static List<NavItemData> menuItems = [
    NavItemData(name: StringConst.HOME, route: StringConst.HOME_PAGE),
    NavItemData(name: StringConst.ABOUT, route: StringConst.ABOUT_PAGE),
    NavItemData(name: StringConst.WORKS, route: StringConst.WORKS_PAGE),
    NavItemData(
      name: StringConst.EXPERIENCE,
      route: StringConst.EXPERIENCE_PAGE,
    ),
    // NavItemData(
    //   name: StringConst.CERTIFICATIONS,
    //   route: StringConst.CERTIFICATION_PAGE,
    // ),
    NavItemData(name: StringConst.CONTACT, route: StringConst.CONTACT_PAGE),
  ];

  static List<SocialData> socialData = [
    SocialData(
      name: StringConst.GITHUB,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    // SocialData(
    //   name: StringConst.TWITTER,
    //   iconData: FontAwesomeIcons.twitter,
    //   url: StringConst.TWITTER_URL,
    // ),
    SocialData(
      name: StringConst.INSTAGRAM,
      iconData: FontAwesomeIcons.instagram,
      url: StringConst.INSTAGRAM_URL,
    ),
    // SocialData(
    //   name: StringConst.TELEGRAM,
    //   iconData: FontAwesomeIcons.telegram,
    //   url: StringConst.TELEGRAM_URL,
    // ),
  ];

  /// Programming languages — edit AppAbout.languages in about.dart.
  static List<String> get mobileTechnologies => AppAbout.languages;

  /// Frameworks & tools — edit AppAbout.frameworks in about.dart.
  static List<String> get otherTechnologies => AppAbout.frameworks;

  // socialData1 kept for any remaining references (GitHub + LinkedIn nav bar area)
  static List<SocialData> socialData1 = [
    SocialData(
      name: StringConst.GITHUB,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
  ];

  /// About page social links — edit AppAbout.socialLinks in about.dart.
  static List<SocialData> get socialData2 => AppAbout.socialLinks;

  /// About page coding profiles — edit AppAbout.codingProfiles in about.dart.
  static List<SocialData> get socialData3 => AppAbout.codingProfiles;

  /// Delegates to [AppProjects] — edit projects.dart to add/update/reorder.
  static List<ProjectItemData> get recentWorks => AppProjects.recentWorks;

  /// Delegates to [AppProjects] — edit projects.dart to add/update/reorder.
  static List<ProjectItemData> get projects => AppProjects.all;

  /// Delegates to [AppProjects] — edit projects.dart to add noteworthy entries.
  static List<NoteWorthyProjectDetails> get noteworthyProjects => AppProjects.noteworthy;

  static List<CertificationData> certificationData = [
    CertificationData(
      title: StringConst.Algorithmic_Toolbox,
      url: StringConst.Algorithmic_Toolbox_URL,
      image: ImagePath.Algorithmic_Toolbox_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.COURSERA,
    ),
    CertificationData(
      title: StringConst.PROBLEMSOLVING,
      url: StringConst.PROBLEMSOLVING_URL,
      image: ImagePath.PROBLEMSOLVING_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.HACKERRANK,
    ),
    CertificationData(
      title: StringConst.JAVABASIC,
      url: StringConst.JAVABASIC_URL,
      image: ImagePath.JAVABASIC_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.HACKERRANK,
    ),
    CertificationData(
      title: StringConst.CN8,
      url: StringConst.CN8_URL,
      image: ImagePath.CN8_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.CODINGNINJAS,
    ),
    CertificationData(
      title: StringConst.OOPS,
      url: StringConst.OOPS_URL,
      image: ImagePath.OOPS_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.LINKEDIN,
    ),
    CertificationData(
      title: StringConst.WS,
      url: StringConst.WS_URL,
      image: ImagePath.WS_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.LINKEDIN,
    ),
  ];

  /// Delegates to [AppExperiences.all] — edit experiences.dart to add/update entries.
  static List<ExperienceData> get experienceData => AppExperiences.all;
}

