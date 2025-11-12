import 'package:get_storage/get_storage.dart';

/// Shared GetStorage instance used across the app.
/// Placed here to avoid circular imports (don't import `main.dart`).
final box = GetStorage();
