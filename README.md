# WhatsGood

WhatsGood is a Flutter web app created for Cornell University students to discover in real-time which dining halls are open, rate their experiences, and see which dining hall is trending each week. Inspired by apps like Yelp and Beli, WhatsGood lets students share their culinary opinions, climb the ranks as food connoisseurs, and always know the best place to eat on campus.

## Features

- **Live Dining Hall Status:** Instantly see which dining halls are open and their operating hours.
- **Rank & Rate:** Submit ratings and reviews for each dining hall, just like Yelp or Beli.
- **Trending Rankings:** Weekly leaderboards show the most popular dining halls and top-rated spots.
- **User Status:** Earn food connoisseur status as you review more locations and contribute to the community.
- **Authentication:** Secure sign-in via Google and Firebase for a personalized experience.

## Screenshots

<!-- You can add images from the `images/` folder here. Example: -->
<!-- ![Dining hall list](images/screenshot1.png) -->

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- An editor like VS Code or Android Studio

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Photonicnova101/WhatsGood.git
   cd WhatsGood
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app (web):**
   ```bash
   flutter run -d chrome
   ```

   > You can also run on iOS/Android simulators if mobile support is enabled.

### Configuration

- The app uses Firebase for authentication and Firestore as the backend. 
- Ensure you have your Firebase project and credentials set up in `lib/` as per [Firebase's Flutter setup guide](https://firebase.flutter.dev/docs/overview/).

## Tech Stack

- **Framework:** Flutter (Dart)
- **Backend:** Firebase Auth, Cloud Firestore
- **State Management:** GetX
- **UI:** Material Design, Cupertino Icons
- **Other:** Google Sign-In, Custom Fonts

## Project Structure

- `lib/` — Main app source code
- `images/` — App images and assets
- `fonts/` — Custom font files

## Contributing

Contributions are welcome! Please fork the repo and submit a pull request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is for educational purposes. [Specify license here if needed.]

## Contact

For ideas, bugs, or collaboration, open an issue or contact [Photonicnova101](https://github.com/Photonicnova101).

---

Cornellians, elevate your dining experience and never miss out on the best bites with WhatsGood!
