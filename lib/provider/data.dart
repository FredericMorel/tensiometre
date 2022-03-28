class User {
  String email;
  String login;
  String avatar;

  User(this.email, this.login, this.avatar);
}

Future<User> getUser() async {
  var user1 = User("fred@fred.fr", "login", "avatar");

  await Future.delayed(const Duration(seconds: 2));
  return user1;
}

class Pressure {
  int sys;
  int dias;
  int pouls;
  DateTime date = DateTime.now();
  String status = "neutre";

  Pressure(this.sys, this.dias, this.pouls, this.status);
}

List<Pressure> listPressure = [];

Future<List<Pressure>> updatePressure(Pressure pressure) async {
  var lst = List<Pressure>.from(listPressure);
  lst.add(pressure);
  await Future.delayed(const Duration(seconds: 2));
  listPressure = lst;
  return lst;
}
