class Profile{
  String firstname;
  String lastname;
  String dob;
  String phone;
  String gender;
  String email;
  String password;

  Profile(
        {
          required this.password,
          required this.firstname,
          required this.lastname,
          required this.gender,
          required this.phone,
          required this.dob,
          required this.email
        }
      );

}