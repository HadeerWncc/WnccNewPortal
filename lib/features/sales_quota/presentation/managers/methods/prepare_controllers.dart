import 'package:flutter/material.dart';
import 'package:wncc_portal/features/sales_quota/data/models/daily_quota_model/sales_quota.dart';

List<Map<String, TextEditingController>> prepareControllers(
    List<SalesQuota> salesQuotas) {
  List<Map<String, TextEditingController>> controllers =
      salesQuotas.map((quota) {
    return {
      'salesId': TextEditingController(text: quota.salesId.toString()),
      'totalQuota': TextEditingController(text: quota.totalQuota.toString()),
      'deliveryBagsQuota':
          TextEditingController(text: quota.deliveryBagsQuota.toString()),
      'deliveryBulkQuota':
          TextEditingController(text: quota.deliveryBulkQuota.toString()),
      'pickupBagsQuota':
          TextEditingController(text: quota.pickupBagsQuota.toString()),
      'pickupBulkQuota':
          TextEditingController(text: quota.pickupBulkQuota.toString()),
      'totalBagsQuota':
          TextEditingController(text: quota.totalBagsQuota.toString()),
      'totalBulkQuota':
          TextEditingController(text: quota.totalBulkQuota.toString()),
      'extraBagsQuota':
          TextEditingController(text: quota.extraBagsQuota.toString()),
      'extraBulkQuota':
          TextEditingController(text: quota.extraBulkQuota.toString()),
      'settelementBagsQuota':
          TextEditingController(text: quota.settelementBagsQuota.toString()),
      'settelementBulkQuota':
          TextEditingController(text: quota.settelementBulkQuota.toString()),
    };
  }).toList();
  return controllers;
}
