# Flutter Autonomous Investment App

This Flutter Android application is built for **Autonomous Investment** to manage and display product listings efficiently. It fetches product data using RESTful APIs, supports smooth navigation, and provides a clean user interface for mobile devices.

## Features

- **Autonomous Investment:**
    - Display a list of products
    - Tap any product to view detailed information
    - Data fetched once and paginated on the **client side**
    - Splash screen and responsive UI across screen sizes
    - Robust error handling and loading indicators
  
## Screenshots

![Screenshot Splash Screen](https://github.com/Flutter-AsadALi/Autonomous-Investment/blob/main/assets/images/splash.png)
![Screenshot List of Products](https://github.com/Flutter-AsadALi/Autonomous-Investment/blob/main/assets/images/list_view.png)
![Screenshot Products Details View](https://github.com/Flutter-AsadALi/Autonomous-Investment/blob/main/assets/images/details_view.png)


## Download APK

You can download the APK file for the app here: [Download App APK](https://github.com/Flutter-AsadALi/Autonomous-Investment/blob/main/assets/images/flutter-app.apk)
## Requirements

- Flutter version greater than 3.10
- Java SDK
- environment sdk: '>=3.0.3 <4.0.0'

## Installation

1. Clone the repository:
   git clone https://github.com/Flutter-AsadALi/Autonomous-Investment
2. Open the project in Android Studio.
3. Run the command: `flutter pub get`.
4. Execute `flutter run` and select the desired device.

## Usage

1. Launch the app to access the list of work orders.
2. Tap on a card to view detailed information.

## Technologies Used

- **Language:** Flutter, Dart
- **Data Retrieval:** RESTful APIs, JSON parsing
- **Components:**  ListView.separated, Card, GestureDetector, etc.
- **Networking:** Dio (REST API handling)
- **State Management:** Provider
- **Networking:** Dio (REST API handling)




## Implementation Considerations

- **API Calls:** The app efficiently fetches data using API calls, enhancing performance and data retrieval. Within Flutter, the UI and state management follow the MVC (Model-View-Controller) model, ensuring effective data flow and rendering for a responsive user interface.

- **Scalability:** The app ensures scalability by employing pagination or lazy loading mechanisms, allowing the retrieval of large volumes of Products in batches. This approach maintains app performance and responsiveness, even with extensive data sets.

- **Error Handling:** A robust error handling system is integrated to proficiently manage various scenarios, including network disruptions, server-side issues, or data inconsistencies. Clear and user-friendly error messages are displayed, facilitating better comprehension and user experience.

## App Design Decisions

- **UI/UX Design:** The design focuses on intuitive navigation, minimalist UI elements, and responsiveness across various screen sizes and orientations.

- **Architecture:** The app follows a clean architecture pattern MVC, separating concerns and promoting maintainability and scalability.

- **Third-party Libraries:** Notable third-party libraries like Dio for network requests and Provider for state management are used, enhancing the app's functionality and performance.

## Performance Considerations

- **Optimization:** Data caching, minimal network calls, and efficient rendering techniques are employed to optimize performance and reduce app loading times.
## Final Notes

- **Notes:** This app demonstrates clean Flutter development practices tailored to real-world use in product management. Built with scalability, performance, and code clarity in mind, it is suited for enterprise use at Autonomous Investment.




