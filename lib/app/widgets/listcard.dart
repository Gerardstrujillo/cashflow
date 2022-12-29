// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cashflow/app/screens/boxs.dart';
import 'package:cashflow/core/colors.dart';
import 'package:cashflow/database/providers/user.dart';
import 'package:cashflow/database/models/user.dart' as model;
import 'package:cashflow/utils/message.dart';
import 'package:provider/provider.dart';

class ListCard extends StatefulWidget {
  final snap;
  const ListCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  void initState() {
    super.initState();
    fetchCommentLen();
  }

  fetchCommentLen() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('lists')
          .doc(widget.snap['lId'])
          .collection('boxs')
          .get();
    } catch (err) {
      warningMessage(
        context,
        err.toString(),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return widget.snap['uid'].toString() == user.uid
        ? SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: border, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: card,
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Boxs(
                              lId: widget.snap['lId'].toString(),
                              ldescription: widget.snap['description'].toString(),
                              lage:  widget.snap['age'].toString(),
                              lbalance: widget.snap['balance'].toString(),
                            ),
                          ),
                        ), // USER METHODS
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        widget.snap['description'].toString(),
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        widget.snap['age'].toString(),
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.chevron_right_sharp,
                              )
                            ],
                          ),
                        ),
                      )
                      // : const Center()
                      ),
                ],
              ),
            ),
          )
        : const Center();
  }
}
