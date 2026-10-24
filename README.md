# Tanay Gupta - Personal Portfolio

A modern, responsive, animated Single Page Application (SPA) portfolio website built with Flutter Web.

## Overview

This repository contains the source code for Tanay Gupta's personal portfolio website, showcasing projects, work experience, technical skills, certifications, and contact information.

- **Framework**: Flutter Web (Stable Channel, Flutter 3.47.7 / Dart 3.13.5)
- **Architecture**: Responsive layout system (`layout`, `responsive_builder`), custom routing with clean URL strategy (`PathUrlStrategy`), and smooth page transition animations.
- **State Management**: `StatefulWidget` + `AnimationController`s, `flutter_bloc` for the contact form.
- **Hosting & Deployment**: Cloudflare Workers Static Assets (`wrangler.jsonc`) serving `./build/web`.

## Features

- **Home**: Hero section, animated introduction, and featured project showcase.
- **About**: Personal story, technical competencies (languages, frameworks, tools), and coding profile links.
- **Works & Projects**: Filterable project gallery with dedicated case study / detail pages (`/project-detail`).
- **Experience**: Chronological timeline of professional experience and achievements.
- **Contact**: Interactive get-in-touch form and direct social media links.
- **Adaptive UI**: Fully responsive design optimized for mobile, tablet, desktop, and large desktop screens.

## Project Structure

```
.
├── lib/
│   ├── core/                  # Layout breakpoints, utilities, and helper functions
│   ├── infrastructure/        # API clients, repository, and bloc for contact handling
│   ├── presentation/          # Pages (home, about, works, experience, contact) & widgets
│   ├── values/                # Data models, strings, colors, sizes, and content definitions
│   ├── app_theme.dart         # Theme configuration
│   ├── configure_web.dart     # Web URL strategy setup
│   ├── injection_container.dart # Dependency injection (get_it)
│   └── main.dart              # Application entry point
├── assets/                    # Custom fonts (VisueltPro) and image assets
├── web/                       # Web entry (index.html, manifest.json, favicon)
├── build.sh                   # Cloudflare CI/CD build script
└── wrangler.jsonc             # Cloudflare Workers configuration
```

## Getting Started

### Prerequisites

- Flutter SDK `^3.47.7`
- Dart SDK `^3.13.5`

### Run Locally

```bash
# Clone the repository
git clone https://github.com/tanay-gupta/tanay-gupta.github.io.git
cd MyPortfolio

# Install dependencies
flutter pub get

# Run on Chrome
flutter run -d chrome
```

### Build for Production

```bash
# Build web release
flutter build web --release
```

The output will be generated in `./build/web`.
