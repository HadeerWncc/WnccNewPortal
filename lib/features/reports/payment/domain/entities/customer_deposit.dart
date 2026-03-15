class CustomerDeposit {
  String customer;
  String customerName;
  String salesRepName;
  // String currency;
  String todayDepositEgp;
  String monthDepositEgp;
  String todayDepositUsd;
  String monthDepositUsd;


  CustomerDeposit({
    required this.customer,
    required this.customerName,
    required this.salesRepName,
    // required this.currency,
    required this.todayDepositEgp,
    required this.monthDepositEgp,
    required this.monthDepositUsd,
    required this.todayDepositUsd,
  });
}