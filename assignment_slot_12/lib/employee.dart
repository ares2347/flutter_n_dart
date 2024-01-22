class Employee {
  String? name;
  String? address;
  String? phone;
  String? email;
  String? gender;
  Employee({this.name, this.gender, this.address, this.phone, this.email});

  @override
  String toString(){
    return "name: $name, gender: $gender, address: $address, phone: $phone, email: $email";
  }

  factory Employee.valueFromJson(Map<String, dynamic> json) {
    return Employee(
        name: json["name"] as String,
        address: json["address"] as String,
        phone: json["phone"] as String,
        email: json["email"] as String,
        gender: json["gender"] as String
    );
  }
}
