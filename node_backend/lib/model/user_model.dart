//classs name should start in CAPS
class Details {
  final String? id;
  final String? name; //if no data  it return NULL
  final String? age;
  final String? city;

  Details({required this.name, this.age, this.city, this.id});

  //from Json
  factory Details.fromJson(Map<String, dynamic> json){
  return Details(
    id: json['_id'],
    name : json['name'],
    age : json['age'],
    city: json['city'],
  );
}
//toJSon
Map<String, dynamic> toJson(){
  return{
    "name": name,
    "age": age,
    "city": city,
  };

}
}


//use from JSON and to JSon

//from json

