class ProfileEntity {
  final String id;
  final String fullName;
  final String government;
  final String city;
  final List<int>? image;
  final String phoneNumber;

  ProfileEntity({
    required this.id,
    required this.fullName,
    required this.government,
    required this.city,
    required this.image,
    required this.phoneNumber,
  });
}
