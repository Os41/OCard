class User {
  final String uid;

  User({required this.uid});
}

class UserData {
  final String uid;
  final String fullName;
  final String gender;
  final String college;
  final String role;
  final String picture;
  final bool schedule;
  final String scheduleDate;
  final List session;

  UserData({
    required this.fullName,
    required this.gender,
    required this.role,
    required this.uid,
    required this.college,
    required this.picture,
    required this.schedule,
    required this.scheduleDate,
    required this.session
  });
}