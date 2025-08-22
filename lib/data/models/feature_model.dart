import 'package:flutter/material.dart';

class FeatureModel {
  final String id;
  final String name;
  final String description;
  final String route;

  // Optional icon sources
  final IconData? iconData;
  final String? assetIcon;
  final String? networkIcon;

  FeatureModel({
    required this.id,
    required this.name,
    required this.description,
    required this.route,
    this.iconData,
    this.assetIcon,
    this.networkIcon,
  });
}

