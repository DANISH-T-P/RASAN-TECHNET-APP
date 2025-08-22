import 'dart:convert';
import 'package:flutter/services.dart';
import '../../data/models/team_member_model.dart';

class TeamService {
  static Future<List<TeamMemberModel>> loadTeamMembers() async {
    try {
      // Load JSON file from assets
      final String response = await rootBundle.loadString('assets/data/team_members.json');
      final Map<String, dynamic> data = await json.decode(response);
      
      // Parse team members from JSON
      final List<dynamic> teamMembersJson = data['team_members'] ?? [];
      final List<TeamMemberModel> teamMembers = teamMembersJson
          .map((json) => TeamMemberModel.fromJson(json))
          .toList();
      
      return teamMembers;
    } catch (e) {
      print('Error loading team members: $e');
      // Return fallback data if JSON loading fails
      return _getFallbackTeamMembers();
    }
  }

  static List<TeamMemberModel> _getFallbackTeamMembers() {
    return [
      TeamMemberModel(
        id: '1',
        name: 'Mohan Sau',
        role: 'Project Manager',
        department: 'Project Management',
        avatarColor: const Color(0xFF0D9488),
        email: 'mohan.sau@rasantechnet.com',
        isOnline: true,
      ),
      TeamMemberModel(
        id: '2',
        name: 'Priya Sharma',
        role: 'Team Lead',
        department: 'Development',
        avatarColor: const Color(0xFFDC2626),
        email: 'priya.sharma@rasantechnet.com',
        isOnline: true,
      ),
      TeamMemberModel(
        id: '3',
        name: 'Rajesh Kumar',
        role: 'Senior Developer',
        department: 'Development',
        avatarColor: const Color(0xFF60A5FA),
        email: 'rajesh.kumar@rasantechnet.com',
        isOnline: false,
      ),
      TeamMemberModel(
        id: '4',
        name: 'Anjali Patel',
        role: 'UI/UX Designer',
        department: 'Design',
        avatarColor: const Color(0xFF8B5CF6),
        email: 'anjali.patel@rasantechnet.com',
        isOnline: true,
      ),
      TeamMemberModel(
        id: '5',
        name: 'Amit Singh',
        role: 'Business Analyst',
        department: 'Analytics',
        avatarColor: const Color(0xFFF59E0B),
        email: 'amit.singh@rasantechnet.com',
        isOnline: false,
      ),
      TeamMemberModel(
        id: '6',
        name: 'Neha Gupta',
        role: 'QA Engineer',
        department: 'Quality Assurance',
        avatarColor: const Color(0xFF10B981),
        email: 'neha.gupta@rasantechnet.com',
        isOnline: true,
      ),
      TeamMemberModel(
        id: '7',
        name: 'Vikram Malhotra',
        role: 'DevOps Engineer',
        department: 'Operations',
        avatarColor: const Color(0xFFEF4444),
        email: 'vikram.malhotra@rasantechnet.com',
        isOnline: true,
      ),
      TeamMemberModel(
        id: '8',
        name: 'Sneha Reddy',
        role: 'Product Manager',
        department: 'Product',
        avatarColor: const Color(0xFF06B6D4),
        email: 'sneha.reddy@rasantechnet.com',
        isOnline: false,
      ),
      TeamMemberModel(
        id: '9',
        name: 'Arjun Mehta',
        role: 'Frontend Developer',
        department: 'Development',
        avatarColor: const Color(0xFF84CC16),
        email: 'arjun.mehta@rasantechnet.com',
        isOnline: true,
      ),
      TeamMemberModel(
        id: '10',
        name: 'Kavya Iyer',
        role: 'Marketing Specialist',
        department: 'Marketing',
        avatarColor: const Color(0xFFF97316),
        email: 'kavya.iyer@rasantechnet.com',
        isOnline: false,
      ),
    ];
  }
}

