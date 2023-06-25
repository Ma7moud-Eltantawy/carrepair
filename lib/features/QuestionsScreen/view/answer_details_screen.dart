import 'package:flutter/material.dart';


import '../../../core/models/question_model/question_model.dart';
import '../../../widgets/animated_column.dart';
import '../../../widgets/network_images_slider.dart';

class AnswerDetailsScreen extends StatelessWidget {
  final QuestionModel question;

  AnswerDetailsScreen({required this.question});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              if(question.images.isNotEmpty)...[
                NetworkImagesSlider(
                  images: question.images,
                  height: 200,
                ),
              ],

              Padding(
                padding: const EdgeInsets.all(16),
                child: AnimatedColumn(
                  children: [
                    Text(
                      question.q,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      question.a,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
