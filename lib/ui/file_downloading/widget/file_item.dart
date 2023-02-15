import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isolate/data/models/file_model/file_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_filex/open_filex.dart';

// ignore: must_be_immutable
class FileItemWidget extends StatefulWidget {
  FileModel file;

  FileItemWidget({required this.file, Key? key}) : super(key: key);

  @override
  State<FileItemWidget> createState() => _FileItemWidgetState();
}

class _FileItemWidgetState extends State<FileItemWidget> {
  var downloadedImagePath = '/storage/emulated/0/Download/';
  CancelToken cancelToken = CancelToken();
  double done = 0;
  bool isDownloaded = false;

  checkStatus() async {
    isDownloaded =
    await File("$downloadedImagePath${widget.file.fileName}").exists();
    setState(() {});
  }

  @override
  void initState() {
    checkStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future downloadFile() async {
      Dio dio = Dio();
      try {
        bool isExist =
        await File("$downloadedImagePath${widget.file.fileName}").exists();
        if (!isExist) {
          await dio.download(widget.file.fileUrl,
              "$downloadedImagePath${widget.file.fileName}",
              onReceiveProgress: (rec, total) async {
                await Future.delayed(const Duration(milliseconds: 100));
                setState(() {
                  done = rec / total;
                  checkStatus();
                });
              }, cancelToken: cancelToken);
        } else {}
      } catch (e) {}
      return "$downloadedImagePath${widget.file.fileName}";
    }
    return ListTile(
      title: Text(widget.file.fileName),
      subtitle: LinearProgressIndicator(
        value: isDownloaded ? 100 : done,
        backgroundColor: Colors.grey,
        color: Colors.black,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.open_in_full,color: Colors.black,),
        onPressed: () async {
          bool isExist = await File(
            "$downloadedImagePath${widget.file.fileName}",
          ).exists();
          if (isExist) {
            OpenFilex.open(
              "$downloadedImagePath${widget.file.fileName}",
            );
          } else {
            Fluttertoast.showToast(
              msg: "Firstly, you must download",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
      ),
      leading: IconButton(
        onPressed: () {
          downloadFile();
        },
        icon:
        isDownloaded ? const Icon(Icons.done,color: Colors.black,) : const Icon(Icons.download,color: Colors.black,),
      ),
    );
  }
}
