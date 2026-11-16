import 'dart:io';

const version = "0.0.1";
void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == "help") {
    printUsage();
  } else if (arguments[0] == "version") {
    print("Dartpedia CLI version: $version");
  } else if (arguments[0] == "search") {
    // get the term pass by the arguments if any passed
    final String term = arguments.sublist(1).join(" ");

    // now pass it to the search function
    searchWikipedia(term);
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

//
void searchWikipedia(String? term) {
  // the null-aware assignment operator
  term ??= "";

// in case nothing passed in the argument cli, we will get as input from the user
  if (term.isEmpty) {
    print("Please provide an article title.");

    term = stdin.readLineSync();
  }

  print("Looking up articles about \"$term\". Please wait.");

  print("Here you go:");
}
