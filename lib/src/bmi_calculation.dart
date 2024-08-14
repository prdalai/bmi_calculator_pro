class BMICalculator {
  // Calculate BMI using metric units (kg/m²)
  static double calculateMetricBMI({required double weightKg, required double heightCm}) {
    double heightM = heightCm / 100;
    return weightKg / (heightM * heightM);
  }

  // Calculate BMI using imperial units (lbs/in²)
  static double calculateImperialBMI({required double weightLbs, required double heightInch}) {
    return (weightLbs / (heightInch * heightInch)) * 703;
  }
}

