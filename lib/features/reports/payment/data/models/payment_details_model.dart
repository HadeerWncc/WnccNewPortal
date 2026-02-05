import 'package:equatable/equatable.dart';

class PaymentDetailsModel extends Equatable {
  final String? customer;
  final String? customerName;
  final String? customerRegion;
  final String? regionDesc;
  final int? amountInLc;
  final int? amount;
  final String? houseBank;
  final String? accountId;
  final String? bankGl;
  final String? bankDesc;
  final String? documentNo;
  final String? postingDate;
  final String? documentDate;
  final String? createdBy;
  final String? ci;
  final String? customerClassification;
  final int? pk;
  final String? postingKey;
  final String? exchRate;
  final String? currency;
  final dynamic reversal;
  final String? depositeNumber;
  final String? salesId;
  final String? salesRepName;
  final String? group;
  final dynamic valueDate;
  final String? creditArea;
  final int? month;
  final int? year;

  const PaymentDetailsModel({
    this.customer,
    this.customerName,
    this.customerRegion,
    this.regionDesc,
    this.amountInLc,
    this.amount,
    this.houseBank,
    this.accountId,
    this.bankGl,
    this.bankDesc,
    this.documentNo,
    this.postingDate,
    this.documentDate,
    this.createdBy,
    this.ci,
    this.customerClassification,
    this.pk,
    this.postingKey,
    this.exchRate,
    this.currency,
    this.reversal,
    this.depositeNumber,
    this.salesId,
    this.salesRepName,
    this.group,
    this.valueDate,
    this.creditArea,
    this.month,
    this.year,
  });

  factory PaymentDetailsModel.fromJson(Map<String, dynamic> json) {
    return PaymentDetailsModel(
      customer: json['customer'] as String?,
      customerName: json['customerName'] as String?,
      customerRegion: json['customerRegion'] as String?,
      regionDesc: json['regionDesc'] as String?,
      amountInLc: json['amountInLC'] as int?,
      amount: json['amount'] as int?,
      houseBank: json['houseBank'] as String?,
      accountId: json['accountId'] as String?,
      bankGl: json['bankGL'] as String?,
      bankDesc: json['bankDesc'] as String?,
      documentNo: json['documentNo'] as String?,
      postingDate: json['postingDate'] as String?,
      documentDate: json['documentDate'] as String?,
      createdBy: json['createdBy'] as String?,
      ci: json['ci'] as String?,
      customerClassification: json['customerClassification'] as String?,
      pk: json['pk'] as int?,
      postingKey: json['postingKey'] as String?,
      exchRate: json['exchRate'] as String?,
      currency: json['currency'] as String?,
      reversal: json['reversal'] as dynamic,
      depositeNumber: json['depositeNumber'] as String?,
      salesId: json['salesId'] as String?,
      salesRepName: json['salesRepName'] as String?,
      group: json['group'] as String?,
      valueDate: json['valueDate'] as dynamic,
      creditArea: json['creditArea'] as String?,
      month: json['month'] as int?,
      year: json['year'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'customer': customer,
        'customerName': customerName,
        'customerRegion': customerRegion,
        'regionDesc': regionDesc,
        'amountInLC': amountInLc,
        'amount': amount,
        'houseBank': houseBank,
        'accountId': accountId,
        'bankGL': bankGl,
        'bankDesc': bankDesc,
        'documentNo': documentNo,
        'postingDate': postingDate,
        'documentDate': documentDate,
        'createdBy': createdBy,
        'ci': ci,
        'customerClassification': customerClassification,
        'pk': pk,
        'postingKey': postingKey,
        'exchRate': exchRate,
        'currency': currency,
        'reversal': reversal,
        'depositeNumber': depositeNumber,
        'salesId': salesId,
        'salesRepName': salesRepName,
        'group': group,
        'valueDate': valueDate,
        'creditArea': creditArea,
        'month': month,
        'year': year,
      };

  @override
  List<Object?> get props {
    return [
      customer,
      customerName,
      customerRegion,
      regionDesc,
      amountInLc,
      amount,
      houseBank,
      accountId,
      bankGl,
      bankDesc,
      documentNo,
      postingDate,
      documentDate,
      createdBy,
      ci,
      customerClassification,
      pk,
      postingKey,
      exchRate,
      currency,
      reversal,
      depositeNumber,
      salesId,
      salesRepName,
      group,
      valueDate,
      creditArea,
      month,
      year,
    ];
  }
}
