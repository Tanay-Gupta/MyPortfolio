part of values;

/// ─────────────────────────────────────────────────────────────────────────────
/// ABOUT PAGE CONTENT FILE
/// ─────────────────────────────────────────────────────────────────────────────
/// Everything shown on the About page lives here. To update any content:
///   • Header taglines  → edit the strings inside [AppAbout.header]
///   • Story paragraphs → edit [AppAbout.storyParagraphs]
///   • Tech stacks      → edit [AppAbout.languages] / [AppAbout.frameworks]
///   • Social links     → edit [AppAbout.socialLinks]
///   • Coding profiles  → edit [AppAbout.codingProfiles]
///   • Quote / misc     → edit the constants at the bottom of [AppAbout]
/// No other file needs to change.
/// ─────────────────────────────────────────────────────────────────────────────

class AppAbout {
  // ─── Header taglines (shown on About page hero) ───────────────────────────

  static const List<String> headerLines = [
    'I build practical AI solutions and software systems',
    'working across AI platforms, backend development, and cloud technologies.',
    'Currently an AI Platform Engineer at IBM,',
    'while pursuing my M.Tech in AI & Machine Learning at BITS Pilani.',
  ];

  // ─── Story section ────────────────────────────────────────────────────────

  static const String storySectionLabel = 'Story';
  static const String storyTitle = 'A little bit about myself.';

  /// Each entry becomes its own animated paragraph block.
  static const List<String> storyParagraphs = [
    "Hey, I'm Tanay — a software engineer who enjoys turning ideas into things that actually work. My interests lie at the intersection of AI, software engineering, and cloud platforms. I like understanding how things work under the hood, building useful applications, and finding ways to make complex systems simpler.",

    "I'm currently an AI Platform Engineer at IBM, working with watsonx and enterprise AI solutions. My work involves building proofs of concept, integrating platforms and services, setting up environments, and validating solutions against real-world requirements. I've also worked at Accenture and MAQ Software, gaining experience across application development and software engineering. These experiences have helped me look beyond just writing code and think about how a solution fits into the bigger picture.",

    "Alongside work, I'm pursuing an M.Tech in Artificial Intelligence and Machine Learning at BITS Pilani. I'm interested in exploring how AI can be applied to real problems, particularly through AI-powered applications, intelligent workflows, and scalable systems. For me, the exciting part isn't just experimenting with a new technology — it's figuring out how to make it genuinely useful.",

    "Outside work, I enjoy coding on personal projects, learning new technologies, and exploring new places whenever I get the chance. I also enjoy music, gaming, and exploring ideas that might turn into my next side project. I'm always happy to connect with people who enjoy building, learning, and figuring things out along the way.",
  ];

  // ─── Technology section ───────────────────────────────────────────────────

  static const String technologySectionLabel = 'Technology';
  static const String technologyTitle = 'What I Work With';
  static const String technologyDescription =
      'I enjoy working across the software stack, from building applications and backend services to exploring AI platforms and cloud infrastructure. These are some of the languages, frameworks, and tools I have worked with through professional projects, learning, and personal experiments.';

  static const String languagesSectionTitle = 'Programming Languages';
  static const String frameworksSectionTitle = 'Frameworks & Other Technologies';

  /// Programming languages shown in the left column of the tech grid.
  static const List<String> languages = [
    'Python',
    'Java',
    'Dart',
    'JavaScript',
    'SQL',
    'Go',
    'C++',
  ];

  /// Frameworks / tools shown in the right column of the tech grid.
  static const List<String> frameworks = [
    'IBM watsonx',
    'Flutter',
    'React.js',
    'Spring Boot',
    'LangChain',
    'REST APIs',
    'GraphQL',
    'Django',
    'Flask',
    'AWS',
    'Google Cloud',
    'Docker',
    'Kubernetes',
    'Apache Airflow',
    'PostgreSQL',
    'MongoDB',
    'Redis',
    'TensorFlow',
    'PyTorch',
    'scikit-learn',
    'Pandas',
    'NumPy',
    'Git',
    'Linux',
  ];

  // ─── Coding profiles (shown in the Coding section) ───────────────────────

  static final List<SocialData> codingProfiles = [
    SocialData(
      name: 'LeetCode | tanx4',
      iconData: FontAwesomeIcons.code,
      url: 'https://leetcode.com/tanx4/',
    ),
    SocialData(
      name: 'HackerRank | tanaywhocodes',
      iconData: FontAwesomeIcons.hackerrank,
      url: 'https://hackerrank.com/tanaywhocodes/',
    ),
    SocialData(
      name: 'CodeChef | tanaywhocodes',
      iconData: FontAwesomeIcons.code,
      url: 'https://www.codechef.com/users/tanaywhocodes',
    ),
  ];

  // ─── Social links (shown in the Contact section of About) ────────────────

  static final List<SocialData> socialLinks = [
    SocialData(
      name: 'LinkedIn',
      iconData: FontAwesomeIcons.linkedin,
      url: 'https://www.linkedin.com/in/tanay--gupta',
    ),
    SocialData(
      name: 'Instagram',
      iconData: FontAwesomeIcons.instagram,
      url: 'https://www.instagram.com/tanaywhocodes',
    ),
  ];

  // ─── Closing quote ────────────────────────────────────────────────────────

  static const String quote =
      'I enjoy solving real problems with technology. If you have an idea worth building, let\'s talk.';
  static const String quoteAuthor = 'Tanay Gupta';

  // ─── Section / label strings ─────────────────────────────────────────────

  static const String codingSectionLabel = 'Coding';
  static const String codingSectionTitle = 'Coding Profile';
  static const String contactSectionLabel = 'Contact';
  static const String contactSectionSocialTitle = 'Social.';
  static const String contactSectionEmailTitle = 'Email.';
  static const String workTogether = "Let's build something useful.";
  static const String availableFor =
      'Open to Interesting AI, Software Engineering & Collaboration Opportunities';
  static const String sayHello = 'Say Hello';
}