class Bicycle{
  
  int startDay;
  int startMonth;
  int startYear;
  String startTime;
  int endDay;
  int endMonth;
  int endYear;
  String endTime;
  String rental;
  String _return;
  int type = -1;
  
  Bicycle(String start, String end, String rental, String _return){
    String[] a = start.split("/");
    String[] w = a[2].split(" ");
    String[] e = end.split("/");
    String[] s = e[2].split(" ");
    startDay = Integer.parseInt(a[0]);
    startMonth = Integer.parseInt(a[1]);
    startYear = Integer.parseInt(w[0]);
    startTime = w[1];
    endDay = Integer.parseInt(e[0]);
    endMonth = Integer.parseInt(e[1]);
    endYear = Integer.parseInt(s[0]);
    endTime = s[1];
    this.rental = rental;
    this._return = _return;
  }
  
  void setType(int t){
   this.type = t; 
  }
  
}
