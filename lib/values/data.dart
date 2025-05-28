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
    NavItemData(
      name: StringConst.CERTIFICATIONS,
      route: StringConst.CERTIFICATION_PAGE,
    ),
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

  static List<String> mobileTechnologies = [
    "Java",
    "Python",
    "C",
    "Dart",
  ];
  static List<String> programmingLanguages = [];

  static List<String> otherTechnologies = [
    "Flutter",
    "Django",
    "Linux",
    "Git",
    "GitHub",
    "SQL",
    "C++",
    "Firebase",
    "Figma",
  ];
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
    // SocialData(
    //   name: StringConst.TWITTER,
    //   iconData: FontAwesomeIcons.twitter,
    //   url: StringConst.TWITTER_URL,
    // ),
  ];

  static List<SocialData> socialData2 = [
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
  static List<SocialData> socialData3 = [
    SocialData(
      name: "Leetcode | tanx4",
      iconData: FontAwesomeIcons.github,
      url: "https://leetcode.com/tanx4/",
    ),
    SocialData(
      name: "HackerRank | tanaywhocodes",
      iconData: FontAwesomeIcons.linkedin,
      url: "https://hackerrank.com/tanaywhocodes/",
    ),
    SocialData(
      name: "CodeChef | tanaywhocodes",
      iconData: FontAwesomeIcons.github,
      url: "https://www.codechef.com/users/tanaywhocodes",
    ),
  ];

  static List<ProjectItemData> recentWorks = [
    Projects.AILAAN_APP,
    Projects.NOTIFYX,
    Projects.SOCIALAPP,
    Projects.CITIZENSAFETY,
    Projects.LAZYSHARE,
    Projects.DATINGAPP,
  ];

  static List<ProjectItemData> projects = [
    Projects.AILAAN_APP,
    Projects.NOTIFYX,
    Projects.SOCIALAPP,
    Projects.CITIZENSAFETY,
    Projects.LAZYSHARE,
    Projects.DATINGAPP,
  ];

  static List<NoteWorthyProjectDetails> noteworthyProjects = [
    NoteWorthyProjectDetails(
      projectName: StringConst.LEETCODE_SUBMISSIONS,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: true,
      technologyUsed: StringConst.JAVA,
      projectDescription: StringConst.LEETCODE_SUBMISSIONS_DETAIL,
      gitHubUrl: StringConst.LEETCODE_SUBMISSIONS_GITHUB_URL,
      webUrl: StringConst.LEETCODE_SUBMISSIONS_URL,
      isLive: true,
    ),
  ];

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

  static List<ExperienceData> experienceData = [

    ExperienceData(
      company: StringConst.COMPANY_4,
      position: StringConst.POSITION_4,
      companyUrl: StringConst.COMPANY_4_URL,
      roles: [
        StringConst.COMPANY_4_ROLE_1,
        StringConst.COMPANY_4_ROLE_2,
        StringConst.COMPANY_4_ROLE_3,
        StringConst.COMPANY_4_ROLE_4,
      ],
      location: StringConst.LOCATION_4,
      duration: StringConst.DURATION_4,
    ),
    ExperienceData(
      company: StringConst.COMPANY_3,
      position: StringConst.POSITION_3,
      companyUrl: StringConst.COMPANY_3_URL,
      roles: [
        StringConst.COMPANY_3_ROLE_1,
        StringConst.COMPANY_3_ROLE_2,
        StringConst.COMPANY_3_ROLE_3,
      ],
      location: StringConst.LOCATION_3,
      duration: StringConst.DURATION_3,
    ),
    ExperienceData(
      company: StringConst.COMPANY_2,
      position: StringConst.POSITION_2,
      companyUrl: StringConst.COMPANY_2_URL,
      roles: [
        StringConst.COMPANY_2_ROLE_1,
        StringConst.COMPANY_2_ROLE_2,
      ],
      location: StringConst.LOCATION_2,
      duration: StringConst.DURATION_2,
    ),
    ExperienceData(
      company: StringConst.COMPANY_a1,
      position: StringConst.POSITION_a1,
      companyUrl: StringConst.COMPANY_a1_URL,
      roles: [
        StringConst.COMPANY_a1_ROLE_1,
      ],
      location: StringConst.LOCATION_a1,
      duration: StringConst.DURATION_a1,
    ),
    ExperienceData(
      company: StringConst.COMPANY_a2,
      position: StringConst.POSITION_a2,
      companyUrl: StringConst.COMPANY_a2_URL,
      roles: [
        StringConst.COMPANY_a2_ROLE_1,
        StringConst.COMPANY_a2_ROLE_2,
      ],
      location: StringConst.LOCATION_a2,
      duration: StringConst.DURATION_a2,
    ),
    
    ExperienceData(
      company: StringConst.COMPANY_1,
      position: StringConst.POSITION_1,
      companyUrl: StringConst.COMPANY_1_URL,
      roles: [
        StringConst.COMPANY_1_ROLE_1,
        StringConst.COMPANY_1_ROLE_2,
        StringConst.COMPANY_1_ROLE_3,
      ],
      location: StringConst.LOCATION_1,
      duration: StringConst.DURATION_1,
    ),
  ];
}

class Projects {
  static ProjectItemData AILAAN_APP = ProjectItemData(
    title: StringConst.AILAAN_APP,
    subtitle: StringConst.AILAAN_APP,
    platform: StringConst.AILAAN_APP_PLATFORM,
    primaryColor: AppColors.nimbus,
    image: ImagePath.AILAAN_APP_COVER,
    coverUrl: ImagePath.AILAAN_APP_SCREENS,
    navSelectedTitleColor: AppColors.nimbusNavTitle,
    appLogoColor: AppColors.nimbusSelectedNavTitle,
    projectAssets: [
      ImagePath.AILAAN_APP_1,
      ImagePath.AILAAN_APP_2,
      ImagePath.AILAAN_APP_3,
      ImagePath.AILAAN_APP_4,
      ImagePath.AILAAN_APP_5,
      ImagePath.AILAAN_APP_6,
      ImagePath.AILAAN_APP_7,
    ],
    category: StringConst.AILAAN_APP_CATEGORY,
    portfolioDescription: StringConst.AILAAN_APP_DETAIL,
    isPublic: false,
    isOnPlayStore: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.AILAAN_APP_GITHUB_URL,
    playStoreUrl: StringConst.AILAAN_APP_PLAYSTORE_URL,
  );

  static ProjectItemData NOTIFYX = ProjectItemData(
    title: StringConst.NOTIFYX,
    subtitle: StringConst.NOTIFYX,
    platform: StringConst.NOTIFYX_PLATFORM,
    primaryColor: AppColors.notifyxcolor,
    image: ImagePath.NOTIFYX_COVER,
    coverUrl: ImagePath.NOTIFYX_SCREENS,
    navSelectedTitleColor: AppColors.notifyxSelectedNavTitle,
    appLogoColor: AppColors.notifyxSelectedNavTitle,
    projectAssets: [
      // ImagePath.NOTIFYX_1,
      ImagePath.NOTIFYX_2,
      ImagePath.NOTIFYX_3,
      ImagePath.NOTIFYX_4,
      ImagePath.NOTIFYX_5,
      ImagePath.NOTIFYX_6,
      ImagePath.NOTIFYX_7,
      ImagePath.NOTIFYX_8,
      ImagePath.NOTIFYX_9,
    ],
    category: StringConst.NOTIFYX_CATEGORY,
    portfolioDescription: StringConst.NOTIFYX_DETAIL,
    isPublic: true,
    isOnPlayStore: false,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.NOTIFYX_GITHUB_URL,
    playStoreUrl: StringConst.NOTIFYX_PLAYSTORE_URL,
  );

  static ProjectItemData LAZYSHARE = ProjectItemData(
    title: StringConst.LAZYSHARE,
    subtitle: StringConst.LAZYSHARE,
    platform: StringConst.LAZYSHARE_PLATFORM,
    primaryColor: AppColors.notifyxcolor,
    image: ImagePath.LAZYSHARE_COVER,
    coverUrl: ImagePath.LAZYSHARE_SCREENS,
    navSelectedTitleColor: AppColors.notifyxSelectedNavTitle,
    appLogoColor: AppColors.notifyxSelectedNavTitle,
    projectAssets: [
      // ImagePath.LAZYSHARE_1,
      ImagePath.LAZYSHARE_2,
      ImagePath.LAZYSHARE_3,
      ImagePath.LAZYSHARE_4,
      ImagePath.LAZYSHARE_5,
      ImagePath.LAZYSHARE_6,
      ImagePath.LAZYSHARE_7,
    ],
    category: StringConst.LAZYSHARE_CATEGORY,
    portfolioDescription: StringConst.LAZYSHARE_DETAIL,
    isPublic: true,
    isOnPlayStore: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.LAZYSHARE_GITHUB_URL,
    playStoreUrl: StringConst.LAZYSHARE_PLAYSTORE_URL,
  );

  static ProjectItemData SOCIALAPP = ProjectItemData(
    title: StringConst.SOCIALAPP,
    subtitle: StringConst.SOCIALAPP,
    platform: StringConst.SOCIALAPP_PLATFORM,
    primaryColor: AppColors.socialappcolor,
    image: ImagePath.SOCIALAPP_COVER,
    coverUrl: ImagePath.SOCIALAPP_SCREENS,
    navSelectedTitleColor: AppColors.socialappcolor,
    appLogoColor: AppColors.socialappcolor,
    projectAssets: [
      // ImagePath.SOCIALAPP_1,
      ImagePath.SOCIALAPP_2,
      ImagePath.SOCIALAPP_3,
      ImagePath.SOCIALAPP_4,
    ],
    category: StringConst.SOCIALAPP_CATEGORY,
    portfolioDescription: StringConst.SOCIALAPP_DETAIL,
    isPublic: true,
    isOnPlayStore: false,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.SOCIALAPP_GITHUB_URL,
    playStoreUrl: StringConst.SOCIALAPP_PLAYSTORE_URL,
  );

  static ProjectItemData CITIZENSAFETY = ProjectItemData(
    title: StringConst.CITIZENSAFETY,
    subtitle: StringConst.CITIZENSAFETY,
    platform: StringConst.CITIZENSAFETY_PLATFORM,
    primaryColor: AppColors.citizencolor,
    image: ImagePath.CITIZENSAFETY_COVER,
    coverUrl: ImagePath.CITIZENSAFETY_SCREENS,
    navSelectedTitleColor: AppColors.citizenNavTitle,
    appLogoColor: AppColors.citizenSelectedNavTitle,
    projectAssets: [
      // ImagePath.CITIZENSAFETY_1,
    ],
    category: StringConst.CITIZENSAFETY_CATEGORY,
    portfolioDescription: StringConst.CITIZENSAFETY_DETAIL,
    isPublic: true,
    isOnPlayStore: false,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.CITIZENSAFETY_GITHUB_URL,
    playStoreUrl: StringConst.CITIZENSAFETY_PLAYSTORE_URL,
  );

  static ProjectItemData DATINGAPP = ProjectItemData(
    title: StringConst.DATINGAPP,
    subtitle: StringConst.DATINGAPP,
    platform: StringConst.DATINGAPP_PLATFORM,
    primaryColor: AppColors.datingcolor,
    image: ImagePath.DATINGAPP_COVER,
    coverUrl: ImagePath.DATINGAPP_SCREENS,
    navSelectedTitleColor: AppColors.datingcolorNavTitle,
    appLogoColor: AppColors.datingcolorNavTitle,
    projectAssets: [
      // ImagePath.DATINGAPP_1,
      ImagePath.DATINGAPP_2,
    ],
    category: StringConst.DATINGAPP_CATEGORY,
    portfolioDescription: StringConst.DATINGAPP_DETAIL,
    isPublic: true,
    isOnPlayStore: false,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.DATINGAPP_GITHUB_URL,
    playStoreUrl: StringConst.DATINGAPP_PLAYSTORE_URL,
  );
}
