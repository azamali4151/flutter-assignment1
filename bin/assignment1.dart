import 'dart:io';

void main() {
  List<Map<String, dynamic>> students = [];

  while (true) {
    print('Enter student name (or type "exit" to finish):');
    String? name = stdin.readLineSync();

    if (name == null || name.toLowerCase() == 'exit') {
      break;
    }

    print('Enter score:');
    String? scoreInput = stdin.readLineSync();

    if (scoreInput == null) {
      print('Invalid score, try again.');
      continue;
    }

    int? score = int.tryParse(scoreInput);

    if (score == null) {
      print('Score must be a number, try again.');
      continue;
    }

    String ? grade = '';
    
    if(score >=80){
      grade += 'A+';
    }else if(score >=70  && score <80){
      grade += 'A';
    }else if(score >=60  && score <70){
      grade += 'A-';
    }else if(score >=50  && score <60){
      grade += 'B';
    }else{
      grade += 'F';
    }

    students.add({'name': name, 'score': score,'grade':grade});
    print('Student added!\n');

  }

  students.sort((a, b) => b['score'].compareTo(a['score']));
  print('sorted list of students by score (descending order)');

  students.asMap().forEach((index, value) {
    int id = index + 1;
    String name = value['name'];
    int score = value['score'];
    String grade = value['grade'];
    print('  Student Id: $id, Student Name: $name, Student Mark: $score, Student Grade: $grade');
  });

  print("Total No Of students: ${students.length}");
  print("Highest Score: ${students.first['score']}");
  print("Lowest  Score: ${students.last['score']}");

}
