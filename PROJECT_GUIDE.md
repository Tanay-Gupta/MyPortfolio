# Portfolio Project Guide (for developers and AI assistants)

A Flutter **web** portfolio for **Tanay Gupta**. Package name: `tanay_gupta_portfolio`.
It is based on the open-source "Aerium" portfolio template (the root widget is still called `Aerium`).
The site is a multi-page, animated, responsive SPA.

This document explains how the project is structured and gives **step-by-step recipes for the most common updates**.
Verify every claim against the code. Section 12 lists known issues.

---

## 1. Quick facts

| Item | Value |
|---|---|
| App entry | [`lib/main.dart`](lib/main.dart) |
| Target platform | Web (android/ios/macos folders are only default Flutter scaffolding) |
| State management | Local `StatefulWidget` + `AnimationController`s. `flutter_bloc` is used only for the contact form |
| DI | `get_it` ([`lib/injection_container.dart`](lib/injection_container.dart)) |
| Routing | Named routes via a custom regex router ([`lib/presentation/routes/routes.dart`](lib/presentation/routes/routes.dart)) |
| URL strategy | `PathUrlStrategy` (clean URLs, no `#`) in [`lib/configure_web.dart`](lib/configure_web.dart) |
| Responsive system | `layout` + `responsive_builder` packages, wrapped by helpers in [`lib/core/layout/adaptive.dart`](lib/core/layout/adaptive.dart) |
| Fonts | `VisueltPro` (local asset, declared in `pubspec.yaml`) and `GoogleFonts.roboto` |
| Hosting | Cloudflare Workers static assets ([`wrangler.jsonc`](wrangler.jsonc)) serving `build/web` |
| Build script | [`build.sh`](build.sh) installs Flutter 3.47.7 on Linux and runs `flutter build web --release` |
| Dart SDK constraint | `>=3.0.0 <4.0.0` |

---

## 2. Repository layout

```
MyPortfolio/
├── lib/                      # All Dart source (see section 3)
├── assets/
│   ├── fonts/                # VisueltPro-*.ttf (+ Circe.otf, unused)
│   └── images/               # Common images, certificate images, CV PDF
│       └── projects/<name>/  # Per-project screenshots (1.png, 2.png, ...)
├── web/                      # index.html, manifest.json, favicon, icons
├── docs/                     # STALE prebuilt web output (old GitHub Pages deploy). Do NOT edit by hand
├── build.sh                  # CI build for Cloudflare
├── wrangler.jsonc            # Cloudflare Workers asset config
├── pubspec.yaml              # Dependencies, assets, fonts
├── analysis_options.yaml     # flutter_lints defaults
├── android/ ios/ macos/      # Unused scaffolding
└── PROJECT_GUIDE.md          # This file
```

`.gitignore` excludes `/build/`, so the deploy output is generated in CI and is not committed.

---

## 3. `lib/` architecture

```
lib/
├── main.dart                 # runApp(Aerium) -> Layout -> MaterialApp
├── app_theme.dart            # ThemeData, ColorScheme, TextTheme
├── configure_web.dart        # setUrlStrategy(PathUrlStrategy())
├── injection_container.dart  # get_it registrations
│
├── core/
│   ├── layout/adaptive.dart  # Breakpoints + responsiveSize/assignWidth/... helpers
│   └── utils/
│       ├── extensions.dart   # String.isValidEmail()
│       └── functions.dart    # Functions.launchUrl, textSize, navigateToProject
│
├── values/                   # ONE Dart library ("values") split via `part` files.
│   ├── values.dart           #   library root + imports + `part` list
│   ├── experiences.dart      #   ★ AppExperiences.all  — edit this to update work history
│   ├── projects.dart         #   ★ AppProjects         — edit this to add/update projects
│   ├── about.dart            #   ★ AppAbout            — edit this to update About page content
│   ├── strings.dart          #   StringConst: routes, nav labels, contact strings, home strings, social URLs
│   ├── data.dart             #   Data: thin adapter — getters only, delegates to the three ★ files above
│   ├── images.dart           #   ImagePath: asset path constants
│   ├── docs.dart             #   DocumentPath.CV
│   ├── colors.dart           #   AppColors
│   ├── sizes.dart            #   Sizes (TEXT_SIZE_*, SIZE_*, HEIGHT_*, PADDING_* ...)
│   ├── styles.dart / borders.dart / decoration.dart / gradients.dart / animations.dart
│
├── infrastructure/           # Contact-form backend plumbing
│   ├── api/                  #   email_api.dart, email_repository.dart, email_model.dart
│   ├── bloc/                 #   email_bloc/event/state (+ generated *.freezed.dart)
│   └── failures/             #   email_failure.dart (+ generated *.freezed.dart)
│
└── presentation/
    ├── routes/routes.dart    # Route table + NoAnimationMaterialPageRoute
    ├── pages/                # One folder or file per screen
    │   ├── home/             #   home_page.dart + widgets/ (header, loading_page, scroll_down)
    │   ├── about/            #   about_page.dart + widgets/ (about_header, technology_section)
    │   ├── works/            #   works_page.dart + widgets/noteworthy_projects.dart
    │   ├── project_detail/   #   project_detail_page.dart + widgets/ (about_project, next_project)
    │   ├── experience_page.dart
    │   ├── certification_page.dart   (route exists, nav entry disabled)
    │   ├── contact_page.dart
    │   └── widgets/          #   Page-level shared widgets: nav_bar, footers, socials, page_header, sliding_banner
    └── widgets/              # Generic reusable widgets (buttons, animated text, page_wrapper,
                              #   project_item, nav_item, app_drawer, app_logo, spacers ...)
```

### Important convention: the `values` library
Everything under `lib/values/` is a single library. Import **only** `package:tanay_gupta_portfolio/values/values.dart`.
Never import `strings.dart`, `data.dart`, etc. directly, because they use `part of values;`.
When you add a new file there, add a matching `part 'xxx.dart';` line in `values.dart`.

Imports use the package form: `package:tanay_gupta_portfolio/...`.

---

## 4. Content model: where data lives

The site is **data-driven**. Most content updates only touch **three dedicated content files** in `lib/values/`. You should never need to touch a widget file just to change text, add a job, or add a project.

| Content | Edit this file | Class / getter | Consumed by |
|---|---|---|---|
| **Work experience** | [`lib/values/experiences.dart`](lib/values/experiences.dart) | `AppExperiences.all` | `Data.experienceData` → `experience_page.dart` |
| **Projects (Works page)** | [`lib/values/projects.dart`](lib/values/projects.dart) | `AppProjects.all` | `Data.projects` → `works_page.dart` |
| **Projects (Home preview)** | same file, `showOnHome: true` flag | `AppProjects.recentWorks` | `Data.recentWorks` → `home_page.dart` |
| **Noteworthy side projects** | same file, `AppProjects.noteworthy` list | `AppProjects.noteworthy` | `works/widgets/noteworthy_projects.dart` |
| **About page — all content** | [`lib/values/about.dart`](lib/values/about.dart) | `AppAbout.*` | `about_page.dart`, `about_header.dart`, `technology_section.dart`, `animated_footer.dart` |
| Programming languages | `about.dart` → `AppAbout.languages` | `Data.mobileTechnologies` getter | `technology_section.dart` |
| Frameworks / other tech | `about.dart` → `AppAbout.frameworks` | `Data.otherTechnologies` getter | `technology_section.dart` |
| Social icons (footer, drawer) | `about.dart` → `AppAbout.socialLinks` | `Data.socialData2` getter | footers, drawer |
| Coding profiles (About page) | `about.dart` → `AppAbout.codingProfiles` | `Data.socialData3` getter | `about_page.dart` |
| Social icons (home header) | `data.dart` → `Data.socialData1` | — | `home_page_header.dart` |
| Social icons (simple footer) | `data.dart` → `Data.socialData` | — | `simple_footer.dart` |
| Nav menu | `data.dart` → `Data.menuItems` | — | `nav_bar.dart`, `app_drawer.dart`, `page_wrapper.dart` |
| Certifications | `data.dart` → `Data.certificationData` | — | `certification_page.dart` |
| Routes, page titles, misc strings | [`lib/values/strings.dart`](lib/values/strings.dart) | `StringConst` | everywhere |
| Image paths | [`lib/values/images.dart`](lib/values/images.dart) | `ImagePath` | everywhere |
| Resume PDF path | [`lib/values/docs.dart`](lib/values/docs.dart) | `DocumentPath.CV` | `nav_bar.dart` "Resume" button |
| Colors | [`lib/values/colors.dart`](lib/values/colors.dart) | `AppColors` | everywhere |

> **`data.dart` is now a thin adapter layer.** `Data.experienceData`, `Data.projects`, `Data.recentWorks`, `Data.noteworthyProjects`, `Data.mobileTechnologies`, `Data.otherTechnologies`, `Data.socialData2`, and `Data.socialData3` are all one-liner getters that delegate to `AppExperiences`, `AppProjects`, and `AppAbout`. Do not add content back into `data.dart`.

### Data model classes (defined in widget files / `data.dart`)
- `ProjectItemData` — defined in [`presentation/widgets/project_item.dart`](lib/presentation/widgets/project_item.dart).
  Required fields: `title, image, coverUrl, subtitle, portfolioDescription, platform, primaryColor, category`.
  Optional fields: `designer, projectAssets (List<String>), technologyUsed, isPublic, isOnPlayStore, isLive, gitHubUrl, playStoreUrl, webUrl, navTitleColor, navSelectedTitleColor, appLogoColor`.
- `ExperienceData` — fields: `company, companyUrl, position, roles (List<String>), location, duration`.
- `CertificationData` — fields: `title, image, imageSize, url, awardedBy`.
- `NoteWorthyProjectDetails` — fields: `projectName, isPublic, isOnPlayStore, isWeb, isLive, technologyUsed, projectDescription, gitHubUrl, webUrl, playStoreUrl`.
- `SocialData` — defined in [`presentation/pages/widgets/socials.dart`](lib/presentation/pages/widgets/socials.dart): `name, iconData (FaIconData), url, color`. Render with `FaIcon`, **not** `Icon`.
- `NavItemData` — defined in [`presentation/widgets/nav_item.dart`](lib/presentation/widgets/nav_item.dart): `name, route`.

### Naming conventions in this codebase
- `StringConst` and `ImagePath` use `UPPER_SNAKE_CASE`. Keep this style for anything new added to those files.
- Content in the three new files (`experiences.dart`, `projects.dart`, `about.dart`) uses plain Dart string literals inside class bodies — no naming convention required; just be descriptive.
- `flutter_feather_icons` has been **removed** (unmaintained). Use `FontAwesomeIcons.*` (`FaIconData`) and `FaIcon` from `font_awesome_flutter ^11.0.0`. Material `Icons.*` are fine for non-social UI icons (hamburger menu, close button, etc.).

---

## 5. Routing and navigation

Routes are string constants in `StringConst` (`HOME_PAGE="/home"`, `ABOUT_PAGE="/about"`, `WORKS_PAGE="/works"`, `EXPERIENCE_PAGE="/experience"`, `CONTACT_PAGE="/contact"`, `PROJECT_DETAIL_PAGE="/project-detail"`, `CERTIFICATION_PAGE="/certifications"`).

Each page class exposes a static route constant, for example `AboutPage.aboutPageRoute`.

Flow:
1. `main.dart` sets `initialRoute: HomePage.homePageRoute` and `onGenerateRoute: RouteConfiguration.onGenerateRoute`.
2. `RouteConfiguration.paths` is an ordered list of `Path(regex, builder)`. The first match wins and uses `RegExp(r'^' + route)` with `hasMatch`.
   Because it is a prefix match, order matters (`/project-detail` is listed before nothing that would shadow it, and `/home` is last).
3. Pages are wrapped in `NoAnimationMaterialPageRoute`, so there are no default transitions. The custom "slider" animation happens inside `PageWrapper`.
4. Project details are opened with `Functions.navigateToProject(...)`, which pushes `/project-detail` with `ProjectDetailArguments` (data, dataSource, currentIndex, nextProject, hasNextProject). `ProjectDetailPage` reads them from `ModalRoute.settings.arguments`.
   Opening `/project-detail` directly (deep link or refresh) crashes because arguments are null (see section 12).
5. The nav bar on desktop calls `PageWrapper.onNavItemWebTap`, which plays the slide-out animation and then `pushNamed(route)`.

### Page skeleton (every page follows this)
```dart
class XPage extends StatefulWidget {
  static const String xPageRoute = StringConst.X_PAGE;
  ...
}
class _XPageState extends State<XPage> with TickerProviderStateMixin {
  late AnimationController _controller; // passed as navBarAnimationController
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      selectedRoute: XPage.xPageRoute,
      selectedPageName: StringConst.X,
      navBarAnimationController: _controller,
      onLoadingAnimationDone: () => _controller.forward(), // starts the page's entrance animations
      child: ListView(children: [ ...content..., SimpleFooter() ]),
    );
  }
}
```
`PageWrapper` supplies the Scaffold, drawer, `NavBar`, and the two `LoadingSlider` overlays (the reveal and exit animations).

---

## 6. Responsiveness

Use the helpers in [`adaptive.dart`](lib/core/layout/adaptive.dart). Do not hard-code pixel sizes for layout.

- `responsiveSize(context, xs, lg, {sm, md, xl})` returns a `double` picked by breakpoint from `layout`'s `context.layout.value`.
  If `sm` is missing it falls back to `md ?? xs`. `md` falls back to `lg`.
- `assignWidth(context, fraction)` and `assignHeight(context, fraction)` return a fraction of the screen.
- `widthOfScreen` and `heightOfScreen` return the raw size.
- `isDisplayMobile`, `isDisplayMobileOrTablet`, `isDisplayDesktop`, `isDisplaySmallDesktop` return booleans.
- Nav switches to the mobile bar and drawer when width `<= RefinedBreakpoints().tabletNormal`.

Large and small variants of widgets exist side by side. For example, `ProjectItemLg` and `ProjectItemSm` are chosen in `works_page.dart` and `home_page.dart` via `ResponsiveBuilder`. When you change one, check the other.

---

## 7. Theming and styling

- `AppTheme.lightThemeData` is the only theme (light). Defined in [`app_theme.dart`](lib/app_theme.dart).
- Text styles come from `Theme.of(context).textTheme` (`displayMedium`, `bodyLarge`, `titleMedium`, ...) and are then tweaked with `.copyWith(...)`. Fonts are `VisueltPro` (`StringConst.VISUELT_PRO`) and `GoogleFonts.roboto`.
- Colors come from `AppColors`. Each project has its own accent colors (`primaryColor`, `navSelectedTitleColor`, `appLogoColor`) that tint the project detail page and nav bar.
- Sizes come from `Sizes.*`. Prefer adding a constant to `sizes.dart` over inline numbers.
- The logo text is "TG" (`AppLogo`, `title = "TG"`).

---

## 8. Contact form / backend (infrastructure layer)

Chain: `ContactPage` -> `EmailBloc` -> `EmailRepository` -> `EmailApi` -> HTTP POST.

- Registration in `injection_container.dart`: `EmailBloc` (factory), `EmailRepository` and `EmailApi` (lazy singletons), `http.Client` (lazy singleton).
- Endpoint: `StringConst.BASE_URL + StringConst.GET_IN_TOUCH_POINT`. `BASE_URL` is currently an **empty string**, so the form cannot work until it is set (see section 12).
- Request body: JSON `{name, email, subject, message}`. Success means HTTP 200.
- `EmailEvent`, `EmailState` and `EmailFailure` use `freezed`. Generated files `*.freezed.dart` are committed. Regenerate them with `dart run build_runner build --delete-conflicting-outputs` after editing the annotated classes.
- Page-side validation lives in `ContactPage` (`isNameValid`, `isEmailValid`, ...). The email regex is in `core/utils/extensions.dart`.

---

## 9. Common update recipes

### 9.1 Add a new project (most frequent task)

**You only touch two files: `images.dart` and `projects.dart`.** No `strings.dart` or `data.dart` changes needed.

1. **Images**: create `assets/images/projects/<folder>/` and add `1.png` (cover) plus further screenshots.
2. **Register the folder** in `pubspec.yaml` under `flutter: assets:`, for example `- assets/images/projects/<folder>/`. Flutter does **not** recurse into sub-folders, so this line is mandatory.
3. **`lib/values/images.dart`** — add path constants following the existing pattern:
   ```dart
   // myapp
   static const String MYAPP_COVER   = "$projectsDir/<folder>/1.png";
   static const String MYAPP_SCREENS = "$projectsDir/<folder>/1.png"; // hero on detail page
   static const String MYAPP_1       = "$projectsDir/<folder>/1.png";
   static const String MYAPP_2       = "$projectsDir/<folder>/2.png";
   ```
4. **`lib/values/projects.dart`** — copy any `_ProjectEntry` block, paste it wherever you want it in `AppProjects._entries` (order = Works page order), and fill in details:
   ```dart
   _ProjectEntry(
     showOnHome: true,           // true  → also shown on Home page preview
     data: ProjectItemData(
       title: 'MyApp',
       subtitle: 'One-liner description.',
       platform: 'Web.',
       category: 'Productivity',
       portfolioDescription: 'Long description. Use \\n\\n for paragraphs.',
       primaryColor: AppColors.notifyxcolor,
       navSelectedTitleColor: AppColors.notifyxSelectedNavTitle,
       appLogoColor: AppColors.notifyxSelectedNavTitle,
       image: ImagePath.MYAPP_COVER,
       coverUrl: ImagePath.MYAPP_SCREENS,
       projectAssets: [ImagePath.MYAPP_2],
       isPublic: true,           // shows "Source Code" button (uses gitHubUrl)
       isOnPlayStore: false,     // shows Google Play button (uses playStoreUrl)
       isLive: false,            // shows "Launch App" button (uses webUrl)
       technologyUsed: 'Flutter',
       gitHubUrl: 'https://github.com/...',
       playStoreUrl: '',
     ),
   ),
   ```
5. Colors: reuse an `AppColors` entry or add new ones in `colors.dart`.

**That's it.** `Data.projects`, `Data.recentWorks`, and `Data.noteworthyProjects` are auto-derived from `AppProjects`.

Gotchas:
- `_entries` is a `static final List` initialised once. **Hot reload will not refresh it; use hot restart.**
- Project image assets fail silently (blank image) if the path is wrong. Check `pubspec.yaml` and filename case.
- The Home page height is computed from `recentWorks.length`; no manual change needed.

### 9.2 Add a "noteworthy" small project

**Only touch `lib/values/projects.dart`.** Append a `NoteWorthyProjectDetails(...)` to `AppProjects.noteworthy`:

```dart
NoteWorthyProjectDetails(
  projectName: 'My Side Project',
  isPublic: true,
  isOnPlayStore: false,
  isWeb: true,
  isLive: true,
  technologyUsed: 'Python',
  projectDescription: 'Short description.',
  gitHubUrl: 'https://github.com/...',
  webUrl: 'https://...',
),
```

`isPublic` shows the GitHub link; `isLive` shows the web link. No `strings.dart` or `data.dart` changes needed.

### 9.3 Add or edit work experience

**Only touch `lib/values/experiences.dart`.** Copy any `ExperienceData` block, paste it at the **top** of `AppExperiences.all` (most-recent first), and fill in details:

```dart
ExperienceData(
  company: 'Acme Corp',
  position: 'Senior Engineer',
  companyUrl: 'https://acme.com',
  location: 'Remote',
  duration: 'Jan 2026 - Present',
  roles: [
    'Built X, resulting in Y.',
    'Led Z initiative.',
  ],
),
```

- **Order matters.** The page renders entries top-to-bottom, so keep the newest first.
- When a role ends, change `"Present"` to the end month/year.
- `experience_page.dart` generates its `AnimationController` list from `AppExperiences.all.length` automatically — no code change needed regardless of how many entries exist.

No `strings.dart` or `data.dart` changes needed.

### 9.4 Add or remove a technology

**Only touch `lib/values/about.dart`.**

- **Programming Languages** column → edit `AppAbout.languages` (a `List<String>`).
- **Frameworks & Other Technologies** column → edit `AppAbout.frameworks`.

The section heading strings are `AppAbout.languagesSectionTitle` and `AppAbout.frameworksSectionTitle` in the same file. No `data.dart` or widget changes needed.

### 9.5 Update personal info, bio, and links

| What | Where |
|---|---|
| Hero tagline, intro text | `StringConst.HI`, `DEV_INTRO`, `DEV_TITLE`, `DEV_DESC` in `strings.dart` |
| About page header taglines | `AppAbout.headerLines` in `about.dart` |
| About page story paragraphs | `AppAbout.storyParagraphs` in `about.dart` |
| Tech stacks | `AppAbout.languages` / `AppAbout.frameworks` in `about.dart` |
| Closing quote | `AppAbout.quote` / `AppAbout.quoteAuthor` in `about.dart` |
| Social links (About page) | `AppAbout.socialLinks` in `about.dart` |
| Coding profiles (About page) | `AppAbout.codingProfiles` in `about.dart` |
| Email address | `StringConst.EMAIL_VALUE` **and** `StringConst.DEV_EMAIL` in `strings.dart` — update both |
| Footer copyright year | `StringConst.COPYRIGHT` in `strings.dart` (currently hard-coded "© 2025") |
| Portrait image | `ImagePath.DEV` → `assets/images/tanay_gupta.png`; replace the file |
| Social icons (simple footer, drawer) | `Data.socialData` / `socialData1` in `data.dart` — these two lists were **not** migrated |

> `AppAbout.socialLinks` feeds `Data.socialData2` (About page) and `AppAbout.codingProfiles` feeds `Data.socialData3` — these are one-liner getters in `data.dart`. The footer/drawer/home-header social lists (`socialData`, `socialData1`) are still in `data.dart` directly.

### 9.6 Replace the resume
Overwrite `assets/images/tanay-gupta-cv.pdf`. `DocumentPath.CV` is `"assets/assets/images/tanay-gupta-cv.pdf"`.
The doubled `assets/assets` is deliberate: on the web, Flutter serves bundled assets under `/assets/<declared path>`, so the file lives at `/assets/assets/images/...`.
`Functions.launchUrl` opens it in a new tab. Do not "fix" the doubled prefix.

### 9.7 Add a new page
1. Create `lib/presentation/pages/<name>/<name>_page.dart` following the skeleton in section 5.
2. Add `static const String <NAME>_PAGE = "/<name>";` to the routes section of `strings.dart`, plus a title constant.
3. Add `static const String <name>PageRoute = StringConst.<NAME>_PAGE;` in the page class.
4. Register a `Path(r'^' + XPage.xPageRoute, (context, matches) => const XPage())` in `RouteConfiguration.paths`. Place it before any route whose pattern is a prefix of it.
5. Add `NavItemData(name: StringConst.X, route: StringConst.X_PAGE)` to `Data.menuItems`. This updates the desktop nav and the mobile drawer.
6. Finish the page with `SimpleFooter()` or `AnimatedFooter()`.

### 9.8 Re-enable the Certifications page
The route and page already exist. In `Data.menuItems`, uncomment the `StringConst.CERTIFICATIONS` entry.
Add certifications to `Data.certificationData`. Images go in `assets/images/` and are referenced via `ImagePath.*_CERT`.
The TODO in `main.dart` mentions adding a Udacity cloud certificate.

### 9.9 Change theme, colors, fonts
- Colors: edit `lib/values/colors.dart`.
- Typography: edit `_textTheme` in `app_theme.dart`.
- New local font: add files under `assets/fonts/`, declare the family in `pubspec.yaml` (the `fonts:` section), then reference the family name as a `StringConst`.
- Page title in the browser tab: `StringConst.APP_TITLE` (used by `MaterialApp.title`). Note `web/index.html` still has the generic `<title>tanay_gupta_portfolio</title>` and `description "A new Flutter project."`, so update these for SEO.

### 9.10 Update dependencies
- Run `flutter pub outdated`, then `flutter pub upgrade --major-versions`.
- The environment is old-style. `url_launcher` is called via the deprecated `launch()` in `functions.dart`, and `WidgetsBinding.instance!` is used in `page_wrapper.dart`. Newer Flutter versions may flag or break these (see section 12).
- After changing `freezed` or `freezed_annotation`, regenerate code: `dart run build_runner build --delete-conflicting-outputs`.

---

## 10. Build, run, deploy

```bash
flutter pub get
flutter run -d chrome                  # dev
flutter build web --release            # output: build/web
flutter analyze
```

Deployment (current): Cloudflare. `build.sh` downloads Flutter **3.47.7** (Linux) and builds. `wrangler.jsonc` serves `./build/web` with `not_found_handling: single-page-application`, which makes deep links like `/works` fall back to `index.html`.
The local Flutter may be newer than the CI version. Keep code compatible with both, or bump the version in `build.sh`.

The `docs/` folder is an old GitHub Pages build (`SITE_URL = https://tanay-gupta.github.io`). It is not part of the current pipeline. Do not hand-edit it; delete it or rebuild it deliberately.

`web/index.html` uses `$FLUTTER_BASE_HREF` and `flutter_bootstrap.js`, which require a recent Flutter. Do not replace it with an old-style template.

---

## 11. Assets checklist

- Every folder containing images must be listed in `pubspec.yaml` (`assets:` is non-recursive). Currently listed: `assets/images/`, plus `projects/` and each of `ailaan`, `lazyshare`, `cititzensafety` (the folder name is misspelt, matching the disk), `datingappauth`, `notifyx`, `thesocialapp`, `roastmyresume`, `contesthunt`.
- Font files listed in `pubspec.yaml` are only the 7 `VisueltPro` weights (Thin, ExtraLight, Light, Regular, Medium, Black, Bold). Italic files exist on disk but are not declared.
- Naming mismatch to remember: `FontWeight` mapping in `pubspec.yaml` has `Black` = 700 and `Bold` = 800.
- Several `ImagePath` constants point to files that don't exist (`vybz.jpg`, `playstore.png`, `ceasar-bust.png`, `meditation.png`, `about_portrait.png`, `dev-about.jpg`). They are unused; don't use them without adding the file.
- `ROASTMYRESUME` has only one image (`1.png`), so its `projectAssets` is empty (the album is blank).
- `NOTIFYX_8` and `NOTIFYX_9` reuse `6.png` and `7.png` (copy-paste, not new images).

---

## 12. Known issues and tech debt (check before assuming something works)

> Items marked ✅ are resolved. Items marked ⬜ are still open.

1. ⬜ **Contact form is non-functional.** `StringConst.BASE_URL` is `""`, so the POST goes to `/getintouch` on the same origin, which the static host doesn't serve. A `TODO:: Fix email service` is in `main.dart`. A backend is needed (previously `portfolio-api-chi.vercel.app/api/getintouch`, per a comment in `email_api.dart`), or switch to a service like Formspree or EmailJS. The API URL is not a secret, but never commit API keys. Use build-time `--dart-define` values.
2. ⬜ **`EmailBloc` is incompatible with `bloc ^8`.** It overrides `mapEventToState`, which was removed in bloc 8, and registers no `on<Event>` handler. The `@override @override` duplication also exists. `ContactPage` never receives state changes, so the success and failure snackbars never fire. Fix by registering `on<SendEmail>((event, emit) async {...})` and emitting states.
3. ⬜ **Missing direct dependencies in `pubspec.yaml`.** The code imports `package:http`, `package:bloc`, `package:meta`, and `flutter_web_plugins` (the last ships with the Flutter SDK, as `flutter_web_plugins: sdk: flutter`). `http` is currently available only transitively. Add `http`, `bloc` and `meta` explicitly (and `flutter_web_plugins` as an SDK dependency) to avoid `depend_on_referenced_packages` problems.
4. ⬜ **`/project-detail` cannot be deep-linked.** `ProjectDetailPage` force-casts route arguments to `ProjectDetailArguments`. A refresh on that URL throws. Consider using a `?id=` style path and looking up the project from `Data.projects`.
5. ⬜ **Deprecated API use**: `launch()` in `url_launcher` (use `launchUrl(Uri.parse(url))`), `WidgetsBinding.instance!` (drop the `!`), `ColorScheme.background/onBackground`, `Color.withOpacity`, and `print` calls in the infrastructure layer.
6. ⬜ **`PageWrapper.onNavItemWebTap` adds a new status listener on every tap**, so repeated taps can push multiple routes.
7. ⬜ **Some `companyUrl` values in `experiences.dart` still point to `StringConst.SITE_URL`** (The Internet Folks, Persistent Systems, Rotaract Club, GDSC). Replace with real URLs when known.
8. ⬜ **`AppAbout.codingProfiles` LeetCode and CodeChef** use `FontAwesomeIcons.code` as a placeholder icon (no dedicated LeetCode/CodeChef icon in `font_awesome_flutter`). Acceptable for now but not pixel-perfect.
9. ⬜ **Hard-coded year** in `StringConst.COPYRIGHT` ("© 2025").
10. ⬜ **`web/index.html` metadata is default** (title and description) and there is no Open Graph or SEO tag.
11. ⬜ **`RoastMyResume` project**: `gitHubUrl` actually holds the live Streamlit URL and `isPublic: true` shows it under "Source Code". Consider switching to `isLive: true` + `webUrl`, and setting `gitHubUrl` to the real repo or `""`.
12. ⬜ **`_entries` and `AppExperiences.all` are `static final` lists** initialised once at class load. **Hot reload will not refresh them; use hot restart.**
13. ⬜ **`AILAAN_APP`** — no entry exists in `projects.dart` (was previously commented-out of `data.dart`). Either add it back or clean up any orphaned `ImagePath` constants.
14. ⬜ **Tests**: none exist (no `test/` folder).
15. ✅ **Experience page animation controllers** were previously hard-coded to exactly 6. Now generated dynamically from `AppExperiences.all.length` — adding or removing entries requires no code change.
16. ✅ **Content scattered across `strings.dart` / `data.dart`**: experience, projects, and about content migrated to dedicated files (`experiences.dart`, `projects.dart`, `about.dart`). `data.dart` is now a thin adapter only.
17. ✅ **RESUME button border missing on web**: fixed by moving `BorderSide` from `ElevatedButton` style to a wrapping `Container`'s `BoxDecoration`.
18. ✅ **`flutter_feather_icons` removed** (unmaintained, extended `final IconData`). Nav hamburger/close replaced with `Icons.menu`/`Icons.close`. `font_awesome_flutter` upgraded to `^11.0.0`.

---

## 13. Rules for AI assistants making changes

1. **Content changes go in the three content files only.** To add/update experience → `experiences.dart`. Projects → `projects.dart`. About page → `about.dart`. Do not add text, URLs, or data back into `strings.dart` or `data.dart`.
2. **`data.dart` is a read-only adapter.** Its getters delegate to `AppExperiences`, `AppProjects`, and `AppAbout`. Do not add new data fields to `data.dart`; add them to the appropriate content file instead.
3. **Import only `values.dart`.** All files in `lib/values/` are `part` files of the same library. Never import them directly. When adding a new content file, add `part 'xxx.dart';` to `values.dart`.
4. **Use `FaIcon` / `FaIconData` for social and coding icons**, not `Icon` / `IconData`. `flutter_feather_icons` is removed. Material `Icons.*` are fine for structural UI icons (menu, close, etc.).
5. Any new image folder must be added to `pubspec.yaml` (`assets:` is non-recursive). Verify filenames with exact case (web hosts are case-sensitive).
6. Use `responsiveSize`, `assignWidth`, and `assignHeight` — not raw pixel values. Check both mobile (`xs`) and desktop (`lg`) layouts.
7. Do not edit `docs/` or `*.freezed.dart` by hand. Regenerate the latter with `dart run build_runner build --delete-conflicting-outputs`.
8. Do not commit secrets or API keys. Use `--dart-define`.
9. Keep changes minimal and match the surrounding style (the code is not formatted uniformly; do not mass-reformat unrelated files).
10. After a content change, run `flutter analyze`. After a widget or structural change, also run `flutter build web --release` and manually check Home, Works, a Project Detail page, and Experience at both narrow (<700px) and wide (>1200px) widths.
11. If you resolve an item from section 12, mark it ✅ and move a one-liner note into `CHANGELOG_AND_TODO.md`.

---

## 14. Page-by-page cheat sheet

| Route | Class (file) | Main data | Notes |
|---|---|---|---|
| `/home` | `HomePage` (`pages/home/home_page.dart`) | `Data.recentWorks`, `StringConst.DEV_*` | First load shows `LoadingHomePageAnimation`. Later visits use the unveil animation via `NavigationArguments`. Uses `VisibilityDetector` to trigger animations on scroll |
| `/about` | `AboutPage` (`pages/about/about_page.dart`) | `ABOUT_*` strings, `Data.mobileTechnologies`, `otherTechnologies`, `socialData2`, `socialData3` | Widgets: `about_header.dart`, `technology_section.dart` |
| `/works` | `WorksPage` (`pages/works/works_page.dart`) | `Data.projects`, `Data.noteworthyProjects` | `ProjectItemLg` (desktop) and `ProjectItemSm` (mobile) |
| `/project-detail` | `ProjectDetailPage` | `ProjectDetailArguments` | Hero cover, wave animation, `Aboutproject` (links buttons), album of `projectAssets`, `NextProject` |
| `/experience` | `ExperiencePage` (`pages/experience_page.dart`) | `Data.experienceData` | Rendered top to bottom |
| `/contact` | `ContactPage` | `EmailBloc` | See issues 1 and 2 |
| `/certifications` | `CertificationPage` | `Data.certificationData` | Hidden from the nav (commented out) |

Shared building blocks: `PageWrapper` (scaffold and transitions), `NavBar` and `AppDrawer` (navigation), `SimpleFooter` and `AnimatedFooter` (footers), `PageHeader` (works and experience headers), `AnimatedTextSlideBoxTransition` and `AnimatedPositionedText` (text reveal animations), `AnimatedBubbleButton` and `AeriumButton` (buttons), `ContentArea`, `CustomSpacer` and `spaces.dart` (`SpaceH20()`, `SpaceW30()`, ...) for layout.
