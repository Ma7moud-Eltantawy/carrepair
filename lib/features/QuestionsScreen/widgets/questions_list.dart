import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mechanic/core/manager/lottie_manager.dart';
import 'package:mechanic/features/QuestionsScreen/widgets/question_card.dart';


import '../../../core/models/question_model/question_model.dart';

class QuestionsList extends StatelessWidget {
  const QuestionsList({Key? key, required this.questions}) : super(key: key);

  final List<QuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [

        Lottie.asset(
          LottieManager.chatBG,
        ),
        Container(color: Colors.white.withOpacity(.8)),
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: questions.length,
          itemBuilder: (c, i) => QuestionCard(question: questions[i]),
        ),
      ],
    );
  }
}
