# Creating the project
`dart create` creates and scaffolds a new project. You can also use `-t` to specify a template, like `dart create -t console project_name`.

# Running the project

`dart run bin/cli.dart version`
OR
`dart run :cli version`

`version`: is the argument passed to the main to proint the version variable or it will print 
*Hello Me from Dart World!* if no params passed;

# Variables

## `final` and `const`
- const declares a compile-time constant. The value must be known at compile time and can never change.
- final creates a variable that can only be initialized once, but its value is determined at runtime, not compile time.


# Operators:
## The null-aware assignment operator
- `??=` is the null-aware assignment operator. It assigns a value to a variable only if that variable is currently null

```dart
void main() {
  int? score; // Initial value is null

  score ??= 10; // score is null, so it becomes 10
  print(score); // Output: 10

  score ??= 25; // score is already 10 (not null), so it stays 10
  print(score); // Output: 10
}
```

# Asynchronous programming in Dart
the http package

- to install the `http` package `dart pub add http`

or run `dart pub get` after adding in the `pubspec.yaml`
```yaml
dependencies:
  http: ^1.6.0

```