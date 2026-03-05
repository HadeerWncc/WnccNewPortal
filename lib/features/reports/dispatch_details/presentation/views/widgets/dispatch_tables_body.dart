import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/month_day.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_region.dart';

class DispatchTablesBody extends StatelessWidget {
  const DispatchTablesBody({
    super.key,
    required this.dispatchDetailsResponse,
    required this.year,
  });

  final List<DispatchDetailsModel> dispatchDetailsResponse;
  final int year;

  // 1. تعريف العرض الثابت كـ Constants داخل الـ Class
  static const double dateColumnWidth = 150.0;
  static const double dataColumnWidth = 100.0;

  double getTotalWidth(int regionsCount) {
    // 150 (Date) + 100 * (عدد الـ Regions) + 100 * (باقي الأعمدة الثابتة وهي 8 أعمدة)
    return 150 + (regionsCount * 100) + (8 * 100);
  }

  @override
  Widget build(BuildContext context) {
    final List<DispatchRegion> visibleRegions =
        dispatchDetailsResponse.isNotEmpty
            ? (dispatchDetailsResponse.first.monthDays?.first.regions ?? [])
                .where((r) => r.enableDispatchReporting == true)
                .cast<DispatchRegion>()
                .toList()
            : [];

    // حساب العرض الكلي للجزء المتحرك (بدون عمود التاريخ)
    final double scrollablePartWidth =
        (visibleRegions.length * dataColumnWidth) + (10 * dataColumnWidth);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Dispatch Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Row(
            // Row رئيسي لفصل العمود الثابت عن المتحرك
            children: [
              // --- الجزء الثابت (عمود التاريخ فقط) ---
              _buildFixedColumn(visibleRegions),

              // --- الجزء المتحرك (باقي البيانات) ---
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: scrollablePartWidth,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          _buildScrollableHeader(visibleRegions),
                          ...dispatchDetailsResponse.map(
                            (month) => _buildScrollableMonthGroup(
                                context, month, visibleRegions),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

// 1. بناء العمود الثابت (التاريخ فقط)
  Widget _buildFixedColumn(List<DispatchRegion> visibleRegions) {
    return SizedBox(
      width: dateColumnWidth,
      child: SingleChildScrollView(
        // سكرول رأسي فقط متزامن (اختياري)
        child: Column(
          children: [
            _buildCell("DATE",
                width: dateColumnWidth,
                isHeader: true,
                color: const Color(0xFFB9E2A7)),
            ...dispatchDetailsResponse.expand((month) => [
                  // صف الشهر (Total)
                  _buildCell("Total (${month.monthLabel})",
                      width: dateColumnWidth,
                      isHeader: true,
                      color: const Color(0xFFF1F8E9)),
                  // صفوف الأيام
                  ...(month.monthDays?.map((day) =>
                          _buildCell(day.date ?? "", width: dateColumnWidth)) ??
                      []),
                ]),
          ],
        ),
      ),
    );
  }

// 2. تصحيح ترتيب الأعمدة (Scrollable Part)
  Widget _buildScrollableHeader(List<DispatchRegion> regions) {
    return Container(
      color: const Color(0xFFB9E2A7),
      child: Row(
        children: [
          _buildCell("DELTA"),
          _buildCell("CAIRO"),
          _buildCell("G.CAIRO"),
          _buildCell("U.EGYPT"), // إضافة العمود الناقص
          ...regions.map((r) => _buildCell(r.regionName ?? "")),
          _buildCell("BAGS"),
          _buildCell("BULK"),
          _buildCell("TOTAL"),
          _buildCell("EXPORT"),
        ],
      ),
    );
  }

  Widget _buildScrollableMonthGroup(BuildContext context,
      DispatchDetailsModel month, List<DispatchRegion> visibleRegions) {
    // صف الـ Total بتاع الشهر
    final firstDay = month.monthDays?.first;
    return Column(
      children: [
        Container(
          color: const Color(0xFFF1F8E9),
          child: Row(
            children: [
              _buildCell("${firstDay?.totalDelta?.total ?? 0}", isHeader: true),
              _buildCell("${firstDay?.totalGCairo?.total ?? 0}",
                  isHeader: true),
              _buildCell("${firstDay?.totalGCairo?.total ?? 0}",
                  isHeader: true), // تأكدي من الـ Model هنا
              _buildCell("${firstDay?.totalUEgypt?.total ?? 0}",
                  isHeader: true), // إضافة U.Egypt
              ...visibleRegions.map(
                  (r) => _buildCell("-")), // أو احسبي التوتال كما شرحنا سابقاً
              _buildCell("${firstDay?.totalBags?.total ?? 0}", isHeader: true),
              _buildCell("${firstDay?.totalBulk?.total ?? 0}", isHeader: true),
              _buildCell("${firstDay?.total?.total ?? 0}", isHeader: true),
              _buildCell("${firstDay?.totalExport?.total ?? 0}",
                  isHeader: true),
            ],
          ),
        ),
        // صفوف الأيام
        ...(month.monthDays
                ?.map((day) => _buildScrollableDayRow(day, visibleRegions)) ??
            []),
      ],
    );
  }

  Widget _buildScrollableDayRow(
      MonthDay day, List<DispatchRegion> visibleRegions) {
    return Row(
      children: [
        _buildCell("${day.totalDelta?.total ?? 0}"),
        _buildCell("${day.totalGCairo?.total ?? 0}"),
        _buildCell(
            "${day.totalGCairo?.total ?? 0}"), // راجعي الـ Model (ممكن يكون totalCairo)
        _buildCell("${day.totalUEgypt?.total ?? 0}"),
        ...visibleRegions.map((vr) {
          final reg = day.regions
              ?.firstWhere((r) => r.regionId == vr.regionId, orElse: () => vr);
          return _buildCell("${reg?.quantity?.total ?? 0}");
        }),
        _buildCell("${day.totalBags?.total ?? 0}"),
        _buildCell("${day.totalBulk?.total ?? 0}"),
        _buildCell("${day.total?.total ?? 0}"),
        _buildCell("${day.totalExport?.total ?? 0}"),
      ],
    );
  }

  // ميثود بناء الهيدر مع استقبال الـ regions كـ Parameter
  Widget _buildTableHeader(List<DispatchRegion> regions) {
    return Container(
      color: const Color(0xFFB9E2A7),
      child: Row(
        children: [
          _buildCell("DATE", width: dateColumnWidth, isHeader: true),
          _buildCell("DELTA", isHeader: true),
          _buildCell("CAIRO", isHeader: true),
          _buildCell("G.CAIRO", isHeader: true),
          ...regions.map((r) => _buildCell(r.regionName ?? "", isHeader: true)),
          _buildCell("BAGS", isHeader: true),
          _buildCell("BULK", isHeader: true),
          _buildCell("TOTAL", isHeader: true),
          _buildCell("EXPORT", isHeader: true),
        ],
      ),
    );
  }

  Widget _buildMonthGroup(BuildContext context, DispatchDetailsModel month,
      List<DispatchRegion> visibleRegions) {
    return ListTileTheme(
      contentPadding: EdgeInsets.zero,
      dense: true,
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        title: Container(
          color: const Color(0xFFF1F8E9),
          child: Row(
            children: [
              _buildCell("Total Dispatch (${month.monthLabel})",
                  width: dateColumnWidth, isHeader: true),
              _buildCell("${month.monthDays?.first.totalDelta?.total ?? 0}"),
              _buildCell("${month.monthDays?.first.totalGCairo?.total ?? 0}"),
              _buildCell("..."),
              // جوه ميثود _buildMonthGroup
              ...visibleRegions.map((vRegion) {
                // بنجمع التوتال بتاع الـ Region ده من كل الأيام اللي في الشهر
                num regionTotal = month.monthDays?.fold(0, (sum, day) {
                      final reg = day.regions?.firstWhere(
                          (r) => r.regionId == vRegion.regionId,
                          orElse: () => vRegion);
                      return sum! + (reg?.quantity?.total ?? 0);
                    }) ??
                    0;
                return _buildCell(regionTotal
                    .toStringAsFixed(0)); // عرض الرقم الحقيقي بدل "-"
              }),
              _buildCell("${month.monthDays?.first.totalBags?.total ?? 0}"),
              _buildCell("${month.monthDays?.first.totalBulk?.total ?? 0}"),
              _buildCell("${month.monthDays?.first.total?.total ?? 0}"),
              _buildCell("${month.monthDays?.first.totalExport?.total ?? 0}"),
            ],
          ),
        ),
        children: month.monthDays
                ?.map((day) => _buildDayRow(day, visibleRegions))
                .toList() ??
            [],
      ),
    );
  }

  Widget _buildDayRow(MonthDay day, List<DispatchRegion> visibleRegions) {
    return Container(
      decoration: BoxDecoration(
        color:
            day.isToday == true ? Colors.blue.withOpacity(0.05) : Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          _buildCell(day.date ?? "", width: dateColumnWidth),
          _buildCell("${day.totalDelta?.total ?? 0}"),
          _buildCell("${day.totalGCairo?.total ?? 0}"),
          _buildCell("..."),
          ...visibleRegions.map((vr) {
            // بنجيب الـ region اللي ليه نفس الـ ID في اليوم ده
            final reg = day.regions?.firstWhere(
                (r) => r.regionId == vr.regionId,
                orElse: () => vr);
            // تأكدي إن القيمة مش null
            return _buildCell(reg?.quantity?.total?.toStringAsFixed(0) ?? "0");
          }),
          _buildCell("${day.totalBags?.total ?? 0}"),
          _buildCell("${day.totalBulk?.total ?? 0}"),
          _buildCell("${day.total?.total ?? 0}"),
          _buildCell("${day.totalExport?.total ?? 0}"),
        ],
      ),
    );
  }

  Widget _buildCell(
    String text, {
    double width = dataColumnWidth,
    bool isHeader = false,
    Color? color,
  }) {
    return Container(
      width: width,
      height: 45, // يمكنكِ تعديل الارتفاع حسب الحاجة
      padding: const EdgeInsets.symmetric(horizontal: 4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        // حدود رمادية رفيعة جداً لتشبه الجداول الاحترافية
        border: Border.all(color: Colors.grey.shade300, width: 0.5),
      ),
      child: FittedBox(
        fit: BoxFit
            .scaleDown, // هذا السطر يمنع ظهور النقاط ويقوم بتصغير الخط إذا كان النص طويلاً
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isHeader ? FontWeight.bold : FontWeight.w500,
            color: isHeader ? Colors.black87 : Colors.black54,
          ),
        ),
      ),
    );
  }
}
