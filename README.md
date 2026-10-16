# IntelliOps AI 🚀

IntelliOps AI is a modern, intelligent project and team management mobile application built with **Flutter**. It combines a sleek iOS-inspired Liquid Glass design language with powerful AI assistance to help teams track projects, schedule meetings, monitor progress, and optimize resource allocation.

---

## ✨ Key Features

- **Dashboard**: Real-time overview of active projects, daily tasks, assigned projects, and collaborative space metrics.
- **Active Projects**: Track project statuses, completion rates, and timelines (e.g., Fintech App Design, Healthcare Site).
- **Meetings**: Manage scheduled sessions, team meetings, and boardrooms.
- **Ask AI Assistant**: Integrated AI chat interface to assist with project planning, task breakdown, and team resource allocation.
- **Secure Authentication**: Email/Password authentication and Google Sign-In powered by Firebase Auth.
- **Modern UI / UX**: Clean light theme aesthetics featuring custom card layouts, soft shadows, profile headers, and smooth bottom navigation.

---

## 🛠️ Tech Stack & Architecture

- **Framework**: Flutter (Dart)
- **State Management**: Flutter Riverpod
- **Routing**: GoRouter (with StatefulShellRoute for persistent bottom navigation)
- **Backend & Auth**: Firebase Core & Firebase Authentication
- **Design System**: Custom iOS Liquid Glass widgets & Material Design 3

---

## 📱 Getting Started

### Prerequisites

- Flutter SDK (>= 3.13.5)
- Dart SDK (>= 3.5.0)
- Android Studio / VS Code with Flutter & Dart plugins installed

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/intelli_ops.git
   cd intelli_ops
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**:
   - Add your `google-services.json` to `android/app/`.
   - Add your `GoogleService-Info.plist` to `ios/Runner/`.
   - Ensure `lib/firebase_options.dart` is configured for your Firebase project.

4. **Run the app**:
   ```bash
   flutter run
   ```

---

## 🔒 Security & Privacy

This repository is configured with a strict `.gitignore` to prevent sensitive credentials, API keys, and configuration files (`google-services.json`, `GoogleService-Info.plist`, keystores, `.env`) from being exposed in version control.

---

## 📄 License

This project is private and confidential.
