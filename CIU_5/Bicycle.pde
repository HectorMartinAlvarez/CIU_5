class Bicycle{
  
  String start;
  String end;
  String rental;
  String _return;
  int type = -1;
  int id;
  
  Bicycle(String start, String end, String rental, String _return,int id){
    this.start = start;
    this.end = end;
    this.rental = rental;
    this._return = _return;
    this.id = id;
  }
  
  void setType(int t){
   this.type = t; 
  }
  
}
