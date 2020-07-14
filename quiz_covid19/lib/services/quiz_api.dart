import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_covid19/models/question.dart';

class QuizApi {
  static Future<List<Question>> fetch() async {
    try {
      var url =
          'https://script.google.com/macros/s/AKfycbw_-peJScQkl8c8PuKsjDOljJOneD3wViqeuGtN3RIsS4myFbE/exec';
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
        return List<Question>.from(
            data["questions"].map((x) => Question.fromMap(x)));
      } else {
        return List<Question>();
      }
    } catch (error) {
      print(error);
      return List<Question>();
    }
  }
}
