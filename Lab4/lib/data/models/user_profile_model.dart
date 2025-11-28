import '../../domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile {
  const UserProfileModel({
    required super.name,
    required super.profileImage,
    required super.greeting,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: (json['name'] as String?) ?? '',
      profileImage: (json['profile_image'] as String?) ?? '',
      greeting: (json['greeting'] as String?) ?? '',
    );
  }
}
