import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/screens/service_provider/plumber_summary_screen.dart';
import 'package:homeapp/widgets/custom_button.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/custom_card.dart';

class PlumberBookingTimeScreen extends StatefulWidget {
  final String address;
  final String houseNo;
  final String streetNo;
  final String image;
  final String title;
  final String subTitle;

  const PlumberBookingTimeScreen(
      {super.key,
      required this.address,
      required this.houseNo,
      required this.streetNo,
      required this.image,
      required this.title,
      required this.subTitle});

  @override
  State<PlumberBookingTimeScreen> createState() =>
      _PlumberBookingTimeScreenState();
}

class _PlumberBookingTimeScreenState extends State<PlumberBookingTimeScreen> {
  int? timeIndex;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  final List<Map<String, dynamic>> amData = [
    {'text': '09:00'},
    {'text': '10:00'},
    {'text': '11:00'},
    {'text': '12:00'},
  ];

  final List<Map<String, dynamic>> pmData = [
    {'text': '1:00'},
    {'text': '2:00'},
    {'text': '3:00'},
    {'text': '4:00'},
    {'text': '5:00'},
    {'text': '6:00'},
    {'text': '7:00'},
    {'text': '8:00'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plumber Booking"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 14),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Date",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: 10.h,
            ),
            calender(),
            SizedBox(
              height: 15.h,
            ),
            hours(),
            SizedBox(
              height: 50.h,
            ),
            CustomButton(
              btnText: "Next",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlumberSummaryScreen(
                              address: widget.address,
                              houseNo: widget.houseNo,
                              streetNo: widget.streetNo,
                              image: widget.image,
                              title: widget.title,
                              subTitle: widget.subTitle,
                              selectedDate: _selectedDay,
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget calender() {
    return TableCalendar(
      rowHeight: 40,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      calendarFormat: CalendarFormat.month,
      // Can be week, twoWeeks, or month
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: AppColors.lightBlueColor,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: AppColors.darkGreyColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget hours() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Select Hours",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Text("AM"),
        SizedBox(
          height: 10.h,
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(amData.length, (index) {
            final data = amData[index];
            return CustomCard(
                cardText: data['text'],
                isSelected: timeIndex == index,
                onTap: () {
                  setState(() {
                    timeIndex = index;
                  });
                });
          }),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text("PM"),
        SizedBox(
          height: 10.h,
        ),
        Wrap(
          children: List.generate(pmData.length, (index) {
            final data = pmData[index];
            return CustomCard(
                cardText: data['text'],
                isSelected: timeIndex == index,
                onTap: () {
                  setState(() {
                    timeIndex = index;
                  });
                });
          }),
        ),
      ],
    );
  }
}
