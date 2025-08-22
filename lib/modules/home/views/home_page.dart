import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/app_colors.dart';
import '../controllers/home_controller.dart';
import '../widgets/header_section.dart';
import '../widgets/features_section.dart';
import '../widgets/team_section.dart';
import '../widgets/products_section.dart';
import '../widgets/statistics_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                // Header Section
                HeaderSection(controller: controller),
                
                SizedBox(height: 24.h),
                
                // Features Section
                FeaturesSection(controller: controller),
                
                SizedBox(height: 32.h),
                
                // Team Section
                TeamSection(controller: controller),
                
                SizedBox(height: 32.h),
                
                // Products Section
                ProductsSection(controller: controller),
                
                SizedBox(height: 32.h),
                
                // Statistics Section
                StatisticsSection(controller: controller),
                
                SizedBox(height: 32.h),
                
                // Proceed Button
                _buildProceedButton(context, controller),
                
                SizedBox(height: 24.h),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildProceedButton(BuildContext context, HomeController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        width: double.infinity,
        height: 56.h,
        child: ElevatedButton(
          onPressed: controller.onProceedTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonPrimary,
            foregroundColor: AppColors.buttonText,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
            textStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Lato'
            ),
          ),
          child: Text('PROCEED'),
        ),
      ),
    );
  }
}

