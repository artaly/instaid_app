class UserModel {
  String? userID;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? password;

  UserModel(
      {this.userID,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.password});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      userID: map['userID'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      password: map['password'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }
}
