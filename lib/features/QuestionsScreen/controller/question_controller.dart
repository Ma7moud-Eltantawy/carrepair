import 'package:get/get.dart';
import 'package:mechanic/core/enums.dart';
import 'package:mechanic/core/models/question_model/question_model.dart';
import 'package:mechanic/data/data_sources/questin_datasource.dart';

import '../../../core/utils/functions.dart';

class questioncontroller extends GetxController{
  QuestionsBaseDataSource remotedatasource=QuestionsRemotedatabase();
  bool loading= true;
  changeLoadingValue(){
    loading = !loading;
    update();
  }
  List<QuestionModel> questions=[];
  GetQuestion() async
  {
    final result=await remotedatasource.GetQuestions();
    if(result.requestState==RequestState.success){
      changeLoadingValue();
      questions=result.data!;
    }
    else{
      changeLoadingValue();
      Get.back();
      snackBarError(result.errorMessage??"Error");
    }
  }
  @override
  void onInit() {
    GetQuestion();
    super.onInit();
  }

}