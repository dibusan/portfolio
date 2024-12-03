import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

class ResumePdf extends StatefulWidget {
  const ResumePdf({super.key});

  @override
  State<ResumePdf> createState() => _ResumePdfState();
}

class _ResumePdfState extends State<ResumePdf> {
  final pdf = pw.Document();

  @override
  void initState() {
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(child: pw.Text("Page 1"));
        },
      ),
    );
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(child: pw.Text("Page 2"));
        },
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 1), () async => await pdf.save()),
      builder: (_, doc) {
        bool loading = !doc.hasData || doc.data == null;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Curriculum Eriel Marimon Frias'),
          ),
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              loading
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.only(top: 64),
                      child: PdfViewer.data(
                        doc.data!,
                        sourceName: "Resume",
                        params: const PdfViewerParams(backgroundColor: Colors.transparent),
                      ),
                    )
            ],
          ),
          floatingActionButton: loading
              ? null
              : FloatingActionButton.extended(
                  onPressed: () => FileSaver.instance.saveFile(name: "Resume CV.pdf", bytes: doc.data),
                  label: const Row(children: [Icon(Icons.download), SizedBox(width: 8), Text("Download")])),
        );
      },
    );
  }
}
