class MessageDto {
  final String? id;
  final String? chatId;
  final String? createdById;
  final String? createdBy;
  final String? imageUrl;
  final String? reply;
  final DateTime? createdAt;
  final DateTime? viewedAt;

  MessageDto({
    this.id,
    this.chatId,
    this.createdById,
    this.createdBy,
    this.imageUrl,
    this.reply,
    this.createdAt,
    this.viewedAt,
  });

  factory MessageDto.fromJsonCmplain(Map<String, dynamic> json) {
    return MessageDto(
      id: json['id'] as String?,
      createdById: json['createdById'] as String?,
      chatId: json['complainId'] as String?,
      createdBy: json['createdBy'] as String?,
      imageUrl: json['imageUrl'] as String?,
      reply: json['reply'] as String?,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      viewedAt:
          json['viewedAt'] != null ? DateTime.parse(json['viewedAt']) : null,
    );
  }


   factory MessageDto.fromJsonRequest(Map<String, dynamic> json) {
    return MessageDto(
      id: json['id'] as String?,
      createdById: json['createdById'] as String?,
      chatId: json['requestId'] as String?,
      createdBy: json['createdBy'] as String?,
      imageUrl: json['imageUrl'] as String?,
      reply: json['reply'] as String?,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      viewedAt:
          json['viewedAt'] != null ? DateTime.parse(json['viewedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdById': createdById,
      'complainId': chatId,
      'createdBy': createdBy,
      'imageUrl': imageUrl,
      'reply': reply,
      'createdAt': createdAt?.toIso8601String(),
      'viewedAt': viewedAt?.toIso8601String(),
    };
  }
}
