import 'dart:convert';

import 'package:chatgptapitest/FirstPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apiKey = '본인이 발급 받은 API key'; // API Key 저장
const apiUrl = 'https://api.openai.com/v1/completions'; // API를 사용하기 위해 저장하는 url

void main() {
  runApp(const MyApp());

  String prompt = "what is elephant?";
  Future<String> data = generateText(prompt);
  data.then((value) {
    print(value);
  });
}

// generateText함수 : String자료형의 'prompt'문장을 입력 받아서 ChatGPT에게 질문하고 질문헤 해당하는 답변을 출력하는 함수
Future<String> generateText(String prompt) async {
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey'
    },
    body: jsonEncode({
      "model": "text-davinci-003",
      'prompt': prompt,
      'max_tokens': 1000,
      'temperature': 0,
      'top_p': 1,
      'frequency_penalty': 0,
      'presence_penalty': 0
    }),
  );

  Map<String, dynamic> newresponse =
      jsonDecode(utf8.decode(response.bodyBytes));

  return newresponse['choices'][0]['text'];
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
    );
  }
}
