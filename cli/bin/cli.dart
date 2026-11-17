import 'dart:io';

import 'package:http/http.dart' as http;

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
void searchWikipedia(List<String>? arguments) async {
  String? articleTitle = "";
  // in case nothing passed in the argument cli, we will get as input from the user
  if (arguments == null || arguments.isEmpty) {
    print("Please provide an article title.");

    // wait fir the inputs from the user
    articleTitle = stdin.readLineSync();
  } else {
    // other wise joint the arguments
    articleTitle = arguments.join(" ");
  }

  print("Looking up articles about \"$articleTitle\". Please wait.");

  final results = await getWikipediaArticle(articleTitle);
  print("Here you go:");

  print(results);
}

// function to get the wiki articales
Future<String> getWikipediaArticle(String? articleTitle) async {
  final url = Uri.https(
    "en.wikipedia.org", // Wikipedia API domain
    '/api/rest_v1/page/summary/$articleTitle', // API path for article summary
  );

  final response = await http.get(url);

  // handle the response
  if (response.statusCode == 200) {
    return response.body;
  }

  return 'Error: Failed to fetch article "$articleTitle". Status code: ${response.statusCode}';
}
