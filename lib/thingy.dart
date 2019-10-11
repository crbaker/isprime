class Thingy {
  List<int> checkPrimality(int number) {
    var divisors = List<int>();

    if (number <= 1) {
      divisors.add(0);
    } else if (number < 3) {
    } else {
      var i = 2;

      while (i < number) {
        if ((number % i) == 0) {
          divisors.add(i);
        }
        i++;
      }
    }

    return divisors;
  }
}


class User {
  final name;
  final surname;
  
  User({this.name, this.surname});
}
