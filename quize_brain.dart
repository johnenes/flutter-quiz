import 'question.dart';

// TODO: Here we define encapsulation by _ so that question can not be manipulated from the public _(private class object)

class QuizBrain{
  int _questionNumber = 0; // init value of questions in the array index is 0
  List<Question> _questionBank = [
    //Here are the question list more question can be added to it letter
    Question(questionText: 'You can lead  a cow down  stairs but not up stairs.', questionAnswers: false),
    Question(questionText: 'Approximately one quarter of human bones are  in the feet.', questionAnswers: true),
    Question(questionText: 'A slug\'s blood  is green.', questionAnswers: true),
    Question(questionText:'Some cats are actually allergic to human ',  questionAnswers:true),
    Question(questionText: 'It is illegal to pee in the Ocean in Portugal', questionAnswers: true),
    Question(questionText: 'No piece of Square dry paper can be folded in half more than 7 times', questionAnswers: true),
    Question(questionText: 'In London, UK, if you happen to die in the House of parliament, '
        'you are technically entitled to a state funeral, ''because the building is considered to scared a piece ', questionAnswers: true),
    Question(questionText: 'Loudest sound produced by any animal is 188 decibels. That animal is the African Elephant', questionAnswers: true),
    Question(questionText: 'The Total surface area of two human lungs is approximately 70 square metres.', questionAnswers: true),
    Question(questionText: 'Google was originally called \"Backrub\" ', questionAnswers: true),
    Question(questionText: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog', questionAnswers: true),
    Question(questionText: 'In West Virginia , USA , if you accidentally hit an animal with your car, you are free to take it home to  eat', questionAnswers: true)

  ];


  //TODO: the method void nextQuestion provide ability for next option once  a question is answered  _questionNumber is the encapsulated privately
  //TODO To avoid the system from being crash once we are out of question we we minus the length of the question by  1 and increment the number by addition of one
  //Functions for next questions once it click to avoid crash then minus the length by 1

  void nextQuestion (){
      if(_questionNumber < _questionBank.length-1 ){
        _questionNumber++;
      }
  }


// Method For getting text Questions by encapsulation
String qetQuestionText ( ){
    //TODO: the method here return the String values of the questions by accessing the
  // TODO questionBank through the index call alongside by questionText from our question dictionary
  return _questionBank[_questionNumber].questionText;
}

bool  getCorrectAnswers ( ){
    //TODO : Here return the answers from the  QuestionBanks
  return _questionBank[_questionNumber].questionAnswers;
}


  //TODO: Step 3 Part A - Create a method called isFinished() here that checks to see if we have reached the last question.
  //TODO It should return (have an output) true if we've reached the last question and it should return false if we're not
  //TODO there yet.

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.
      return true;
    } else {
      return false;
    }
  }

  //TODO: Step 4 part B - Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNumber = 0;
  }

}