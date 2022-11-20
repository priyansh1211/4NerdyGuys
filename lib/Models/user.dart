class User {
  int? id;
  String? Site;
  String? Block_number;
 // int? value;

  User({this.id, this.Site, this.Block_number});

  static List<User> getData() {
    return [
      User(
          id: 1,
          Site: "",
          Block_number: "A",
   //       value: 500
      ),
      User(
          id: 2,
          Site: "9AAB",
        Block_number: "B",
     //     value: 500
      ),
      User(
          id: 3,
          Site: "7AAB",
        Block_number: "C",
       //   value: 500
      ),
      User(
          id: 4,
          Site: "AAB",
        Block_number: "D",
         // value: 500
      ),
      User(
          id: 5,
          Site: "ACE",
        Block_number: "E",
         // value: 500
      ),
    ];
  }
}