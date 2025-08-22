import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../theme/app_colors.dart';
import '../controllers/home_controller.dart';
import '../../../data/models/feature_model.dart';

class FeaturesSection extends StatelessWidget {
  final HomeController controller;

  const FeaturesSection({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            'Features',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          
          SizedBox(height: 16.h),
          
          // Features Grid
          Obx(() {
            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 20.h,
                childAspectRatio: 0.75,
              ),
              itemCount: controller.features.length,
              itemBuilder: (context, index) {
                final feature = controller.features[index];
                return _buildFeatureItem(context, feature);
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(BuildContext context, FeatureModel feature) {
    return GestureDetector(
      onTap: () => controller.onFeatureTap(feature),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Feature Icon with Bottom Overflow Design
          Container(
            height: 70.h,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                // Yellow Background Circle
                Positioned(
                  top: 5.h,
                  child: Container(
                    width: 55.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryLight,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.secondary.withOpacity(0.2),
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Icon that overflows from the bottom of the yellow circle
                Positioned(
                  bottom: -3.h, // Icon positioned to overflow from bottom
                  child: Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      shape: BoxShape.circle,
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.black.withOpacity(0.06),
                      //     blurRadius: 2,
                      //     offset: Offset(0, 1),
                      //   ),
                      // ],
                    ),
                    child: Center(
                      child: feature.iconData != null
                          ? Icon(
                        feature.iconData,
                        color: AppColors.textPrimary,
                        size: 18.sp,
                      )
                          : feature.assetIcon != null
                          ? Image.asset(
                        feature.assetIcon!,
                        width: 50.w,
                        height: 50.h,
                        fit: BoxFit.contain,
                      )
                          : feature.networkIcon != null
                          ? Image.network(
                        feature.networkIcon!,
                        width: 20.w,
                        height: 20.h,
                        fit: BoxFit.contain,
                      )
                          : Icon(
                        Icons.extension, // fallback default
                        color: AppColors.textSecondary,
                        size: 18.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: 6.h),
          
          // Feature Name
          Container(
            width: double.infinity,
            child: Text(
              feature.name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
                fontSize: 9.sp,
                height: 1.1,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
