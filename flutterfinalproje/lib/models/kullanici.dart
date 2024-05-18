
class Kullanici {
  Kullanici({
    required this.id,
    required this.uuid,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.password,
    required this.email,
    required this.ip,
    required this.macAddress,
    required this.website,
    required this.image,
  });
  late final int id;
  late final String uuid;
  late final String firstname;
  late final String lastname;
  late final String username;
  late final String password;
  late final String email;
  late final String ip;
  late final String macAddress;
  late final String website;
  late final String image;
  
  Kullanici.fromJson(Map<String, dynamic> json){
    id = json['id'];
    uuid = json['uuid'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    ip = json['ip'];
    macAddress = json['macAddress'];
    website = json['website'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['username'] = username;
    data['password'] = password;
    data['email'] = email;
    data['ip'] = ip;
    data['macAddress'] = macAddress;
    data['website'] = website;
    data['image'] = image;
    return data;
  }
}