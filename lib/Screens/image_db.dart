// import 'dart:typed_data';
// import 'package:http/http.dart' as http;
// import 'package:pathstrides_mobile/Services/globals.dart';

// class DBHelper {
//   static Database _db;

//   Future<Database> get db async {
//     if (_db != null) return _db;
//     _db = await initDb();
//     return _db;
//   }

//   initDb() async {
//     io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, "test.db");
//     var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
//     return theDb;
//   }

//   void _onCreate(Database db, int version) async {
//     // When creating the db, create the table
//     await db
//         .execute("CREATE TABLE Imagedata(id INTEGER PRIMARY KEY, image TEXT)");
//     print("Created tables");
//   }

//   void saveImage(Imagedata imagedata) async {
//     var dbClient = await db;
//     await dbClient.transaction((txn) async {
//       return await txn.rawInsert('INSERT INTO Imagedata(id, image) VALUES(' +
//           '\'' +
//           imagedata.id +
//           '\'' +
//           ',' +
//           '\'' +
//           imagedata.image +
//           '\'' +
//           ')');
//     });
//   }

//   Future<APIResponse<Uint8List>> getMyImage(String id) async {
//     return http
//         .get(Uri.parse('${baseURL}file/download/$id'), headers: headers)
//         .then((data) {
//       if (data.statusCode == 200) {
//         dynamic blob = data.bodyBytes;
//         Uint8List image = blob.buffer.asUint8List();
//         print("FILE $image");
//         return APIResponse<Uint8List>(
//           data: image,
//         );
//       }
//     });
//   }
// }
