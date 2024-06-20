import 'package:chatgptapitest/ResultPage.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

// TextEditController : Testfield를 통해 _controller를 통해 제어할 수 있음
class _FirstPageState extends State<FirstPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("질문이 뭐야?"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
          ),
          TextButton(
              onPressed: () {
                String prompt = _controller.text; // 정보를 전달하는 파라미터로 사용
                Navigator.of(context).push(MaterialPageRoute(
                    // 페이지 이동을 위해 Navigator를 사용
                    builder: (context) =>
                        ResultPage(prompt))); // ResultPage : 답변을 받아올 페이지
              },
              child: const Text("Get Result")) // 페이지 이동 버튼
        ],
      ),
    );
  }
}
