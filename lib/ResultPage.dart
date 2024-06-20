import 'package:chatgptapitest/main.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final String prompt;
  const ResultPage(this.prompt, {super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result from GPT"),
      ),
      // body: Text(widget.prompt),
      body: FutureBuilder<String>(
        // future의 내용이 완료되면 그 결과에 따라 builder 속 내용을 실행
        future: generateText(
            widget.prompt), // _ResultPageState에서 ResultPage클래스 내의 정보인 promt에 접근
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:
                    CircularProgressIndicator()); // future 작업 기다리는 중에는 프로그래스바 표출
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}'); // future 에러 발생 시 text로 표출
          } else {
            return Text('${snapshot.data}'); // 정상일 때는 그 결과 값을 text위젯에 출력
          }
        },
      ),
    );
  }
}
