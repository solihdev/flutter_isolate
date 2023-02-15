import 'package:flutter/material.dart';
import 'package:flutter_isolate/data/models/file_model/file_model.dart';
import 'package:flutter_isolate/ui/file_downloading/widget/file_item.dart';

class FileDownloadingPage extends StatelessWidget {
  const FileDownloadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FileDownloading Page"),),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: files.length,
            itemBuilder: (context, index) => FileItemWidget(file: files[index]),)
        ],
      ),
    );
  }
}
