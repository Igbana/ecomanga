import 'package:ecomanga/models/models.dart';

class User {
  const User({
    required this.id,
    required this.userId,
    required this.email,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.phoneNo,
    required this.picture,
    required this.role,
    required this.balance,
    required this.gender,
    required this.dob,
    required this.isBlockedUntil,
    required this.emailVerifiedAt,
    required this.phoneNoVerifiedAt,
    required this.joinedAt,
    required this.updatedAt,
    required this.isVerified,
    this.shippingAddresses = const [],
    this.badges = const [],
    this.communities = const [],
    this.followers = const [],
    this.socialAccounts = const [],
    this.challenges = const [],
  });
  final String id, userId, email, username, firstName;
  final String lastName, phoneNo, picture;
  final Role role;
  final int balance;
  final Gender gender;
  final DateTime dob, isBlockedUntil, emailVerifiedAt;
  final DateTime phoneNoVerifiedAt, joinedAt, updatedAt;
  final bool isVerified;
  final List shippingAddresses, badges, communities, followers;
  final List socialAccounts, challenges;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'email': email,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNo': phoneNo,
      'picture': picture,
      'role': role,
      'balance': balance,
      'gender': gender,
      'dob': dob,
      'isBlockedUntil': isBlockedUntil,
      'emailVerifiedAt': emailVerifiedAt,
      'phoneNoVerifiedAt': phoneNoVerifiedAt,
      'joinedAt': joinedAt,
      'updatedAt': updatedAt,
      'isVerified': isVerified,
      'shippingAddresses': shippingAddresses,
      'badges': badges,
      'communities': communities,
      'followers': followers,
      'socialAccounts': socialAccounts,
      'challenges': challenges,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userId: json['userId'],
      email: json['email'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNo: json['phoneNo'],
      picture: json['picture'],
      role: json['role'],
      balance: json['balance'],
      gender: json['gender'],
      dob: json['dob'],
      isBlockedUntil: json['isBlockedUntil'],
      emailVerifiedAt: json['emailVerifiedAt'],
      phoneNoVerifiedAt: json['phoneNoVerifiedAt'],
      joinedAt: json['joinedAt'],
      updatedAt: json['updatedAt'],
      isVerified: json['isVerified'],
      shippingAddresses: json['shippingAddresses'],
      badges: json['badges'],
      communities: json['communities'],
      followers: json['followers'],
      socialAccounts: json['socialAccounts'],
      challenges: json['challenges'],
    );
  }
}
