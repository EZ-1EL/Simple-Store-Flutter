## Simple Store App

A Flutter demo app that showcases a simple storefront using the Fake Store API. It fetches products, displays them in a grid, and lets you navigate to an update screen to edit a product's details.

<p align="center">
<img src="https://github.com/EZ-1EL/Simple-Store-Flutter/blob/main/product1.png" width="400">
<img src="https://github.com/EZ-1EL/Simple-Store-Flutter/blob/main/product2.png" width="400">
<img src="https://github.com/EZ-1EL/Simple-Store-Flutter/blob/main/Update%20.png" width="400">
</p>



### Features
- **Product listing**: Fetches and displays all products in a responsive grid.
- **Product update**: Tap a product card to navigate to an update form and send a PUT request.
- **Categories (services included)**: Services are available to fetch all categories and products by category.
- **Clean UI widgets**: Reusable button and form field widgets.

### Tech Stack
- **Flutter** (Dart)
- **HTTP** for networking
- **Google Fonts**, **Font Awesome Flutter**, **modal_progress_hud_nsn** for UI/UX

### Project Structure
```text
lib/
  helper/           # Networking helper (Api wrapper for GET/POST/PUT)
  models/           # Data models (Product, Rating)
  services/         # API services (get all, categories, add, update)
  screens/          # UI screens (home, update product)
  widgets/          # Reusable UI components
  main.dart         # App entry with routes
```

Key files:
- `lib/helper/api.dart`: Thin wrapper around `http` for GET/POST/PUT with optional bearer token.
- `lib/models/products_model.dart`: `ProductsModels` and `RatingModel` with JSON factories.
- `lib/services/get_all_product_service.dart`: Fetches all products.
- `lib/services/all_categories_service.dart`: Fetches all categories.
- `lib/services/categories_service.dart`: Fetches products for a given category.
- `lib/services/add_product.dart`: Adds a product (POST).
- `lib/services/update_product.dart`: Updates a product by id (PUT).
- `lib/screens/home_page.dart`: Grid listing of products; tap to navigate to update.
- `lib/screens/update_product_page.dart`: Form to update a product.

### API
This app uses the public `https://fakestoreapi.com` endpoints:
- GET `https://fakestoreapi.com/products`
- GET `https://fakestoreapi.com/products/categories`
- GET `https://fakestoreapi.com/products/category/{categoryName}`
- POST `https://fakestoreapi.com/products`
- PUT `https://fakestoreapi.com/products/{id}`

You can also find a Postman collection at `Store api.postman_collection.json`.

### Using the Postman collection
1. Open Postman and click Import.
2. Choose File and select `Store api.postman_collection.json` from the repo root.
3. The collection includes:
   - `all products` (GET `/products`)
   - `all categories` (GET `/products/categories`)
   - `get cagegory` (GET `/products/category/:category_name`) — set the `category_name` path variable
   - `Add prouct` (POST `/products`) — send `title`, `price`, `description`, `image`, `category` as urlencoded body
   - `udate` (PUT `/products/:id`) — set `id` path variable; send fields as urlencoded body
4. If you need auth, switch the request Auth tab to Bearer Token and paste your token (Fake Store API works without it for demo endpoints).

### Getting Started
Prerequisites:
- Flutter SDK installed and set up
- Android Studio or Xcode for device emulators (or a physical device)

Install dependencies and run:
```bash
flutter pub get
flutter run
```

Run on a specific platform/device, for example Android:
```bash
flutter run -d android
```

### Notes
- The update screen uses a simple form; leave a field empty to keep the original value.
- Networking is done via the `Api` helper; errors throw `Exception` with status code context.

### Contributing
Issues and PRs are welcome. Before committing, format and analyze:
```bash
flutter format .
flutter analyze
```


