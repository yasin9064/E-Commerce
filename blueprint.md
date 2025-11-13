# Flutter E-Commerce App Blueprint

## Overview

This document outlines the architecture, features, and design of the Flutter E-Commerce App. The app is a modern, responsive, and feature-rich e-commerce application built with Flutter and Dart.

## Features

- **Home Screen:** A visually appealing home screen with a search bar, promotional banner, and product category list.
- **Product Screen:** Fetches and displays products from the Fake Store API.
- **Product Detail Screen:** Shows detailed information about a product and allows users to add it to the cart.
- **Shopping Cart:** A fully functional shopping cart that allows users to add, remove, and view items.
- **Wishlist:** Allows users to save their favorite products for later.
- **Profile Screen:** A user profile screen with a theme toggle.
- **Dark Mode:** A theme provider to manage the app's theme state and allow users to switch between light and dark modes.

## Architecture

- **State Management:** The app uses the `provider` package for state management, with `ChangeNotifier` and `ChangeNotifierProvider` to manage the theme, cart, and wishlist state.
- **Routing:** The app uses the `go_router` package for declarative routing, with a nested navigation structure.
- **Services:** The app uses a `ProductService` to fetch product data from the Fake Store API.
- **Models:** The app uses a `Product` model to represent product data.

## Design

- **Theme:** The app uses a custom `AppTheme` with light and dark themes.
- **Widgets:** The app uses a variety of custom widgets, including `ProductCard`, `AppShell`, and `SearchBar`.
- **Layout:** The app uses a responsive layout that adapts to different screen sizes.
