import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/booking_steps.dart';
import '../shared/colors.dart';
import '../widgets/select_date_widget.dart';
import '../widgets/select_destination_widget.dart';

class DateSelectionScreen extends StatefulWidget {
  const DateSelectionScreen({super.key});

  @override
  State<DateSelectionScreen> createState() => _DateSelectionScreenState();
}

class _DateSelectionScreenState extends State<DateSelectionScreen> {
  BookingSteps step = BookingSteps.selectDestination;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 8.0,
        sigmaY: 8.0,
      ),
      child: Scaffold(
        backgroundColor: appWhite.withOpacity(0.5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.close),
          ),
          title: Text(
            'RoshHour',
            style: textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: const [
            Icon(Icons.more_vert),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      step = BookingSteps.selectDestination;
                    });
                  },
                  child: Hero(
                    tag: '',
                    child: SelectDestinationWidget(step: step),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      step = BookingSteps.selectDate;
                    });
                  },
                  child: SelectDateWidget(step: step),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: (step == BookingSteps.selectDate)
            ? null
            : TextButton(
                onPressed: () {
                  setState(() {
                    step = (step == BookingSteps.selectDestination)
                        ? BookingSteps.selectDate
                        : BookingSteps.selectDestination;
                  });
                },
                child: Text(
                  '',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
      ),
    );
  }
}
