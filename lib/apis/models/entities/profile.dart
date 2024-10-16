import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:linkear/apis/models/entities/user_avatar.dart';

part 'profile.g.dart';

@CopyWith()
@JsonSerializable()
class Profile {
  Profile({
    required this.id,
    required this.fname,
    required this.lname,
    required this.email,
    required this.emailVerified,
    required this.uname,
    this.avatar,
    this.phone,
    this.countryCode,
    this.phoneVerified,
    this.gender,
    this.dob,
    this.about,
    this.profession,
    this.location,
    this.website,
    required this.postsCount,
    required this.followersCount,
    required this.followingCount,
    required this.role,
    required this.isPrivate,
    required this.accountStatus,
    required this.verificationStatus,
    required this.isValid,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  @JsonKey(name: '_id')
  String id;

  @JsonKey(name: 'fname')
  String fname;

  @JsonKey(name: 'lname')
  String lname;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'emailVerified')
  bool emailVerified;

  @JsonKey(name: 'uname')
  String uname;

  @JsonKey(name: 'avatar')
  UserAvatar? avatar;

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'countryCode')
  String? countryCode;

  @JsonKey(name: 'phoneVerified')
  bool? phoneVerified;

  @JsonKey(name: 'gender')
  String? gender;

  @JsonKey(name: 'dob')
  String? dob;

  @JsonKey(name: 'about')
  String? about;

  @JsonKey(name: 'profession')
  String? profession;

  @JsonKey(name: 'location')
  String? location;

  @JsonKey(name: 'website')
  String? website;

  @JsonKey(name: 'postsCount')
  int postsCount;

  @JsonKey(name: 'followersCount')
  int followersCount;

  @JsonKey(name: 'followingCount')
  int followingCount;

  @JsonKey(name: 'accountStatus')
  String accountStatus;

  @JsonKey(name: 'isPrivate')
  bool isPrivate;

  @JsonKey(name: 'isValid')
  bool isValid;

  @JsonKey(name: 'isVerified')
  bool isVerified;

  @JsonKey(name: 'verificationStatus')
  String verificationStatus;

  @JsonKey(name: 'role')
  String role;

  @JsonKey(name: 'createdAt')
  DateTime createdAt;

  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;
}
