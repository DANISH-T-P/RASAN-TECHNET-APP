import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/app_colors.dart';
import '../controllers/home_controller.dart';

class StatisticsSection extends StatelessWidget {
  final HomeController controller;

  const StatisticsSection({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            'Statistics',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          
          SizedBox(height: 16.h),
          
          // Statistics Card
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Interests',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Obx(() {
                      return GestureDetector(
                        onTap: () => _showYearSelector(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color: AppColors.textLight.withOpacity(0.3),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                controller.selectedYear.value,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 16.sp,
                                color: AppColors.textSecondary,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
                
                SizedBox(height: 20.h),
                
                // Bar Chart
                Obx(() {
                  return SizedBox(
                    height: 120.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: controller.statistics.map((stat) {
                        return _buildBarChartItem(context, stat);
                      }).toList(),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarChartItem(BuildContext context, dynamic stat) {
    final maxInterests = stat.maxInterests;
    final interests = stat.interests;
    final month = stat.month;
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Bar Chart (Dots)
        Container(
          height: 80.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(maxInterests, (index) {
              final isActive = index < interests;
              return Container(
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: isActive ? AppColors.chartActive : AppColors.chartInactive,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        ),
        
        SizedBox(height: 8.h),
        
        // Month Label
        Text(
          month,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  void _showYearSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select Year',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.h),
            Wrap(
              spacing: 8.w,
              children: [
                '2023-24',
                '2024-25',
                '2025-26',
              ].map((year) {
                return Obx(() {
                  final isSelected = controller.selectedYear.value == year;
                  return GestureDetector(
                    onTap: () {
                      controller.selectedYear.value = year;
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary : AppColors.background,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: isSelected ? AppColors.primary : AppColors.textLight.withOpacity(0.3),
                        ),
                      ),
                      child: Text(
                        year,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isSelected ? Colors.white : AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                });
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

