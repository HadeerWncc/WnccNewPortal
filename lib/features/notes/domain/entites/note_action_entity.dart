class NoteActionEntity {
  final String subject;
  final String description;
  final bool isPrivate;
  final List<String> users;

  NoteActionEntity({
    required this.subject,
    required this.description,
    required this.isPrivate,
    required this.users,
  });

  Map<String, dynamic> toJson() => {
        'subject': subject,
        'description': description,
        'isPrivate': isPrivate,
        'users': users,
      };
}
