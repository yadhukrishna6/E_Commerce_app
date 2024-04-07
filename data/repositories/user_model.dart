import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/utills/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstname;
  String lastname;
  final String username;
  final String email;
  String phoneNumber;
  String profilepicture;
  UserModel(
      {required this.id,
      required this.username,
      required this.email,
      required this.firstname,
      required this.lastname,
      required this.phoneNumber,
      required this.profilepicture});
  String get fullName => '$firstname $lastname';
  String get formattedphonrnum => TFormatters.formatPhoneNumber(phoneNumber);
  static List<String> nameparts(fullName) => fullName.split(" ");
  static String genarateusername(fullName) {
    List<String> nameparts = fullName.split(" ");
    String firstName = nameparts[0].toLowerCase();
    String lastname = nameparts.length > 1 ? nameparts[1].toLowerCase() : "";
    String camelcaseusername = "$firstName$lastname";
    String usernamewithprifix = 'cwt_$camelcaseusername';
    return usernamewithprifix;
  }

  static UserModel empty() => UserModel(
      id: '',
      username: '',
      email: '',
      firstname: '',
      lastname: '',
      phoneNumber: '',
      profilepicture: '');
  Map<String, dynamic> tojson() {
    return {
      'FirstName': firstname,
      'LastName': lastname,
      'UserName': username,
      'Email': email,
      'phoneNumber': phoneNumber,
      'profilepitcure': profilepicture,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          username: data['UserName'] ?? '',
          email: data['Email'] ?? '',
          firstname: data['FirstName'] ?? '',
          lastname: data['LastName'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',
          profilepicture: data['profilepitcure'] ?? '');
    } else {
      return UserModel.empty();
    }
  }
}
