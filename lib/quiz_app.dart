// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class QuizeModel {
  final String? question;
  final List<String>? Options;
  final int? answer;
  const QuizeModel({this.question, this.Options, this.answer});
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() {
    print("in create state");
    return _QuizAppState();
  }
}

class _QuizAppState extends State {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("In initState ");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("In didChange dependencies");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("In SetState");
  }

  @override
  void didUpdateWidget(covariant StatefulWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("In didUpdate");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("in deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("in dispose");
  }

  List allQuestions = [
    const QuizeModel(
        question: "Who is the father of the C++ ?",
        Options: ["Bill gates", "Bjarne Stroustrup", "Elon Musk", "Jef Bezos"],
        answer: 1),
    const QuizeModel(
        question: "Who invented Flutter framework?",
        Options: ["Google", " Microsoft", "Meta", "Amazon"],
        answer: 0),
    const QuizeModel(
        question: "Who is the owner of the SpaceX ?",
        Options: ["Bill gates", " Stev Jobs", "Elon Musk", "Jef Bezos"],
        answer: 2),
    const QuizeModel(
        question: "Who is the current owner of LinkedIn?",
        Options: ["Google", " Microsoft", "Meta", "Amazon"],
        answer: 1),
    const QuizeModel(
        question: "Who is the owner of the Biencaps ?",
        Options: ["Shashi Bagal", " Stev Jobs", "Elon Musk", "Jef Bezos"],
        answer: 0)
  ];

  int selectedIndex = -1;
  int questionIndex = 0;
  bool questionScreen = true;
  int rightAnswer = 0;
  MaterialStateProperty<Color?> checkOptions(int currentIndex) {
    if (selectedIndex != -1) {
      if (currentIndex == allQuestions[questionIndex].answer) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (selectedIndex == currentIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void validateScreen() {
    if (selectedIndex == -1) {
      return;
    }
    if (selectedIndex == allQuestions[questionIndex].answer) {
      rightAnswer += 1;
    }
    if (selectedIndex != -1) {
      selectedIndex = -1;

      if (questionIndex == allQuestions.length - 1) {
        questionScreen = false;
      }
      questionIndex += 1;
    }
  }

  Scaffold isQuestionScreen() {
    if (questionScreen == true) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            "Quiz App ",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.orange,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Question : ",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${questionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 80,
              width: 320,
              child: Text(
                allQuestions[questionIndex].question,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 330,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkOptions(0),
                ),
                onPressed: () {
                  if (selectedIndex == -1) {
                    setState(() {
                      selectedIndex = 0;
                    });
                  }
                },
                child: Text("A.${allQuestions[questionIndex].Options[0]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 330,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkOptions(1),
                ),
                onPressed: () {
                  if (selectedIndex == -1) {
                    setState(() {
                      selectedIndex = 1;
                    });
                  }
                },
                child: Text("B.${allQuestions[questionIndex].Options[1]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 330,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkOptions(2),
                ),
                onPressed: () {
                  if (selectedIndex == -1) {
                    setState(() {
                      selectedIndex = 2;
                    });
                  }
                },
                child: Text("C.${allQuestions[questionIndex].Options[2]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 330,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkOptions(3),
                ),
                onPressed: () {
                  if (selectedIndex == -1) {
                    setState(() {
                      selectedIndex = 3;
                    });
                  }
                },
                child: Text("D.${allQuestions[questionIndex].Options[3]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              validateScreen();
            });
          },
          tooltip: "next",
          child: const Icon(Icons.forward),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "QuizApp",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.network(
              "https://img.freepik.com/premium-vector/realistic-golden-trophy-with-text-space-falling-confetti_48799-141.jpg?w=740",
              height: 200,
              width: 380,
            ),
            const Text(
              "Congratulations",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "You are the hard worker man\n your score is :",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "$rightAnswer/${allQuestions.length}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                ),
                onPressed: () {
                  questionIndex = 0;
                  selectedIndex = -1;
                  questionScreen = true;
                  rightAnswer = 0;
                  setState(() {});
                },
                child: const Text(
                  "Restart",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print("in build");
    return isQuestionScreen();
  }
}
