# SARAN – Flutter app

A Flutter app with a welcome screen (email / social login), home screen with music sections, and signup/login flows.

## Run the app

From the project root:

```bash
cd /Users/ajith/flutter_basics
flutter pub get
flutter run
```

- **Android:** Connects to a device or emulator and runs.
- **iOS:** Use a simulator or a connected iPhone. If you see an error, see [iOS troubleshooting](#ios-troubleshooting) below.

The app opens on the **welcome screen**. Tap **Continue with Email** to go to the **home screen**.

## iOS troubleshooting

If `flutter run` fails on iOS, try in order:

1. **Clean and get dependencies**
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

2. **Open the iOS project in Xcode and set the signing team**
   - Open `ios/Runner.xcworkspace` in Xcode (not `Runner.xcodeproj`).
   - Select the **Runner** project → **Signing & Capabilities**.
   - Choose your **Team** and ensure **Automatically manage signing** is checked.

3. **Install CocoaPods (if needed)**
   ```bash
   cd ios
   pod install
   cd ..
   flutter run
   ```

4. **Check the iOS deployment target**
   - In Xcode, **Runner** → **Build Settings** → search for **iOS Deployment Target**.
   - Set it to **13.0** or higher.

5. **Run on the iOS Simulator**
   ```bash
   flutter run -d "iPhone 16"
   ```
   (Replace with your simulator name from `flutter devices`.)

## Project structure

- `lib/main.dart` – App entry; shows `WelcomeModernScreen` on launch.
- `lib/screens/welcome_modern_screen.dart` – Welcome screen (SARAN logo, email / Google / Apple / social icons).
- `lib/screens/home_screen.dart` – Home screen (recently played, 2021 in review, editor’s picks, now playing bar).
- `lib/screens/signup_screen.dart` – Sign up form.
- `lib/screens/login_screen.dart` – Log in form.
- `assets/home/` – Images for the home screen.
- `assets/icons/` – Social and app icons.

## Saving your work

To save the project (e.g. with Git):

```bash
git add .
git commit -m "SARAN app: welcome, home, login/signup, iOS Podfile"
```
