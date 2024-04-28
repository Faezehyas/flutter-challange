import 'dart:math';

String getRandomItem(List<String> items) {
  final random = Random();
  final index = random.nextInt(items.length);
  return items[index];
}