class Percentage {
  final String cid;
  int percentage;

  Percentage({
    required this.cid,
    required this.percentage,
  });

  void setPercentage(int num){
    percentage = num;
  }

  Map<String, dynamic> toJson(){
    return {
      'cid': cid,
      'percentage': percentage
    };
  }
}
