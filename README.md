# Ecommerce - Mobile Application

## Project Overview
This is a high-performance Flutter e-commerce mobile application designed with a focus on **Clean Architecture**, **Robust State Management**, and a minimalist **Dark UI** aesthetic. The project implements persistent storage for the shopping cart and user favorites, ensuring a seamless user experience across sessions.

## Clean Architecture
The project is strictly organized into three distinct layers:
1. **Data Layer**: Responsible for data retrieval and persistence.
   - `lib/data/repositories/`: Concrete implementations of repositories (Product, Cart, Favorite).
   - `lib/data/dto/`: Data Transfer Objects for safe JSON serialization.
   - `lib/data/data_test.dart`: Mock data source for Togolese specialty products.
2. **Domain Layer**: Contains the core business logic and entities.
   - `lib/domain/models/`: Core entities (Product).
   - `lib/domain/repositories/`: Abstract repository interfaces.
   - `lib/domain/wiewmodel/provider/`: Riverpod providers for application state.
3. **Presentation Layer**: The UI components.
   - `lib/screens/`: Modular screens (Home, Detail, Cart, Profile).
   - `lib/main.dart`: Application entry point and routing configuration.

## Riverpod Providers
We implement 5+ distinct Riverpod providers for granular state control:
- **productsProvider**: A FutureProvider that fetches the product list asynchronously.
- **productDetailProvider**: A Family FutureProvider for fetching specific product details by ID.
- **cartProvider**: An AsyncNotifierProvider that manages persistent shopping cart state.
- **favoriteProvider**: An AsyncNotifierProvider managing the user's persistent favorite items.
- **productFilterProvider**: A StateProvider handling search, category filtering, and price sorting.
- **userProfileProvider**: Provides static fictional user profile data.
- **filteredProductsProvider**: A derived provider that computes the filtered and sorted list based on current user preferences.

## Key Features
- **Persistence**: Using `shared_preferences` with JSON serialization through DTOs.
- **Error Handling**: Robust try-catch blocks and explicit `FormatException` handling in DTO parsing.
- **UI Design**: 
  - Zero border radius (`0.0`) on all cards, buttons, and inputs.
  - Custom typography using `GoogleFonts.abel`.
  - Deep dark theme (`#263238`) with high-contrast white accents.
- **Navigation**: Declarative routing using `go_router`.

## Getting Started
### Dependencies
- `flutter_riverpod`: State management.
- `shared_preferences`: Local persistence.
- `go_router`: Declarative routing.
- `google_fonts`: Custom typography.

### Installation
1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Run `flutter run` to start the application.

### Running Tests
Execute the comprehensive test suite with:
```bash
flutter test
```
The suite includes unit tests for repositories and widget tests for core screens.
