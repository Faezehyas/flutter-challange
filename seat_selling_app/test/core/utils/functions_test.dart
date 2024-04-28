import 'package:seat_selling_app/core/utils/functions.dart';
import 'package:test/test.dart';

void main() {
  test('getRandomItem returns a random item from the list', () {
    // Sample list of items
    final items = ['apple', 'banana', 'orange'];

    // Call the function multiple times
    final item1 = getRandomItem(items);
    final item2 = getRandomItem(items);
    final item3 = getRandomItem(items);

    // Check if the returned items are from the original list
    expect(items.contains(item1), true);
    expect(items.contains(item2), true);
    expect(items.contains(item3), true);

    // Due to randomness, returned items might be the same, 
    // but not necessarily. We can check that at least two differ.
    expect(item1 != item2 || item1 != item3 || item2 != item3, true);
  });
}
