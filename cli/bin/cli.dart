const version = "0.0.1";
void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == "help") {
    printUsage();
  } else if (arguments[0] == "version") {
    print("Dartpedia CLI version: $version");
  } else {
    printUsage();
  }
}

//? This will be used to let the user how to use or know more about the CLI
void printUsage() {
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'",
  );
}
