import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

class User {
  final String name;
  final int age;

  const User({required this.name, required this.age});

}

class PdfApi {
  static Future<File> generateTable() async {
    final pdf = pw.Document();

    // final headers = ['Name','Age'];
    //
    // final users = [
    //   const User(name: 'James', age: 19),
    //   const User(name: 'Sarah', age: 21),
    //   const User(name: 'Emma', age: 28),
    // ];

    //final data = users.map((user) => [user.name, user.age]).toList();

    pdf.addPage(pw.Page( pageFormat : PdfPageFormat.a4 ,build: (pw.Context context) {
      return pw.Container(
          child: pw.Table(
              children: [
                pw.TableRow(children: [pw.Text("text1"),
                  pw.Text("text1"),
                  pw.Text("text1"),
                  pw.Text("text1"),
                  pw.Text("text1"),]),

              ]
          )
      );
    }
      // Table.fromTextArray(
      //   headers: headers,
      //   data: data,
      // )
    )

    );

    return saveDocument(name : 'my_example.pdf',pdf : pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required pw.Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    String filePath = '${dir.path}/$name';
    final file = File(filePath);

    await file.writeAsBytes(bytes);
    return file;
  }

  static Future openFile(File file) async{
    final url = file.path;

    await OpenFile.open(url);
  }
}
