import 'dart:io';

const version = "0.0.1";
void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == "help") {
    printUsage();
  } else if (arguments[0] == "version") {
    print("Dartpedia CLI version: $version");
  } else if (arguments[0] == "search") {
    // get the term pass by the arguments if any passed
    //? cause the list can be nullable we set it as nullable by adding ?
    List<String>? inputArgs = arguments.length > 1
        ? arguments.sublist(1)
        : null;

    // now pass it to the search function
    searchWikipedia(inputArgs);
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
void searchWikipedia(List<String>? arguments) {
  String? searchTerm = "";
  // in case nothing passed in the argument cli, we will get as input from the user
  if (arguments == null || arguments.isEmpty) {
    print("Please provide an article title.");

// wait fir the inputs from the user 
    searchTerm = stdin.readLineSync();
  } else {

    // other wise joint the arguments
    searchTerm = arguments.join(" ");
  }

  print("Looking up articles about \"$searchTerm\". Please wait.");

  print("Here you go:");
}
