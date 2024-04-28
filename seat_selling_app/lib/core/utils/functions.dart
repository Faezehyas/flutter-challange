import 'dart:math';

/// Picks a random item from the provided list of strings.

/// This function uses the `dart:math` library's `Random` class to generate
/// a random index within the list's bounds. It then retrieves the item at
/// that index and returns it.
String getRandomItem(List<String> items) {
  final random = Random();
  final index = random.nextInt(items.length);
  return items[index];
}
