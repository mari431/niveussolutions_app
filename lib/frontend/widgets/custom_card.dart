import 'package:flutter/material.dart';

class Globe_CustomCardColumn3 extends StatelessWidget {
  const Globe_CustomCardColumn3({
    super.key,
    required this.titleValue1,
    required this.titleValue2,
    required this.titleValue3,
     required this.bgColor,
    // required this.image,
  });

  final String titleValue1;
  final String titleValue2;
  final String titleValue3;
  final Color? bgColor;

  // final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      child: IntrinsicHeight(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Expanded(
            //   flex: 1,
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(12),
            //       topRight: Radius.circular(12),
            //     ),
            //     child: Image.network(
            //       image,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            Expanded(
              flex: 1,
              child: Container(
                // padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: bgColor, ///Colors.white,
                    border: Border.all(color: Colors.black12)),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // head1.isEmpty ? Text('') :
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(head1,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),
                    //     Text(head2,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),
                    //     Text(head3,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Container(
                            constraints: const BoxConstraints(
                                minWidth: 120,
                                maxWidth: 120,
                                minHeight: 30,
                                maxHeight: 100),
                            padding: const EdgeInsets.all(10),
                            child: Text(titleValue1,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.start),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                              minWidth: 100,
                              maxWidth: 100,
                              minHeight: 30,
                              maxHeight: 100),
                          padding: const EdgeInsets.all(10),
                          child: Text(titleValue2,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                              minWidth: 100,
                              maxWidth: 100,
                              minHeight: 30,
                              maxHeight: 100),
                          padding: const EdgeInsets.all(10),
                          child: Text(titleValue3,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Globe_CustomCardColumn4 extends StatelessWidget {
  const Globe_CustomCardColumn4({
    super.key,
    required this.titleValue1,
    required this.titleValue2,
    required this.titleValue3,
    required this.titleValue4,
    // required this.image,
  });

  final String titleValue1;
  final String titleValue2;
  final String titleValue3;
  final String titleValue4;

  // final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      child: IntrinsicHeight(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Expanded(
            //   flex: 1,
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(12),
            //       topRight: Radius.circular(12),
            //     ),
            //     child: Image.network(
            //       image,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            Expanded(
              flex: 1,
              child: Container(
                // padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: Colors.white,
                    border: Border.all(color: Colors.black12)),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // head1.isEmpty ? Text('') :
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(head1,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),
                    //     Text(head2,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),
                    //     Text(head3,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Container(
                            constraints: const BoxConstraints(
                                minWidth: 120,
                                maxWidth: 120,
                                minHeight: 30,
                                maxHeight: 100),
                            padding: const EdgeInsets.all(10),
                            child: Text(titleValue1,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.start),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                              minWidth: 100,
                              maxWidth: 100,
                              minHeight: 30,
                              maxHeight: 100),
                          padding: const EdgeInsets.all(10),
                          child: Text(titleValue2,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                              minWidth: 100,
                              maxWidth: 100,
                              minHeight: 30,
                              maxHeight: 100),
                          padding: const EdgeInsets.all(10),
                          child: Text(titleValue3,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                              minWidth: 150,
                              maxWidth: 150,
                              minHeight: 30,
                              maxHeight: 100),
                          padding: const EdgeInsets.all(10),
                          child: Text(titleValue4,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.right),
                        ),

                        // Text(subtitle1,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.normal),textAlign: TextAlign.center),
                        // Text(subtitle2,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.normal),textAlign: TextAlign.center),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Globe_CustomCardColumn5 extends StatelessWidget {
  const Globe_CustomCardColumn5({
    super.key,
    required this.titleValue1,
    required this.titleValue2,
    required this.titleValue3,
    required this.titleValue4,
    required this.titleValue5,
    // required this.image,
  });

  final String titleValue1;
  final String titleValue2;
  final String titleValue3;
  final String titleValue4;
  final String titleValue5;

  // final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      child: IntrinsicHeight(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Expanded(
            //   flex: 1,
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(12),
            //       topRight: Radius.circular(12),
            //     ),
            //     child: Image.network(
            //       image,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            Expanded(
              flex: 1,
              child: Container(
                // padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: Colors.white,
                    border: Border.all(color: Colors.black12)),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // head1.isEmpty ? Text('') :
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(head1,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),
                    //     Text(head2,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),
                    //     Text(head3,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Container(
                            constraints: const BoxConstraints(
                                minWidth: 120,
                                maxWidth: 120,
                                minHeight: 30,
                                maxHeight: 100),
                            padding: const EdgeInsets.all(10),
                            child: Text(titleValue1,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 9,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.start),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                              minWidth: 100,
                              maxWidth: 100,
                              minHeight: 30,
                              maxHeight: 100),
                          padding: const EdgeInsets.all(10),
                          child: Text(titleValue2,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 9,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                              minWidth: 150,
                              maxWidth: 150,
                              minHeight: 30,
                              maxHeight: 100),
                          padding: const EdgeInsets.all(10),
                          child: Text(titleValue3,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 9,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                              minWidth: 100,
                              maxWidth: 100,
                              minHeight: 30,
                              maxHeight: 100),
                          padding: const EdgeInsets.all(10),
                          child: Text(titleValue4,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 9,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                              minWidth: 150,
                              maxWidth: 150,
                              minHeight: 30,
                              maxHeight: 100),
                          padding: const EdgeInsets.all(10),
                          child: Text(titleValue5,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 9,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.right),
                        ),

                        // Text(subtitle1,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.normal),textAlign: TextAlign.center),
                        // Text(subtitle2,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.normal),textAlign: TextAlign.center),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Globe_CustomCardColumn6 extends StatelessWidget {
  const Globe_CustomCardColumn6({
    super.key,
    required this.titleValue1,
    required this.titleValue2,
    required this.titleValue3,
    required this.titleValue4,
    required this.titleValue5,
    required this.titleValue6,
    // required this.image,
  });

  final String titleValue1;
  final String titleValue2;
  final String titleValue3;
  final String titleValue4;
  final String titleValue5;
  final String titleValue6;

  // final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      child: IntrinsicHeight(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Expanded(
            //   flex: 1,
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(12),
            //       topRight: Radius.circular(12),
            //     ),
            //     child: Image.network(
            //       image,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            Expanded(
              flex: 1,
              child: Container(
                // padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: Colors.white,
                    border: Border.all(color: Colors.black12)),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // head1.isEmpty ? Text('') :
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(head1,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),
                    //     Text(head2,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),
                    //     Text(head3,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Container(
                            constraints: const BoxConstraints(
                                minWidth: 120,
                                maxWidth: 120,
                                minHeight: 30,
                                maxHeight: 100),
                            padding: const EdgeInsets.all(10),
                            child: Text(titleValue1,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 9,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.start),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                              minWidth: 100,
                              maxWidth: 100,
                              minHeight: 30,
                              maxHeight: 100),
                          padding: const EdgeInsets.all(10),
                          child: Text(titleValue2,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 9,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                              minWidth: 150,
                              maxWidth: 150,
                              minHeight: 30,
                              maxHeight: 100),
                          padding: const EdgeInsets.all(10),
                          child: Text(titleValue3,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 9,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                              minWidth: 100,
                              maxWidth: 100,
                              minHeight: 30,
                              maxHeight: 100),
                          padding: const EdgeInsets.all(10),
                          child: Text(titleValue4,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 9,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                              minWidth: 100,
                              maxWidth: 100,
                              minHeight: 30,
                              maxHeight: 100),
                          padding: const EdgeInsets.all(10),
                          child: Text(titleValue5,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 9,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                              minWidth: 150,
                              maxWidth: 150,
                              minHeight: 30,
                              maxHeight: 100),
                          padding: const EdgeInsets.all(10),
                          child: Text(titleValue6,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 9,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.right),
                        ),

                        // Text(subtitle1,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.normal),textAlign: TextAlign.center),
                        // Text(subtitle2,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.normal),textAlign: TextAlign.center),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}