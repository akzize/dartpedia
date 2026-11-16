const version = "0.0.1";
void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Hello Me from Dart World!');
  } else if (arguments[0] == "version") {
    print("Dartpedia CLI version: $version");
  }
}
