class NumbersModel {
  final String label;
  final int value;
  bool isChecked;

  NumbersModel(this.label, this.value, this.isChecked);

  static List<NumbersModel> getListNumbers() {
    return [
      NumbersModel("Any", 0, false),
      NumbersModel("1", 0, false),
      NumbersModel("2", 0, false),
      NumbersModel("3", 0, false),
      NumbersModel("4", 0, false),
      NumbersModel("5", 0, false),
      NumbersModel("6", 0, false),
      NumbersModel("7", 0, false),
      NumbersModel("8+", 0, false),
      
    ];
  }
}
