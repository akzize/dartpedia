import 'dart:io';

void main() {
  loader();
}

void loader() async {
  List<String> loaderPatterns = ['Loading.  ', 'Loading.. ', 'Loading...'];
  int index;
  for (index = 0; index <= 9; index++) {
      // stdout.write("\r${loaderPatterns[index]}");
      stdout.write('\r${loaderPatterns[index % loaderPatterns.length]}');
      await Future.delayed(Duration(milliseconds: 400));
  }
}
