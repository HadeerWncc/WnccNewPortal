import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/booking_price/data/models/booking_price/booking_price.dart';
import 'package:wncc_portal/features/booking_price/data/models/price_display/price_display.dart';
import 'package:wncc_portal/features/booking_price/data/models/price_line_chart/price_line_chart.dart';

abstract class BookingPriceRepo {
  Future<Either<Failure, BookingPrice>> getAllMonthlyPrice(
    int productType,
    String date,
  );
  Future<Either<Failure, PriceLineChart>> getLineChart(int productType);
  Future<Either<Failure, PriceDisplay>> getPriceing(
    int productType,
    String date,
  );
  Future<Either<Failure, String>> distributePrices(PriceDisplay price);
}
