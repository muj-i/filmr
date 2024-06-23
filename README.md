# Filmr

## Description

A simple Filmr that allows you to browse and explore movie details using the [TMDB API](https://www.themoviedb.org/documentation/api). This app leverages the GetX package for state management and the Hive database for local storage of favorite movies.

## Responsibilities

- Browse movie details from a variety of genres
- Save favorite movies for offline access
- Search for movies
- Watch movie trailers
- Filter movies using different tabs

## Design Decisions

- **GetX for State Management:** Utilized GetX for its efficient state management and navigation capabilities, ensuring a responsive and smooth user experience.
- **Hive for Local Storage:** Implemented Hive to store favorite movies locally, enabling users to access their favorite movies offline.
- **Tabs for Movie Filtering:** Provided multiple tabs for filtering movies by different categories, making it easier for users to explore movies based on their preferences.
- **YouTube Player for Trailers:** Integrated the YouTube Player to allow users to watch movie trailers within the app.

## Challenges Faced

- **Efficient State Management:** Managing the state of the app efficiently to ensure smooth navigation and data handling.
- **Data Caching:** Caching data locally to provide an offline experience and reduce network usage.
- **Search Functionality:** Implementing a robust search functionality to allow users to find movies easily.
- **Trailer Integration:** Embedding a YouTube player for movie trailers while maintaining a seamless user experience.

## How Challenges Were Overcome

- **GetX for State Management:** GetX provided a powerful and easy-to-use solution for managing state and navigation within the app. Its reactive programming model ensured that the UI was always in sync with the data.
- **Hive for Data Caching:** Hive was used to store favorite movies locally, providing users with access to their favorite movies even when offline. This also helped in reducing network requests.
- **Efficient Search Implementation:** Implemented a search functionality using GetX to manage the search state and provide real-time search results to users.
- **YouTube Player Integration:** Integrated the YouTube player within the app to play movie trailers. Ensured that the player was embedded seamlessly within the UI.

## Filmr UI

### Video demonstration of Filmr

[![Video](https://img.youtube.com/vi/i_xuSb89Pec/hqdefault.jpg)](https://youtu.be/i_xuSb89Pec?si=-ZhtTA6wMs4OZtsa)

### Screenshots

<div style="display: flex; flex-wrap: wrap;">
    <img src="https://github.com/muj-i/filmr/screenshots/ss1.png" width="250" />
    <img src="https://github.com/muj-i/filmr/screenshots/ss2.png" width="250" />
    <img src="https://github.com/muj-i/filmr/screenshots/ss3.png" width="250" />
    <img src="https://github.com/muj-i/filmr/screenshots/ss4.png" width="250" />
    <img src="https://github.com/muj-i/filmr/screenshots/ss5.png" width="250" />
    <img src="https://github.com/muj-i/filmr/screenshots/ss6.png" width="250" />
</div>

## Getting Started

### Prerequisites

Ensure Flutter is installed on your machine. For installation instructions, refer to the official [Flutter website](https://flutter.dev/docs/get-started/install).

### Installation

Follow these steps to run the Filmr:

1. Clone this repository to your local machine:

```bash
git clone https://github.com/muj-i/filmr.git
```

2. Navigate to the project folder:

```bash
cd filmr
```

3. Install dependencies:

```bash
flutter pub get
```

## How to Run

Connect your device or emulator and run the app using the following command:

```bash
flutter run --release
```

## Used Packages

Movie Detail App integrates the following packages to enhance functionality:

- **get: 4.6.6**: A powerful Flutter package for state management and navigation.
- **dio: ^5.4.3+1**: A powerful HTTP client for Dart, used for making API requests.
- **font_awesome_flutter: ^10.7.0**: Provides access to a wide range of Font Awesome icons for stylish visuals in the app.
- **youtube_player_flutter: ^8.1.1**: A Flutter package for embedding YouTube videos.
- **animated_splash_screen: ^1.3.0**: Used for creating animated splash screens in Flutter.
- **hive: ^2.2.3**: A lightweight, fast, and efficient NoSQL database for Flutter.
- **hive_flutter: ^1.1.0**: Integrates Hive with Flutter, allowing seamless usage of Hive in the Flutter app.

## Dev Dependencies

- **flutter_lints: 4.0.0**: Lint rules for Flutter to maintain code quality.
- **flutter_launcher_icons: 0.13.1**: Tool to generate launcher icons for Flutter apps.

## Project Directory Structure

The Movie Detail App directory structure is organized as follows:

```
.
└── filmr/
    ├── assets/
    │   ├── android_logo.png
    │   └── ios_logo.png
    ├── lib/
    │   ├── app/
    │   │   ├── common/
    │   │   │   └── widgets/
    │   │   │       └── circular_loader.dart
    │   │   ├── data/
    │   │   │   ├── model/
    │   │   │   │   ├── movie_detail_credits_model.dart
    │   │   │   │   ├── movie_detail_recommendation_model.dart
    │   │   │   │   ├── movie_details_model.dart
    │   │   │   │   ├── movie_list_trailer_model.dart
    │   │   │   │   ├── movies_list_model.dart
    │   │   │   │   └── search_list_model.dart
    │   │   │   ├── services/
    │   │   │   │   ├── network_caller/
    │   │   │   │   │   └── request_methods/
    │   │   │   │   │       └── get_request.dart
    │   │   │   │   └── network_response.dart
    │   │   │   └── utils/
    │   │   │       ├── favorite_movie_keeper.dart
    │   │   │       ├── movie_detail_hive_adapter.dart
    │   │   │       └── urls.dart
    │   │   ├── modules/
    │   │   │   ├── bottom_nav_layout/
    │   │   │   │   ├── bindings/
    │   │   │   │   │   └── bottom_nav_layout_binding.dart
    │   │   │   │   ├── controllers/
    │   │   │   │   │   └── bottom_nav_layout_controller.dart
    │   │   │   │   └── views/
    │   │   │   │       └── bottom_nav_layout_view.dart
    │   │   │   ├── home/
    │   │   │   │   ├── bindings/
    │   │   │   │   │   └── home_binding.dart
    │   │   │   │   ├── controllers/
    │   │   │   │   │   └── home_controller.dart
    │   │   │   │   └── views/
    │   │   │   │       ├── widgets/
    │   │   │   │       │   ├── category_tabs.dart
    │   │   │   │       │   ├── movies_list.dart
    │   │   │   │       │   ├── search_results.dart
    │   │   │   │       │   ├── search_text_field.dart
    │   │   │   │       │   └── tabbar_text.dart
    │   │   │   │       └── home_view.dart
    │   │   │   ├── movie_details/
    │   │   │   │   ├── bindings/
    │   │   │   │   │   └── movie_details_binding.dart
    │   │   │   │   ├── controllers/
    │   │   │   │   │   └── movie_details_controller.dart
    │   │   │   │   └── views/
    │   │   │   │       ├── widgets/
    │   │   │   │       │   ├── credits.dart
    │   │   │   │       │   ├── movie_details.dart
    │   │   │   │       │   ├── movie_details_and_overviews.dart
    │   │   │   │       │   ├── recommended_movies.dart
    │   │   │   │       │   └── trailer_view.dart
    │   │   │   │       └── movie_details_view.dart
    │   │   │   ├── now_playing/
    │   │   │   │   ├── bindings/
    │   │   │   │   │   └── now_playing_binding.dart
    │   │   │   │   ├── controllers/
    │   │   │   │   │   └── now_playing_controller.dart
    │   │   │   │   └── views/
    │   │   │   │       └── now_playing_view.dart
    │   │   │   ├── splash/
    │   │   │   │   ├── bindings/
    │   │   │   │   │   └── splash_binding.dart
    │   │   │   │   ├── controllers/
    │   │   │   │   │   └── splash_controller.dart
    │   │   │   │   └── views/
    │   │   │   │       └── splash_view.dart
    │   │   │   └── user_profile/
    │   │   │       ├── bindings/
    │   │   │       │   └── user_profile_binding.dart
    │   │   │       ├── controllers/
    │   │   │       │   └── user_profile_controller.dart
    │   │   │       └── views/
    │   │   │           └── user_profile_view.dart
    │   │   └── routes/
    │   │       ├── app_pages.dart
    │   │       └── app_routes.dart
    │   └── main.dart
    └── pubspec.yaml
```

## Contributors

- [Mujahedul Islam](https://github.com/muj-i)

## License

This project is licensed under the MIT License. Refer to the [LICENSE](https://opensource.org/license/mit/) file for details.
