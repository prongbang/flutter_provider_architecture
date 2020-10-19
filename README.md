# flutter_provider_architecture

### Example

- https://github.com/flutter/samples/blob/master/provider_counter/lib/main.dart

### Provider

```dart
class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }
}
```

### ChangeNotifierProvider

```dart
ChangeNotifierProvider(
  create: (context) => Counter(),
  child: MyApp(),
),
```

### Consumer

```dart
Consumer<Counter>(
  builder: (context, counter, child) => Text(
    '${counter.value}',
    style: Theme.of(context).textTheme.headline4,
  ),
),
```

### Action

```dart
var counter = context.read<Counter>();
counter.increment();
```