class UserProfile {
  const UserProfile({
    required this.name,
    required this.profileImage,
    required this.greeting,
  });

  final String name;
  final String profileImage;
  final String greeting;

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: (json['name'] as String?) ?? '',
      profileImage: (json['profile_image'] as String?) ?? '',
      greeting: (json['greeting'] as String?) ?? '',
    );
  }
}
