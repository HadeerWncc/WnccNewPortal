import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/booking_price/data/models/booking_price/booking_price.dart';
import 'package:wncc_portal/features/booking_price/data/models/price_display/price_display.dart';
import 'package:wncc_portal/features/booking_price/data/models/price_line_chart/price_line_chart.dart';

abstract class BookingPriceDatasourse {
  Future<BookingPrice> getAllMonthlyPrice(int productType, String date);
  Future<PriceLineChart> getLineChart(int productType);
  Future<PriceDisplay> getPricing(int productType, String date);
  Future<String> distributePrice(PriceDisplay price);
}

class BookingPriceDatasourseImpl extends BookingPriceDatasourse {
  final ApiService apiService;

  BookingPriceDatasourseImpl({required this.apiService});
  @override
  Future<String> distributePrice(PriceDisplay price) async {
    var result = await apiService.post(
      endPoint: 'api/Pricing/DistributePrices',
      data: price.toJson(),
    );
    bool success = result["successed"] as bool;
    String msg = success
        ? "Price updated successfully!"
        : "There was an error, please try again!";
    return msg;
  }

  @override
  Future<BookingPrice> getAllMonthlyPrice(int productType, String date) async {
    var result = await apiService.get(
        endPoint:
            'api/Pricing/GetMonthlyPrices?productType=$productType&date=$date');
    BookingPrice bookingPrice = BookingPrice.fromJson(result["data"]);
    return bookingPrice;
  }

  @override
  Future<PriceLineChart> getLineChart(int productType) async {
    var result = await apiService.get(
        endPoint: 'api/Pricing/GetLineChart?productType=$productType');
    PriceLineChart priceLineChart = PriceLineChart.fromJson(result["data"]);
    return priceLineChart;
  }

  @override
  Future<PriceDisplay> getPricing(int productType, String date) async {
    var result = await apiService.get(
        endPoint: 'api/Pricing/GetPricing?date=$date&productType=$productType');
    PriceDisplay priceDisplay = PriceDisplay.fromJson(result["data"]);
    return priceDisplay;
  }
}
