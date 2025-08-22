import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../data/models/user_model.dart';
import '../../../data/models/feature_model.dart';
import '../../../data/models/team_member_model.dart';
import '../../../data/models/product_model.dart';
import '../../../data/models/statistics_model.dart';
import '../../../theme/app_colors.dart';
import '../../../core/services/team_service.dart';

class HomeController extends GetxController {
  // Observable variables
  final Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  final RxList<FeatureModel> features = <FeatureModel>[].obs;
  final RxList<TeamMemberModel> teamMembers = <TeamMemberModel>[].obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;
  final RxList<StatisticsModel> statistics = <StatisticsModel>[].obs;
  final RxString selectedYear = '2024-25'.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadInitialData();
  }

  void loadInitialData() {
    isLoading.value = true;
    
    // Simulate API call delay
    Future.delayed(Duration(milliseconds: 500), () {
      _loadUserData();
      _loadFeatures();
      _loadTeamMembers();
      _loadProducts();
      _loadStatistics();
      isLoading.value = false;
    });
  }

  void _loadUserData() {
    currentUser.value = UserModel(
      id: '1',
      name: 'Vaishnavi',
      avatarUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
      email: 'vaishnavi@rasantechnet.com',
      location: 'Sadashiv Peth, Pune',
      role: 'Manager',
    );
  }

  void _loadFeatures() {
    features.value = [
      // Using IconData (FontAwesome)
      FeatureModel(
        id: '1',
        name: 'Material Marketpalce',
        // iconData: FontAwesomeIcons.store,
        assetIcon: 'assets/icons/material-marketplace.png',
        description: 'Buy and sell construction materials',
        route: '/material-marketplace',
      ),
      // Using Asset
      FeatureModel(
        id: '2',
        name: 'Construction Line Marketplace',
        assetIcon: 'assets/icons/construction.png',
        description: 'Construction equipment marketplace',
        route: '/construction-marketplace',
      ),
      FeatureModel(
        id: '3',
        name: 'ERP',
        assetIcon: 'assets/icons/erp.png',
        description: 'Enterprise Resource Planning',
        route: '/erp',
      ),
      // Using Network image
      FeatureModel(
        id: '4',
        name: 'CRM',
        // networkIcon: 'https://example.com/icon.png',
        assetIcon: 'assets/icons/crm.png',
        description: 'Customer Relationship Management',
        route: '/crm',
      ),
      FeatureModel(
        id: '5',
        name: 'HRMS',
        assetIcon: 'assets/icons/hrms.png',
        description: 'Human Resource Management System',
        route: '/hrms',
      ),
      FeatureModel(
        id: '6',
        name: 'Project Management',
        assetIcon: 'assets/icons/project-management.png',
        description: 'Project planning and tracking',
        route: '/project-management',
      ),
      FeatureModel(
        id: '7',
        name: 'Portfolio Management',
        assetIcon: 'assets/icons/portfolio.png',
        description: 'Portfolio tracking and management',
        route: '/portfolio-management',
      ),
      FeatureModel(
        id: '8',
        name: 'OVP',
        assetIcon: 'assets/icons/ovp.png',
        description: 'Online Video Platform',
        route: '/ovp',
      ),
    ];
  }

  void _loadTeamMembers() async {
    try {
      final members = await TeamService.loadTeamMembers();
      teamMembers.value = members;
    } catch (e) {
      print('Error loading team members: $e');
      // Fallback to static data
      teamMembers.value = [
        TeamMemberModel(
          id: '1',
          name: 'Mohan Sau',
          role: 'Project Manager',
          department: 'Project Management',
          avatarColor: AppColors.avatarColors[0],
          email: 'mohan.sau@rasantechnet.com',
        ),
        TeamMemberModel(
          id: '2',
          name: 'Priya Sharma',
          role: 'Team Lead',
          department: 'Development',
          avatarColor: AppColors.avatarColors[1],
          email: 'priya.sharma@rasantechnet.com',
        ),
        TeamMemberModel(
          id: '3',
          name: 'Rajesh Kumar',
          role: 'Senior Developer',
          department: 'Development',
          avatarColor: AppColors.avatarColors[2],
          email: 'rajesh.kumar@rasantechnet.com',
        ),
        TeamMemberModel(
          id: '4',
          name: 'Anjali Patel',
          role: 'UI/UX Designer',
          department: 'Design',
          avatarColor: AppColors.avatarColors[3],
          email: 'anjali.patel@rasantechnet.com',
        ),
        TeamMemberModel(
          id: '5',
          name: 'Amit Singh',
          role: 'Business Analyst',
          department: 'Analytics',
          avatarColor: AppColors.avatarColors[4],
          email: 'amit.singh@rasantechnet.com',
        ),
      ];
    }
  }

  void _loadProducts() {
    products.value = [
      ProductModel(
        id: '1',
        name: 'Manufacturing Sand',
        imageUrl: 'assets/images/manufacturing-sand.jpg',
        description: 'High-quality manufacturing sand for construction',
        interestsShown: 23,
        category: 'Construction Materials',
      ),
      ProductModel(
        id: '2',
        name: 'Sand',
        imageUrl: 'https://images.unsplash.com/photo-1704079611177-a3a60ce6f975',
        description: 'Premium sand',
        interestsShown: 23,
        category: 'Construction Materials',
      ),
      ProductModel(
        id: '3',
        name: 'Concrete Sand',
        imageUrl: 'assets/images/concreate-sand.jpg',
        description: 'Premium concrete sand for building projects',
        interestsShown: 23,
        category: 'Construction Materials',
      ),
    ];
  }

  void _loadStatistics() {
    statistics.value = [
      StatisticsModel(month: 'Apr', interests: 4, maxInterests: 5),
      StatisticsModel(month: 'May', interests: 2, maxInterests: 5),
      StatisticsModel(month: 'Jun', interests: 1, maxInterests: 5),
      StatisticsModel(month: 'Jul', interests: 4, maxInterests: 5),
      StatisticsModel(month: 'Aug', interests: 2, maxInterests: 5),
      StatisticsModel(month: 'Sep', interests: 1, maxInterests: 5),
      StatisticsModel(month: 'Oct', interests: 5, maxInterests: 5),
      StatisticsModel(month: 'Nov', interests: 4, maxInterests: 5),
      StatisticsModel(month: 'Dec', interests: 5, maxInterests: 5),
      StatisticsModel(month: 'Jan', interests: 4, maxInterests: 5),
      StatisticsModel(month: 'Feb', interests: 5, maxInterests: 5),
      StatisticsModel(month: 'Mar', interests: 3, maxInterests: 5),
    ];
  }

  void onFeatureTap(FeatureModel feature) {
    // Navigate to feature page
    Get.toNamed(feature.route);
  }

  void onTeamMemberTap(TeamMemberModel member) {
    // Navigate to team member profile
    Get.toNamed('/team-member/${member.id}');
  }

  void onProductTap(ProductModel product) {
    // Navigate to product details
    Get.toNamed('/product/${product.id}');
  }

  void onProceedTap() {
    // Navigate to main dashboard or next screen
    Get.toNamed('/dashboard');
  }

  void onSearchTap() {
    // Navigate to search screen
    Get.toNamed('/search');
  }

  void onFilterTap() {
    // Show filter options
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Filter Options', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            // Add filter options here
          ],
        ),
      ),
    );
  }

  void onNotificationTap() {
    // Navigate to notifications
    Get.toNamed('/notifications');
  }

  void onViewAllTeamTap() {
    // Navigate to team page
    Get.toNamed('/team');
  }
}
