# White Lines — Lawnchair / Android Icon Pack

**Style:** white outline artwork, transparent PNG backgrounds, no tile/shadow baked into app icons.

This is a native Android icon-pack project for Lawnchair and other launchers that support the ADW icon-pack standard. It contains the artwork from the original White Lines project plus Lawnchair's package-level themed-icon map.

## What's included

- 66 unique editable SVG glyphs in `artwork/svg/`.
- 101 package-name mappings in `artwork/app-mapping.csv` and `app/src/main/res/xml/grayscale_icon_map.xml`.
- Transparent 192 × 192 PNGs in `app/src/main/res/drawable-nodpi/`.
- `drawable.xml` index for icon-picker/manual assignment.
- `appfilter.xml` for the ADW icon-pack format.
- A simple in-app icon preview.
- GitHub Actions workflow at `.github/workflows/build-apk.yml` to build and upload an installable debug APK.

## Build the APK

### Easiest route: GitHub Actions

1. Create a new empty repository on GitHub.
2. Extract this ZIP and upload the **contents** of this folder to the repository root (keep `.github/workflows/build-apk.yml`).
3. Open the repository's **Actions** tab and choose **Build White Lines APK** → **Run workflow**. A push to `main` / `master` also triggers a build.
4. When the run completes, open its summary and download the `White-Lines-Lawnchair-APK` artifact. Extract it to get `app-debug.apk`.
5. Transfer `app-debug.apk` to your Redmi and install it. Android may ask you to allow installation from that file manager/browser; allow only for the app you used to open the APK.

The debug APK is signed with the standard Android debug key by the build system and can be installed for personal use. It is not a Play Store release build.

### Build locally

Open the folder in Android Studio (with Android SDK Platform 35 and Java 17 installed), then run the `assembleDebug` Gradle task. Or from a terminal run `./gradlew :app:assembleDebug` (Windows: `gradlew.bat :app:assembleDebug`). The bootstrap script downloads Gradle 8.9 on first use.

Output: `app/build/outputs/apk/debug/app-debug.apk`.

## Apply in Lawnchair

1. Install and set Lawnchair as your default Home app.
2. Install the White Lines APK.
3. Open **Home Settings → General → Icon Style**.
4. For package-level automatic matching, enable **Themed Icons** and choose **White Lines** as the source if your Lawnchair build exposes it. The launcher may tint themed icons to match the selected theme color.
5. For the exact white artwork, use the **Icon Pack** picker and select White Lines. If icons appear tinted, turn off **Tint with accent color**. The `drawable.xml` index exposes all 66 glyphs for manual per-app selection.

Lawnchair's current documentation describes the ADW `appfilter.xml` and `drawable.xml` format, and its package-level `grayscale_icon_map.xml` source for Themed Icons. See the Lawnchair documentation linked below.

## Important mapping note

The original CSV records Android **package names**, not each app's exact launcher **activity component**. The Lawnchair Themed Icon map is package-based, so its 101 mappings are populated. Standard ADW `appfilter.xml` entries are activity-component-based; this project does **not** invent activity class names. Consequently, the standard Icon Pack mode offers the glyphs in the picker for manual assignment; complete automatic per-activity ADW mapping requires the actual component names from the device.

Some apps can have different package names or activity names depending on region, ROM, or app version. Unmapped apps keep their original icons.

## Editing the icons

- Edit the corresponding SVG in `artwork/svg/` (white strokes, transparent background, viewBox 0 0 128 128).
- Render it to a transparent 192 × 192 PNG and replace the matching resource in `app/src/main/res/drawable-nodpi/`.
- To add an app mapping, add a row to `artwork/app-mapping.csv` and add the corresponding `<icon package="..." drawable="@drawable/..." />` entry in `grayscale_icon_map.xml`.
- For standard ADW auto-mapping, also add an exact component entry to `appfilter.xml`: `<item component="ComponentInfo{package/activity}" drawable="glyph" />`.
- Rebuild the APK.

## Links

- Lawnchair icon-pack specification: https://github.com/LawnchairLauncher/docs/blob/main/developers/concepts/icon-packs.md
- Lawnchair icon settings: https://github.com/LawnchairLauncher/docs/blob/main/help/core-features/theming-and-icons.md

## License

Original vector artwork and build scaffolding are provided under the MIT License. Third-party app names and package identifiers are used only as mapping identifiers. This project is not affiliated with Xiaomi, Lawnchair, or the listed app publishers.
