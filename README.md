# haupcar

# Flutter Mobile Application with BLoC and Clean Architecture

This repository contains a Flutter mobile application built using the Flutter framework with BLoC for state management and Clean Architecture. The application meets the requirements of the exam task and includes additional features for a more robust user experience.

## APK file - https://github.com/eizinhtun/haupcar/blob/main/apk_file/app-release.apk

## Table of Contents
- Project Overview
- Features
- API Integration
- Language Support
- State Management with BLoC
- UI Design
- Setting Up the Project
- Running the Application
- Git Repository Setup
- Submitting the Task
- Folder Structure

## Project Overview
This Flutter mobile application allows users to browse a list of product categories and view the products available within each category. The app integrates with a mock API provided by DummyJSON, and features the following:
- A Categories page showing a list of available categories.
- A Product List page displaying products for the selected category.
- The ability to change languages within the app (note that this only affects UI text, not API data).
- State management using BLoC (Business Logic Component).
- The app follows Clean Architecture principles for better maintainability and scalability.

## Features
### Two Main Pages:
- **Categories Page**: Displays a list of categories fetched from the API.
- **Product List Page**: Displays a list of products for a selected category.

### API Integration:
- Categories are fetched from the API endpoint: `https://dummyjson.com/products/categories`.
- Product details for each category are fetched from: `https://dummyjson.com/products/category/{category}`.

### Language Support:
- The app supports multiple languages. Users can change the language from the hamburger menu, affecting only the app's UI (headers, text, etc.), but not the API data.

### State Management with BLoC:
- The app uses the BLoC pattern to manage state across the application. Categories and product data are managed via dedicated blocs.

### Custom UI Design:
- The UI is styled using Material Design components. The design is flexible, and additional customizations are encouraged.

## API Integration
The application integrates with the DummyJSON API for mock data. The following endpoints are used:
- **Categories**: `https://dummyjson.com/products/categories`
- **Products for a category**: `https://dummyjson.com/products/category/{category}`

The app fetches these data points and displays them in an easy-to-use interface. The API responses are parsed and displayed using appropriate models.

## Language Support
The application provides a language switcher in the hamburger menu that allows users to toggle between different languages.
- UI text such as headers and button labels will change according to the selected language.
- The language change does not affect data fetched from the API (categories and product lists remain in their original language).

## State Management with BLoC
The application uses the BLoC pattern for managing state. The following blocs are used:
- **CategoryBloc**: Manages the state related to categories.
- **ProductBloc**: Manages the state related to products in a selected category.
- **LanguageBloc**: Manages the application's language state.

BLoC provides a clean way to separate UI from business logic and ensures that data flow is consistent and easy to manage.

## UI Design
The app uses Material Design widgets and principles to ensure a consistent and user-friendly experience. Custom widgets are created for displaying categories and products, and the UI is designed to be responsive across different screen sizes.

Key UI components include:
- **ListView** for displaying categories and product items.
- **ShimmerLoading** widgets for loading states.
- **ErrorStateWidget** to handle API errors.
- **NoInternetWidget** for handling connectivity issues.
