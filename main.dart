import 'dart:io';
import 'dart:math';

class QuizApp {
  final Map<String, String> allQuestions = {
   "What is the first month of the Islamic calendar?": "Muharram",
    "What is the meaning of 'Jannah' in Islam?": "Paradise",
    "What is the term for the call to prayer in Islam?": "Adhan",
    "What is the largest city in Pakistan by population?":"Karachi",
    "What is 2 + 2?": "4",
    "What is the chemical symbol for gold?": "Au",
    "What is the national language of Pakistan?": "Urdu",
    "What is the highest peak in Pakistan?": "K2",
    "Who was the first human to walk on the moon?": "Neil Armstrong",
    "What is the largest continent on Earth?": "Asia",
    "Who is the founder of Pakistan?": "Muhammad Ali Jinnah",
    "What is the national flower of Pakistan?": "Jasmine",
    "What is the largest planet in our solar system?": "Jupiter",
    "What is the chemical symbol for water?": "H2O",
    "What is the largest ocean on Earth?": "Pacific",
    "In which year did Pakistan gain independence?": "1947",
    "What is the main component of Earth's atmosphere?": "Nitrogen",
    "What is the opposite of addition?": "Subtraction",
    "What is the value of π (pi) to two decimal places?": "3.14",
    "What is an algorithm in programming?": "Step-by-step procedure",
    "How many colors are there in a rainbow?": "Seven",
    "What is the square root of 64?": "Eight",
    "What is the opposite of 'happy'?": "Sad",
    "How many principles of OOP are there?": "4",
    "What is the largest island in the world?": "Greenland",
    "What is the smallest prime number?": "Two",
    "What is the first letter of the alphabet?": "A",
    "What is the holy book of Islam?": "Quran",
    "In which month do Muslims fast during Ramadan?": "Ramadan",
    "What is the charity given by Muslims called?": "Zakat",
    "What is the pilgrimage to Mecca called?": "Hajj",
    'What is the first pillar of Islam?': "Shahada",
    'How many continents are there in the world?': 'Seven',
    "Which is the largest mammal on land?": "Elephant",
  };

  // List to store shuffled questions
  List<String> shuffledQuestions = [];
  // Setting the total number of questions in the quiz
  int questionLimit = 20;

  // Constructor for the QuizApp class
  QuizApp() {
    generateRandomQuestions();
  }

  // Method to generate random indices for questions
  void generateRandomQuestions() {
    // Shuffle the keys (questions) to ensure uniqueness
    shuffledQuestions = allQuestions.keys.toList()..shuffle();
  }

  // Method to start the quiz
  void startQuiz() {
    print("Welcome to the Quiz App!");
    print("Answer the following questions:");

    int correctAnswers = 0;

    // Iterate over the shuffled questions and limit to questionLimit
    for (String question in shuffledQuestions.take(questionLimit)) {
      // Asking the user the current question and getting their answer
      String userAnswer = askQuestion(question);
      String correctAnswer = allQuestions[question]!;

      // Checking if the user's answer is correct
      if (userAnswer.toLowerCase() == correctAnswer.toLowerCase()) {
        correctAnswers++;
      }
    }

    // Calculating and displaying quiz result
    double percentage = (correctAnswers / questionLimit) * 100;
    displayResult(correctAnswers, percentage);

    askToRestart();
  }

  // Method to ask the user a question and get their answer
  String askQuestion(String question) {
    stdout.write('$question: ');
    String answer = stdin.readLineSync() ?? '';
    return answer.trim();
  }

  // Method to display the quiz result
  void displayResult(int correctAnswers, double percentage) {
    print("\nQuiz Result:");
    print("Total Correct Answers: $correctAnswers");
    print("Percentage: $percentage%");

    // Displaying a message based on the user's performance
    if (percentage > 50) {
      print("Congratulations! You passed the quiz. 🎉");
    } else {
      print("You did not pass the quiz! Try Again");
    }
  }

  // Method to ask the user if they want to restart the quiz
  void askToRestart() {
    stdout.write("\nDo you want to restart the quiz? (yes/no): ");
    String choice = stdin.readLineSync()?.toLowerCase() ?? '';

    if (choice == 'yes') {
      generateRandomQuestions();
      startQuiz();
    } else {
      print("Thank You for Participating. I hope you Enjoyed!");
    }
  }
}

// Main function to start the quiz
void main() {
  QuizApp().startQuiz();
}