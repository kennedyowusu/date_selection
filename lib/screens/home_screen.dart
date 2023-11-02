import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../shared/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: appBlack.withOpacity(0.1),
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0.0, 1.0),
                )
              ],
            ),
            child: GestureDetector(
              onTap: () => context.pushNamed('booking-details'),
              child: Hero(
                tag: '',
                child: Container(
                  height: 50.0,
                  width: 200.0,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: appWhite,
                    border: Border.all(color: appGrey, width: 1.0),
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: appGrey.withOpacity(0.5),
                        blurRadius: 8.0,
                        spreadRadius: 8.0,
                        offset: const Offset(0, 4.0),
                      )
                    ],
                  ),
                  child: Text(
                    'Select Dates',
                    style: textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
