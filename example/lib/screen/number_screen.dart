import 'package:flutter/material.dart';
import 'package:mockup/mockup.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final random3DigitNumber = Mockup.number.randomDigit(100, 999);
  final random5DigitBinary = Mockup.number.randomBinaryString(5);
  final random5DigitDecimal = Mockup.number.randomDecimalString(5);
  final random5DigitHexadecimal = Mockup.number.randomHexString(5);
  final random5DigitOctal = Mockup.number.randomOctalString(5);
  final randomIPv4 = Mockup.number.randomIPv4();
  final randomIPv6 = Mockup.number.randomIPv6();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mockup Example")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Random Number Data",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 20),
            Text(
              "Random 3 Digit Number is:",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Text("$random3DigitNumber"),
            SizedBox(height: 20),
            Text(
              "Random 5-Digit Binary are:",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Text(random5DigitBinary),
            SizedBox(height: 20),
            Text(
              "Random 5-Digit Decimal are:",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Text(random5DigitDecimal),
            SizedBox(height: 20),
            Text(
              "Random 5-Digit Hexadecimal are:",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Text(random5DigitHexadecimal),
            SizedBox(height: 20),
            Text(
              "Random 5-Digit Octal are:",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Text(random5DigitOctal),
            SizedBox(height: 20),
            Text(
              "Random IPv4:",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Text(randomIPv4),
            SizedBox(height: 20),
            Text(
              "Random IPv6:",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Text(randomIPv6),
          ],
        ),
      ),
    );
  }
}
