import 'package:flutter/material.dart';

import 'size_config.dart';

const kPrimaryColor = Color(0xFF3C54B4);
const kGreenColor = Color(0xFF0CDE53);
const kSecondaryColor = Color(0xFF2238FF);
const kWhiteColor = Color(0xFFFFFFFF);
const kBlackColor = Color(0xFF000000);

// Heading Constants

final kSmallHeading = TextStyle(
  color: kWhiteColor,
  fontSize: getProportionateScreenHeight(18),
);
final kMediumHeading = TextStyle(
  color: kWhiteColor,
  fontSize: getProportionateScreenHeight(22),
);
final kLargeHeading = TextStyle(
  color: kWhiteColor,
  fontSize: getProportionateScreenHeight(26),
);

final bgGradient = LinearGradient(
  colors: [Colors.blue, Colors.yellow.shade200, Colors.black87],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

final singleScreenGradient = LinearGradient(
  colors: [
    Colors.blue,
    Colors.yellow.shade200,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

final darkScreenGradient = LinearGradient(
  colors: [
    Color(0xFF1C5E7C),
    Colors.yellow.shade200,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
