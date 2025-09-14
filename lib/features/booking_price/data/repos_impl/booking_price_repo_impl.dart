import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/booking_price/data/data_sources/booking_price_datasourse.dart';
import 'package:wncc_portal/features/booking_price/data/models/booking_price/booking_price.dart';
import 'package:wncc_portal/features/booking_price/data/models/price_display/price_display.dart';
import 'package:wncc_portal/features/booking_price/data/models/price_line_chart/price_line_chart.dart';
import 'package:wncc_portal/features/booking_price/domain/repos/booking_price_repo.dart';

class BookingPriceRepoImpl extends BookingPriceRepo{
  final BookingPriceDatasourse bookingPriceDatasourse;

  BookingPriceRepoImpl({required this.bookingPriceDatasourse});
  
  @override
  Future<Either<Failure, String>> distributePrices(PriceDisplay price) async {
    try {
      String msg = await bookingPriceDatasourse.distributePrice(price);
      return Right(msg);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookingPrice>> getAllMonthlyPrice(int productType, String date) async {
    try {
      BookingPrice bookingPrice = await bookingPriceDatasourse.getAllMonthlyPrice(productType, date);
      return Right(bookingPrice);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PriceLineChart>> getLineChart(int productType) async {
    try {
      PriceLineChart bookingPriceChart = await bookingPriceDatasourse.getLineChart(productType);
      return Right(bookingPriceChart);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PriceDisplay>> getPriceing(int productType, String date) async {
      try {
      PriceDisplay pricing = await bookingPriceDatasourse.getPricing(productType, date);
      return Right(pricing);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

}