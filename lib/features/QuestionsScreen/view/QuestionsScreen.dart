import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanic/features/QuestionsScreen/controller/question_controller.dart';

import '../../../widgets/loading/main_loading.dart';
import '../widgets/no_questions.dart';
import '../widgets/questions_list.dart';
class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<questioncontroller>(
        init: questioncontroller(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('الاسئلة الشائعة'),
            ),
            body: controller.loading
                ? const MainLoading()
                : controller.questions.isEmpty
                ? const NoQuestions()
                : QuestionsList(
              questions: controller.questions,
            ),
          );
        });
  }
}
