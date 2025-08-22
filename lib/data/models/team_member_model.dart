import 'package:flutter/material.dart';

class TeamMemberModel {
  final String id;
  final String name;
  final String? avatarUrl;
  final String role;
  final String department;
  final Color avatarColor;
  final String email;
  final bool isOnline;

  TeamMemberModel({
    required this.id,
    required this.name,
    this.avatarUrl,
    required this.role,
    required this.department,
    required this.avatarColor,
    required this.email,
    this.isOnline = false,
  });

  factory TeamMemberModel.fromJson(Map<String, dynamic> json) {
    return TeamMemberModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      avatarUrl: json['avatarUrl'],
      role: json['role'] ?? '',
      department: json['department'] ?? '',
      avatarColor: _parseColor(json['avatarColor'] ?? '#0D9488'),
      email: json['email'] ?? '',
      isOnline: json['isOnline'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatarUrl': avatarUrl,
      'role': role,
      'department': department,
      'avatarColor': '#${avatarColor.value.toRadixString(16).substring(2)}',
      'email': email,
      'isOnline': isOnline,
    };
  }

  static Color _parseColor(String colorString) {
    try {
      if (colorString.startsWith('#')) {
        colorString = colorString.substring(1);
      }
      return Color(int.parse('FF$colorString', radix: 16));
    } catch (e) {
      return const Color(0xFF0D9488); // Default teal color
    }
  }
}
