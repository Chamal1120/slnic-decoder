<div align="center">

<img src=".github/assets/app-logo.svg">

# SLNIC Decoder

![Test Status](.github/assets/test-status.svg)
![Build Status](.github/assets/build-status.svg)
![GitHub Release](https://img.shields.io/github/v/release/Chamal1120/flutter-nic-decoder?display_name=release&style=for-the-badge&logo=android&logoColor=ffffff&color=%23fab387)
![Static Badge](https://img.shields.io/badge/code_style-dart_analyzer-%230075BA?style=for-the-badge&logo=coder)
![GitHub Issues or Pull Requests](https://img.shields.io/github/issues/Chamal1120/flutter-nic-decoder?style=for-the-badge&logo=github&color=%23b4befe)


[About](#about) · [Features](#features) · [Tech](#tech) · [Installation](#installation) · [Compilation](#compilation) · [Development](#development)

</div>

## About

This is a flutter app to decode the Sri Lanka NIC (National Identity Card) number, developed as the final project for the CCS3351 Mobile Application Development module of University.

## Features

1. Extracts Date of birth, gender and person's ability to vote
2. Material 3 design

## Tech

1. GetX for State Management
2. Url_launcher and linkify for launching web links
3. Flutter launcher icons for generating app icons
4. Flutter test for testing
5. Github actions for CI/CD

## Installation

1. Grab the latest apk from ***[releases](https://github.com/Chamal1120/flutter_nic_decoder/releases)***.
2. Enable apk sideloading on your device.
3. Navigate to the download directory and tap on the nic-app-v.x.x.x.apk file and follow the instructions.

> [!NOTE]
> As of now, installation packages are only available for android devices. If you wish to use this app on an iOS device, you will have to compile it from source. See [compilation](#compilation) for more information.

## Compilation

#### Prerequisites

1. Flutter SDK 3.6.0 or above
2. Android studio

#### Steps

1. Clone the repository and change to the directory:

```bash
git clone https://github.com/Chamal1120/flutter_nic_decoder.git
cd flutter_nic_decoder
```

2. Sync the packages:

```bash
flutter pub get
```

3. Compile for your device:

```bash
flutter build apk --release # For android
flutter build ios --release # For ios
```

## Development

#### Prerequisites

1. Flutter SDK 3.6.0 or above
2. Android Studio Latest
3. Code editor that supports Flutter Development (VS Code, Android Studio, etc.)
4. Emulator configured through Android studio or AVD Manager (or a physical device)

#### Steps

1. Follow step 1 and 2 from [compilation](#compilation) section.
2. Run the emulator or connect your physical device:

```bash
flutter devices # To list all the devices
flutter emulators --launch <emulator_name> # To launch an emulator
```

3. Run the app in debug mode:

```bash
flutter run
```

4. Open up **lib** folder (where most of the code lives) and start developing.

## Thank You

Thank you for using the SLNIC Decoder app. If you have any issues or suggestions, please feel free to open an issue.
