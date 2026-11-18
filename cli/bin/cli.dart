import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:command_runner/command_runner.dart';

const version = "0.0.1";
/*! here we made the main as asycn since we want to await to wait 
* for tje runner to finish then procced to next
*/
void main(List<String> arguments) async {
  var runner = CommandRunner(); // creating an instance of the
  await runner.run(arguments); // here we will use await untill reponse provided
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
