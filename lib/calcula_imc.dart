class IMC {
  double weight;
  double height;

  IMC({required this.weight, required this.height});

  double calculate() {
    return weight / (height * height);
  }
}
