# Changelog and Pending Issues

Running log of changes made to this project and the issues still open.
For architecture and "how to add X" recipes, see [`PROJECT_GUIDE.md`](PROJECT_GUIDE.md).

**How to use:** add a new dated section at the top of "Change log" for every change session. Tick items in "Pending issues" when fixed and move a one-line note into the change log.

Legend: `[x]` done, `[ ]` open.

---

## 1. Change log

### 2025-07-17: Update PROJECT_GUIDE.md to reflect new content-file architecture

Context: `PROJECT_GUIDE.md` was written before the content-file refactor and still described the old pattern (edit `strings.dart` → `data.dart` → widget). Now that `experiences.dart`, `projects.dart`, and `about.dart` are the single sources of truth, the guide was stale enough to be actively misleading to a developer or AI assistant following it.

- [x] **Section 3** (`lib/` tree): added `experiences.dart`, `projects.dart`, `about.dart` with ★ markers; updated `strings.dart` and `data.dart` descriptions.
- [x] **Section 4** (content model): replaced the old table (pointing to `Projects.<NAME>`, `Data.mobileTechnologies`, etc.) with the new table pointing to `AppExperiences`, `AppProjects`, `AppAbout`; added the "thin adapter" callout for `data.dart`; updated data model class notes (`SocialData.iconData` is now `FaIconData`; `flutter_feather_icons` removed).
- [x] **Section 9.1–9.5** (recipes): each recipe now says which single file to edit and provides a ready-to-paste code block. No recipe still says "edit `strings.dart` and `data.dart`".
- [x] **Section 12** (known issues): added ✅/⬜ legend; marked 4 issues ✅ (dynamic animation controllers, content migration, button border, feather icons removal); updated `companyUrl` reference from `strings.dart` to `experiences.dart`; updated `socialData3` icons note to mention `FontAwesomeIcons.code` placeholder; removed stale `Projects.*` static-field note (replaced with `_entries`/`AppExperiences.all`).
- [x] **Section 13** (AI rules): rewritten to centre on the three content files; added `FaIcon`/`FaIconData` rule; updated `build_runner` command; split `flutter analyze` and `flutter build` requirements.

Not changed / risks:
- Sections 1–2, 5–11, 14 were accurate and left untouched.

---

### 2025-07-17: Fix RESUME button border

Context: The RESUME button in the nav bar was missing its black border at rest. Root cause: Flutter's `ElevatedButton` renders its `BorderSide` on the Material surface layer, which interacts poorly with the button's elevated state on web. The shadow also made the border appear thick. Fix: moved the border entirely out of the `ElevatedButton` style and onto the wrapping `Container` via `BoxDecoration`, where it is always rendered regardless of Material state.

- [x] **[`lib/presentation/widgets/aerium_button.dart`](lib/presentation/widgets/aerium_button.dart)**: removed `BorderSide` from `ElevatedButton.styleFrom` shape; set `elevation: 0` and `shadowColor: Colors.transparent`; added `BoxDecoration(border: Border.all(...))` to the outer `Container`. Border is now permanently visible in all hover/rest states.
- [x] `flutter analyze` reports zero new errors or warnings.

Not changed / risks:
- Hover animation (white overlay collapses to reveal black fill) is unaffected.
- This fix applies globally to all `AeriumButton` instances (contact form submit button etc.).

---

### 2025-07-17: Refactor about page content — single-file content architecture

Context: About page content was scattered across `strings.dart` (~50 constants) and `data.dart` (tech lists, social/coding profile lists). Updating bio text, tech stacks, or social links required hunting through multiple files.

- [x] **Created [`lib/values/about.dart`](lib/values/about.dart)** — single source of truth for all About page content: header taglines (`headerLines`), story paragraphs (`storyParagraphs`), tech stacks (`languages`, `frameworks`), coding profiles (`codingProfiles`), social links (`socialLinks`), closing quote, and all section label strings.
- [x] **Registered** `about.dart` as `part 'about.dart'` in [`lib/values/values.dart`](lib/values/values.dart).
- [x] **Simplified [`lib/values/data.dart`](lib/values/data.dart)**: `mobileTechnologies`, `otherTechnologies`, `socialData2`, `socialData3` are now one-liner getters delegating to `AppAbout`.
- [x] **Deleted ~50 lines** of `ABOUT_DEV_*`, `MOBILE_TECH`, `OTHER_TECH`, `FAMOUS_QUOTE*`, `WORK_TOGETHER`, `AVAILABLE_FOR_FREELANCE`, `SAY_HELLO` from [`lib/values/strings.dart`](lib/values/strings.dart).
- [x] **Updated** [`about_page.dart`](lib/presentation/pages/about/about_page.dart), [`about_header.dart`](lib/presentation/pages/about/widgets/about_header.dart), [`technology_section.dart`](lib/presentation/pages/about/widgets/technology_section.dart), and [`animated_footer.dart`](lib/presentation/pages/widgets/animated_footer.dart) to reference `AppAbout.*` directly.
- [x] `flutter analyze` on all changed files reports zero errors and zero warnings.

Not changed / risks:
- Header taglines use indexed access (`AppAbout.headerLines[0..3]`) with per-line `heightFactor`/`maxLines` — visual layout is pixel-identical to before. A generic loop was attempted first and caused visible spacing regressions; the explicit per-line approach was restored.

---

### 2025-07-17: Refactor projects/works data — single-file content architecture

Context: Adding a new project required editing `strings.dart` (~10 constants), the `Projects` class in `data.dart` (~25 lines), and then two separate lists (`Data.projects` and `Data.recentWorks`) to control visibility on Works and Home pages. There was no single flag to show/hide a project on Home.

- [x] **Created [`lib/values/projects.dart`](lib/values/projects.dart)** — single source of truth for all projects and noteworthy entries. Each project is a `_ProjectEntry` wrapper with a `showOnHome` flag. `AppProjects.all` → Works page. `AppProjects.recentWorks` → Home page (auto-filtered). `AppProjects.noteworthy` → noteworthy section.
- [x] **Registered** `projects.dart` as `part 'projects.dart'` in [`lib/values/values.dart`](lib/values/values.dart).
- [x] **Simplified [`lib/values/data.dart`](lib/values/data.dart)**: `Data.projects`, `Data.recentWorks`, `Data.noteworthyProjects` are now one-liner getters. The entire `Projects` class (~200 lines) deleted.
- [x] **Deleted ~120 lines** of `CONTESTHUNT_*/ROASTMYRESUME_*/AILAAN_*/LAZYSHARE_*/NOTIFYX_*/SOCIALAPP_*/CITIZENSAFETY_*/DATINGAPP_*/LEETCODE_*` constants from [`lib/values/strings.dart`](lib/values/strings.dart).
- [x] `flutter analyze` on all changed files reports zero errors and zero warnings.

Not changed / risks:
- `AILAAN_APP` remains defined in `projects.dart` with `showOnHome: false` (was previously commented out of both lists).

---

### 2025-07-16: Refactor experience data — single-file content architecture

Context: Adding a new job previously required editing `strings.dart` (~10 new constants), `data.dart` (a new `ExperienceData` block), and `experience_page.dart` (a new hardcoded `AnimationController`). The page hard-coded exactly 6 controllers, so a 7th entry would have caused a `RangeError` at runtime. All three pain points are now resolved.

- [x] **Created [`lib/values/experiences.dart`](lib/values/experiences.dart)** — new single source of truth for all experience entries. Each job is a self-contained `ExperienceData` literal inside `AppExperiences.all`. To add a new role, copy one block, paste it at the top of the list, fill in details — no other file needs to change.
- [x] **Registered** `experiences.dart` as `part 'experiences.dart'` in [`lib/values/values.dart`](lib/values/values.dart).
- [x] **Simplified [`lib/values/data.dart`](lib/values/data.dart)**: `Data.experienceData` is now a one-liner getter (`=> AppExperiences.all`) instead of a 70-line hardcoded list.
- [x] **Deleted ~80 lines** of `COMPANY_*/POSITION_*/ROLE_*/LOCATION_*/DURATION_*` string constants from [`lib/values/strings.dart`](lib/values/strings.dart). A one-line comment points to `experiences.dart`.
- [x] **Refactored [`lib/presentation/pages/experience_page.dart`](lib/presentation/pages/experience_page.dart)**: replaced 6 hard-named `AnimationController` fields with `List.generate(AppExperiences.all.length, ...)`. The page now scales automatically to any number of entries.
- [x] `flutter analyze` on all four changed files reports zero errors and zero warnings (all pre-existing infos are in other files).

Not changed / risks:
- No UI, animation behaviour, or visual output was modified.
- The `All company URLs still point to SITE_URL` issue (tracked below) is unchanged; URLs are now in `experiences.dart` instead of `strings.dart`.

---

### 2026-10-17: Get the project compiling on the current Flutter SDK (3.47.7)

Context: `flutter run -d chrome` failed to compile because two icon packages extend `IconData`, which is now a `final` class, and `google_fonts` hit a constant-evaluation error. After the fixes below, the app builds and starts in Chrome (`http://127.0.0.1:5000`) and `flutter analyze lib` reports no errors. A visual check of every page has **not** been done yet.

- [x] Added [`PROJECT_GUIDE.md`](PROJECT_GUIDE.md): architecture, content-update recipes, known issues, rules for AI assistants.
- [x] **Upgraded `font_awesome_flutter`** `^10.7.0` -> `^11.0.0` in [`pubspec.yaml`](pubspec.yaml). This version no longer extends `IconData`.
  - [x] [`lib/presentation/pages/widgets/socials.dart`](lib/presentation/pages/widgets/socials.dart): `SocialData.iconData` type `IconData` -> `FaIconData`; render with `FaIcon` instead of `Icon`; added the `font_awesome_flutter` import.
  - [x] [`lib/presentation/widgets/aerium_button.dart`](lib/presentation/widgets/aerium_button.dart): `iconData` type `IconData` -> `FaIconData`; render with `FaIcon`.
  - [x] [`lib/presentation/pages/widgets/simple_footer.dart`](lib/presentation/pages/widgets/simple_footer.dart): heart icon rendered with `FaIcon`.
  - Note: [`lib/values/data.dart`](lib/values/data.dart) needed **no** change. It already used `FontAwesomeIcons.*`, which are `FaIconData` in v11.
- [x] **Removed `flutter_feather_icons`** (unmaintained, extends `IconData`). Removed from `pubspec.yaml` and its imports.
  - [x] [`nav_bar.dart`](lib/presentation/pages/widgets/nav_bar.dart): `FeatherIcons.menu` -> `Icons.menu`.
  - [x] [`app_drawer.dart`](lib/presentation/widgets/app_drawer.dart): `FeatherIcons.x` -> `Icons.close`.
  - Visual difference: Material icons are slightly different from Feather icons (stroke weight/shape).
- [x] **Upgraded `google_fonts`** 6.2.1 -> 6.3.3 via `flutter pub upgrade` (constraint `^6.2.1` is unchanged in `pubspec.yaml`; only `pubspec.lock` moved). This fixed the `FontWeight` constant error.
- [x] `pubspec.lock` regenerated by `flutter pub get` / `upgrade`. Small transitive bumps also happened (for example `characters` 1.4.1, `fake_async` 1.3.3, `vector_math` 2.4.3).
- [x] Restored a commented-out `flutter_feather_icons` line in `pubspec.yaml` that an automated `sed` removed by accident (comment only, no functional effect).

#### Files changed by tooling, not by hand (review before committing)
- `analysis_options.yaml`: the Flutter tool auto-added an `analyzer: exclude:` block (`build/`, `android/`, `ios/`, `web/`, `macos/`). It was inserted between the comment and `include:`; it works but you may want to move it below `include:`.
- `android/gradle/wrapper/gradle-wrapper.properties`: Gradle wrapper moved from 7.5 to 8.9 (this change was already present before my session started). It does not affect the web build.

#### Not changed
- No page content, strings, project data, routes, or assets were modified.
- `build.sh` still installs Flutter **3.24.5** while local is **3.47.7**. The new dependency versions have **not** been tested against 3.24.5.

---

## 2. Pending issues checklist

Priority: **P1** = broken functionality or deploy risk, **P2** = should fix, **P3** = polish.

### Verification (do these first)
- [ ] **P1**: Manually check every route in Chrome (Home, About, Works, a Project Detail, Experience, Contact) at narrow (<700px) and wide (>1200px) widths. Look for runtime errors in the console and for social icons and the hamburger/close icons rendering correctly.
- [ ] **P1**: Run `flutter build web --release` locally and confirm it succeeds.
- [x] **P1**: Decide the CI Flutter version. Bumped `build.sh` to Flutter 3.47.7 matching local environment and package requirements.
- [ ] **P3**: Review the `analysis_options.yaml` placement noted above.
- [ ] **P3**: Update [`PROJECT_GUIDE.md`](PROJECT_GUIDE.md) to mention `FaIcon`/`FaIconData` for social icons and that `flutter_feather_icons` is gone.

### Functionality
- [ ] **P1**: **Contact form does not work.** `StringConst.BASE_URL` is `""` ([`strings.dart`](lib/values/strings.dart)). Needs a real backend or a service such as Formspree/EmailJS. Do not commit keys; use `--dart-define`. (`TODO:: Fix email service` in [`main.dart`](lib/main.dart).)
- [ ] **P1**: **`EmailBloc` is broken on `bloc ^8`.** It overrides the removed `mapEventToState` and has no `on<SendEmail>` handler, so `ContactPage` never gets success/failure states (no snackbars, spinner never stops). Rewrite using `on<SendEmail>((event, emit) async {...})` in [`email_bloc.dart`](lib/infrastructure/bloc/email_bloc.dart). Also remove the duplicated `@override`.
- [ ] **P2**: **`/project-detail` crashes on refresh or direct link** because `ProjectDetailPage` force-casts route arguments ([`project_detail_page.dart`](lib/presentation/pages/project_detail/project_detail_page.dart)). Use an id in the URL and look the project up in `Data.projects`, or fall back to the Works page when arguments are null.
- [ ] **P2**: `PageWrapper.onNavItemWebTap` adds a new status listener on every tap, so repeated taps can push the route several times ([`page_wrapper.dart`](lib/presentation/widgets/page_wrapper.dart)).

### Dependencies and deprecations
- [ ] **P2**: Declare missing direct dependencies in `pubspec.yaml`: `http`, `bloc`, `meta` (currently only transitive), and `flutter_web_plugins` (`sdk: flutter`).
- [ ] **P2**: Replace deprecated `launch()` in [`functions.dart`](lib/core/utils/functions.dart) with `launchUrl(Uri.parse(url))`.
- [ ] **P2**: Remove `WidgetsBinding.instance!` (the `!` is no longer needed) in `page_wrapper.dart`.
- [ ] **P3**: Replace deprecated `ColorScheme.background/onBackground` ([`app_theme.dart`](lib/app_theme.dart)) and `Color.withOpacity`.
- [ ] **P3**: Replace `print` calls in `infrastructure/` with proper logging, or remove them.
- [ ] **P3**: Many packages have newer majors available (for example `google_fonts` 9.x, `get_it`, `responsive_builder`, `visibility_detector`). Run `flutter pub outdated` and upgrade deliberately, one at a time.
- [ ] **P3**: No tests exist (`test/` folder missing).

### Content and data
- [ ] **P2**: `ROASTMYRESUME` has a single image, so its detail-page album is empty ([`data.dart`](lib/values/data.dart)). Its `ROASTMYRESUME_GITHUB_URL` holds the live Streamlit app URL and shows under "Source Code". Consider `isLive: true` with `webUrl`, and add the real repo to `gitHubUrl`.
- [ ] **P2**: `NOTIFYX_8` and `NOTIFYX_9` reuse `6.png` and `7.png` ([`images.dart`](lib/values/images.dart)), so the album shows duplicates.
- [ ] **P2**: All `companyUrl` values point to `SITE_URL` instead of real company sites ([`experiences.dart`](lib/values/experiences.dart)).
- [ ] **P3**: `Data.socialData3` (LeetCode/HackerRank/CodeChef) reuses GitHub/LinkedIn icons.
- [ ] **P3**: `StringConst.COPYRIGHT` has a hard-coded "© 2025".
- [ ] **P3**: `AILAAN_APP` is defined but hidden (commented out of the project lists). Remove it or re-enable it.
- [ ] **P3**: Several unused `ImagePath` constants point to files that do not exist (`vybz.jpg`, `playstore.png`, `ceasar-bust.png`, `meditation.png`, `about_portrait.png`, `dev-about.jpg`). Delete them.
- [ ] **P3**: Certifications page is hidden from the nav. Re-enable it and add the Udacity cloud certificate (TODO in `main.dart`), or remove the dead code.
- [ ] **P3**: Home page TODO in `main.dart`: rotating logos for web, mobile and cloud skills.
- [ ] **P3**: Typos in some project description strings.

### Web / SEO / hosting
- [ ] **P2**: [`web/index.html`](web/index.html) still has the default `<title>tanay_gupta_portfolio</title>` and description "A new Flutter project." Add a proper title, description and Open Graph tags. Also check `web/manifest.json`.
- [ ] **P3**: `docs/` is stale GitHub Pages build output. Delete it, or leave it and never edit it by hand.
- [ ] **P3**: `README.md` is the default Flutter template. Replace it with a short project intro that links to `PROJECT_GUIDE.md`.
- [ ] **P3**: Unused `android/`, `ios/`, `macos/` scaffolding could be removed if the project stays web-only.

---

## 3. Template for future entries

```markdown
### YYYY-MM-DD: short title
Context: why the change was made.
- [x] What changed, with a link to the file.
- [x] Anything done by tooling that needs review.
Not changed / risks: ...
```
