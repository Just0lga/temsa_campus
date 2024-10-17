import 'package:flutter/material.dart';
import 'package:temsa_campus/models/TechOnay/GetApprovalForms.dart';
import 'package:temsa_campus/services/TechOnay/GetApprovalForms.dart';

class Mails_Info extends StatefulWidget {
  const Mails_Info({super.key});

  @override
  State<Mails_Info> createState() => _Mails_InfoState();
}

class _Mails_InfoState extends State<Mails_Info> {
  List<TechOnay_GetApprovalForms>? _items;
  bool _isLoading = false;
  final Fetch_TechOnay_GetApprovalForms _fetchService =
      Fetch_TechOnay_GetApprovalForms();

  @override
  void initState() {
    fetchPost_TechOnay_GetApprovalForms();
    super.initState();
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void fetchPost_TechOnay_GetApprovalForms() async {
    changeLoading();
    final items = await _fetchService.fetchPost_TechOnay_GetApprovalForms();
    setState(() {
      _items = items;
    });
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _items == null
                ? Text("No data available")
                : ListView.builder(
                    itemCount: _items!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: _items![index].data == null ||
                                _items![index].data!.isEmpty
                            ? Text("No data")
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: _items![index].data!.map((data) {
                                  return Text(data.processId ?? " ");
                                }).toList(),
                              ),
                      );
                    },
                  ),
      ),
    );
  }
}
