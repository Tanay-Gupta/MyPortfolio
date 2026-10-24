part of values;

/// ─────────────────────────────────────────────────────────────────────────────
/// PROJECTS CONTENT FILE
/// ─────────────────────────────────────────────────────────────────────────────
/// To add a new project:
///   1. Add its cover/screenshot image paths to lib/values/images.dart.
///   2. Copy one _ProjectEntry block below, paste it wherever you want it
///      in the list (order = display order on the Works page), fill in details.
///   3. Set showOnHome: true if it should also appear in the Home page preview.
/// No other file needs to change.
///
/// To reorder: move blocks up/down.
/// To hide from Home without removing: set showOnHome: false.
/// ─────────────────────────────────────────────────────────────────────────────

/// Internal wrapper that attaches a [showOnHome] flag to a [ProjectItemData].
class _ProjectEntry {
  const _ProjectEntry({required this.data, required this.showOnHome});
  final ProjectItemData data;
  final bool showOnHome;
}

class AppProjects {
  // ─── Master list (order = Works page order) ───────────────────────────────

  static final List<_ProjectEntry> _entries = [
    _ProjectEntry(
      showOnHome: true,
      data: ProjectItemData(
        title: 'ContestHunt',
        subtitle: 'Your one-stop shop for coding news, schedules, and reminders.',
        platform: 'Android.',
        category: 'Flutter',
        portfolioDescription:
            'ContestHunt brings all running and future coding contest, Hackathon and Bounty schedules between your hands from many different Platforms. We believe we can save your time and let you touch the information from different sites, in one app. ContestHunt App can set reminders for the upcoming coding contest so you don\'t miss any contest. This Application is designed to work in every Time Zone, giving you the correct contest time according to your TimeZone.',
        primaryColor: AppColors.nimbus,
        navSelectedTitleColor: AppColors.nimbusNavTitle,
        appLogoColor: AppColors.nimbusSelectedNavTitle,
        image: ImagePath.CONTESTHUNT_APP_COVER,
        coverUrl: ImagePath.CONTESTHUNT_APP_SCREENS,
        projectAssets: [
          ImagePath.CONTESTHUNT_APP_1,
          ImagePath.CONTESTHUNT_APP_2,
          ImagePath.CONTESTHUNT_APP_3,
          ImagePath.CONTESTHUNT_APP_4,
          ImagePath.CONTESTHUNT_APP_5,
        ],
        isPublic: false,
        isOnPlayStore: true,
        technologyUsed: 'Flutter',
        playStoreUrl: 'https://play.google.com/store/apps/details?id=com.miraidyo.contesthunt',
        gitHubUrl: '',
      ),
    ),

    _ProjectEntry(
      showOnHome: true,
      data: ProjectItemData(
        title: 'RoastMyResume',
        subtitle: 'Where Weak Resumes Get Fired Up!',
        platform: 'Web.',
        category: 'AI Tool / Resume Critique',
        portfolioDescription:
            'RoastMyResume is a witty and innovative web app built using Streamlit, designed to help users transform their dull resumes into interview-ready documents. It leverages the Gemini AI model via dspy to analyze, roast, and provide constructive feedback in a fun and engaging way.\n\n'
            'Key features include AI-powered resume roasting, intuitive UI, and PDF upload functionality. The app delivers not only humorous critiques but also actionable insights to help users improve their resumes and stand out to employers.\n\n'
            'With PyPDF2 for handling resume content and Streamlit for a responsive frontend, RoastMyResume is your AI-powered career advisor — with a sense of humor.',
        primaryColor: AppColors.datingcolor,
        navSelectedTitleColor: AppColors.datingcolorNavTitle,
        appLogoColor: AppColors.datingcolorNavTitle,
        image: ImagePath.ROASTMYRESUME_COVER,
        coverUrl: ImagePath.ROASTMYRESUME_COVER,
        projectAssets: [],
        isPublic: true,
        isOnPlayStore: false,
        technologyUsed: 'Python',
        playStoreUrl: '',
        gitHubUrl: 'https://roastmyresume.streamlit.app/',
      ),
    ),

    _ProjectEntry(
      showOnHome: true,
      data: ProjectItemData(
        title: 'NotifyX',
        subtitle: 'Stay organised and informed throughout your college life.',
        platform: 'Android.',
        category: 'Toolkit & Education',
        portfolioDescription:
            'Notifyx is a college app that helps students stay organized and informed. Notifyx is built using Flutter and Firebase, so it\'s fast, reliable, and secure. And since it\'s cloud-based, you can access it from anywhere. Whether you\'re a first-year student or a seasoned veteran, Notifyx is the perfect app to help you stay on top of your college life.',
        primaryColor: AppColors.notifyxcolor,
        navSelectedTitleColor: AppColors.notifyxSelectedNavTitle,
        appLogoColor: AppColors.notifyxSelectedNavTitle,
        image: ImagePath.NOTIFYX_COVER,
        coverUrl: ImagePath.NOTIFYX_SCREENS,
        projectAssets: [
          ImagePath.NOTIFYX_2,
          ImagePath.NOTIFYX_3,
          ImagePath.NOTIFYX_4,
          ImagePath.NOTIFYX_5,
          ImagePath.NOTIFYX_6,
          ImagePath.NOTIFYX_7,
        ],
        isPublic: true,
        isOnPlayStore: false,
        technologyUsed: 'Flutter',
        playStoreUrl: '',
        gitHubUrl: 'https://github.com/Tanay-Gupta/NotifyxCollegeApp',
      ),
    ),

    _ProjectEntry(
      showOnHome: true,
      data: ProjectItemData(
        title: 'The Social App',
        subtitle: 'Share your story, share your world.',
        platform: 'Android.',
        category: 'Social Media',
        portfolioDescription:
            'The Social App is built using Flutter, a modern cross-platform framework that allows developers to build beautiful, high-performance apps for both iOS and Android. The app is also built using Dart, a modern programming language that is fast, expressive, and scalable. And, the app uses JavaScript for some of its functionality, such as the chat feature.\n Socialite is a powerful and versatile social media app that is built using the latest technologies. If you\'re looking for a social media app that is both beautiful and functional, then Socialite is the perfect choice for you.',
        primaryColor: AppColors.socialappcolor,
        navSelectedTitleColor: AppColors.socialappcolor,
        appLogoColor: AppColors.socialappcolor,
        image: ImagePath.SOCIALAPP_COVER,
        coverUrl: ImagePath.SOCIALAPP_SCREENS,
        projectAssets: [
          ImagePath.SOCIALAPP_2,
          ImagePath.SOCIALAPP_3,
          ImagePath.SOCIALAPP_4,
        ],
        isPublic: true,
        isOnPlayStore: false,
        technologyUsed: 'Flutter',
        playStoreUrl: '',
        gitHubUrl: 'https://github.com/Tanay-Gupta/The-Social-App',
      ),
    ),

    _ProjectEntry(
      showOnHome: true,
      data: ProjectItemData(
        title: 'Citizen Safety App (UI)',
        subtitle: 'Kavach: Protect yourself from cybercrime.',
        platform: 'Android.',
        category: 'Toolkit',
        portfolioDescription:
            'Citizen safety app (UI). This App was developed during Kavach Hackathon. This App helps to flag malicious/ fraud indicators in real-time. The app will search the Mobile Number, SMS header, url links related data through the given database of suspects as fraud provided by Indian Cyber Crime Coordination Center (currently demo data) in real time. Through SVM algorithms in ML, live tracking and prediction of malicious data will be done through the app for the data which is not present in the database. On finding suspected link, number, header, UPI address etc. the app will notify the user before accessing that particular data and even it will provide option to mark as \'fraud\'. This mark can be used for updation in database.',
        primaryColor: AppColors.citizencolor,
        navSelectedTitleColor: AppColors.citizenNavTitle,
        appLogoColor: AppColors.citizenSelectedNavTitle,
        image: ImagePath.CITIZENSAFETY_COVER,
        coverUrl: ImagePath.CITIZENSAFETY_SCREENS,
        projectAssets: [],
        isPublic: true,
        isOnPlayStore: false,
        technologyUsed: 'Flutter',
        playStoreUrl: '',
        gitHubUrl: 'https://github.com/Tanay-Gupta/CitizenSafetyApp',
      ),
    ),

    _ProjectEntry(
      showOnHome: true,
      data: ProjectItemData(
        title: 'LazyShare',
        subtitle: 'Want to save time while dealing with boomers at your nearest cyber cafes?',
        platform: 'Android.',
        category: 'Toolkit',
        portfolioDescription:
            'LazyShare helps you to chat with someone directly on WhatsApp without saving phone numbers. Just enter their phone number and you\'re ready to go.',
        primaryColor: AppColors.notifyxcolor,
        navSelectedTitleColor: AppColors.notifyxSelectedNavTitle,
        appLogoColor: AppColors.notifyxSelectedNavTitle,
        image: ImagePath.LAZYSHARE_COVER,
        coverUrl: ImagePath.LAZYSHARE_SCREENS,
        projectAssets: [
          ImagePath.LAZYSHARE_2,
          ImagePath.LAZYSHARE_3,
          ImagePath.LAZYSHARE_4,
          ImagePath.LAZYSHARE_5,
          ImagePath.LAZYSHARE_6,
          ImagePath.LAZYSHARE_7,
        ],
        isPublic: true,
        isOnPlayStore: true,
        technologyUsed: 'Flutter',
        playStoreUrl: 'https://play.google.com/store/apps/details?id=com.tandroidapps.lazyshare',
        gitHubUrl: 'https://github.com/Tanay-Gupta/LazyShare',
      ),
    ),

    _ProjectEntry(
      showOnHome: false,
      data: ProjectItemData(
        title: 'Dating App Authentication UI',
        subtitle: 'Simple and elegant UI.',
        platform: 'Android.',
        category: 'Social',
        portfolioDescription:
            'This Flutter app provides a simple and elegant way to authenticate users into a dating app. The app consists of three screens: login, signup, and welcome.\nThe login screen allows users to sign in with their email address and password. The signup screen allows users to create a new account by providing their email address, password, and other personal information. The welcome screen shows options for login or signup, so users can easily switch between the two.\nThe app uses a modern and minimalist design that is both easy to use and visually appealing.',
        primaryColor: AppColors.datingcolor,
        navSelectedTitleColor: AppColors.datingcolorNavTitle,
        appLogoColor: AppColors.datingcolorNavTitle,
        image: ImagePath.DATINGAPP_COVER,
        coverUrl: ImagePath.DATINGAPP_SCREENS,
        projectAssets: [
          ImagePath.DATINGAPP_2,
        ],
        isPublic: true,
        isOnPlayStore: false,
        technologyUsed: 'Flutter',
        playStoreUrl: '',
        gitHubUrl: 'https://github.com/Tanay-Gupta/DatingAppAuthenticationUi',
      ),
    ),
  ];

  // ─── Noteworthy / side projects ──────────────────────────────────────────
  // Add new noteworthy entries here — no other file needs to change.

  static final List<NoteWorthyProjectDetails> noteworthy = [
    NoteWorthyProjectDetails(
      projectName: 'LeetCode Submissions',
      isPublic: true,
      isOnPlayStore: false,
      isWeb: true,
      technologyUsed: 'Java',
      projectDescription: 'Collection of LeetCode questions to ace the coding interview!',
      gitHubUrl: 'https://github.com/Tanay-Gupta/LeetCodeSubmissions',
      webUrl: 'https://github.com/Tanay-Gupta/LeetCodeSubmissions',
      isLive: true,
    ),
  ];

  // ─── Derived lists consumed by the rest of the app ───────────────────────

  /// Full list shown on the Works page.
  static List<ProjectItemData> get all =>
      _entries.map((e) => e.data).toList();

  /// Subset shown on the Home page preview (showOnHome: true entries only).
  static List<ProjectItemData> get recentWorks =>
      _entries.where((e) => e.showOnHome).map((e) => e.data).toList();
}
