class CalculadoraIMCModel {
  CalculadoraIMCModel._();

  static double calculateIMC(double weight, double height) {
    return weight / (height * height);
  }
}
