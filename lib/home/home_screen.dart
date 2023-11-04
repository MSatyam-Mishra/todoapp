import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Response;

import '../../../api_value.dart';
import '../../../shared_preference.dart';
import '../../user/Options/Controller/wallet_Controller.dart';

class Wallet extends StatefulWidget {
  String walletBalance;
  List creditHistory;
  List debitHistory;
  Wallet(
      {super.key,
      required this.walletBalance,
      required this.creditHistory,
      required this.debitHistory});

  @override
  State<Wallet> createState() => _WalletState();
}

void paint(Canvas canvas, Size size) {
  Paint paint = Paint()
    ..color = const Color(0xffC3A66D).withOpacity(0.5)
    ..strokeWidth = 1.0;

  canvas.drawLine(const Offset(0, 0), Offset(size.width, 0), paint);
}

@override
bool shouldRepaint(CustomPainter oldDelegate) {
  return false;
}

class _WalletState extends State<Wallet> {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: _Vsync());
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    walletController wc = Get.put(walletController())
      ..getWalletAmount(customerID: '22')
      ..transactionData(customerID: '22');
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF7F1),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            width: 20,
            height: 20,
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.06),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 25.sp,
                color: Colors.black,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "My Transactions",
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontSize: 22,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              unselectedLabelStyle: const TextStyle(
                color: Color(0xFF2B2B2B),
                fontSize: 18,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(text: 'Credit'),
                Tab(text: 'Debit'),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding:
                  const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              labelColor: Colors.black,
              labelStyle: const TextStyle(
                color: Color(0xFF2B2B2B),
                fontSize: 18,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w500,
              ),
              indicatorColor: const Color(0xFF2B2B2B),
              unselectedLabelColor: Colors.black.withOpacity(0.5),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  widget.creditHistory.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.credit_score_outlined,
                              color: const Color(0xffC3A66D).withOpacity(0.5),
                              size: 35,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "You don’t have any transactions yet",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      : ListView.builder(
                          itemCount: widget.creditHistory.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * (0.00256 * 14),
                                  vertical: 12),
                              child: Container(
                                width: width,
                                decoration: BoxDecoration(
                                  color: const Color(0xccfaf7f1),
                                  borderRadius: BorderRadius.circular(13.r),
                                  border: Border.all(
                                    color: const Color(0xffC3A66D),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: width * (0.00256 * 13),
                                        right: width * (0.00256 * 13),
                                        top: 8.h,
                                      ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              // "Txn ID: ${((widget.creditHistory[i]['transaction_id'].toString() == null) || (widget.creditHistory[i]['transaction_id'].toString() == ""))? "TABC0${SharedPreferencesHelper.getUserId()}${widget.creditHistory[i]['ornament'][0]['request_id']}:"${widget.creditHistory[i]['transaction_id'].toString()}"",

                                              widget.creditHistory[i][
                                                                  'transaction_id']
                                                              .toString() ==
                                                          "" ||
                                                      widget.creditHistory[i][
                                                                  'transaction_id']
                                                              .toString() ==
                                                          "null"
                                                  ? "Txn ID : TABC0${SharedPreferencesHelper.getUserId()}${widget.creditHistory[i]['ornament'][0]['request_id']}"
                                                  : "Txn ID : ${widget.creditHistory[i]['transaction_id'].toString()}",

                                              style: TextStyle(
                                                color: Colors.black.withOpacity(
                                                    0.699999988079071),
                                                fontSize: 12,
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                              ),
                                            ),
                                            Text(
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.w300,
                                                height: 0,
                                              ),
                                              '${widget.creditHistory[i]['created_at'].toString().split(' ')[0].toString().split('-')[2]}/${widget.creditHistory[i]['created_at'].toString().split(' ')[0].toString().split('-')[1]}/${widget.creditHistory[i]['created_at'].toString().split(' ')[0].toString().split('-')[0]}',
                                            )
                                          ]),
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      color: Color(0xffC3A66D),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(
                                              width * (0.00256 * 10)),
                                          child: SizedBox(
                                            height: width * 0.15,
                                            width: width * 0.15,
                                            child: CachedNetworkImage(
                                              height: width * 0.15,
                                              width: width * 0.15,
                                              fit: BoxFit.contain,
                                              imageUrl:
                                                  "${apiValue.domain}public/uploads/manager_upload_ornament_img/${widget.creditHistory[i]['ornament'][0]['customer_ornament_image']}",
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * (0.00256 * 2),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: width * 0.38,
                                              child: Text(
                                                // 'Ring',
                                                widget.creditHistory[i]
                                                                ['ornament'][0]
                                                            ['image_name'] ==
                                                        ""
                                                    ? widget.creditHistory[i]
                                                            ['ornament'][0]
                                                        ['category']
                                                    : widget.creditHistory[i]
                                                            ['ornament'][0]
                                                        ['image_name'],
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily: 'Nunito',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                maxLines: 2,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              "Gold ${widget.creditHistory[i]['ornament'][0]['carat'].toString()}KT",
                                              style: const TextStyle(
                                                color: Color(0xFF2B2B2B),
                                                fontSize: 12,
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: width * (0.00256 * 13)),
                                          child: Text(
                                            '+${widget.creditHistory[i]['amount']} gm',
                                            style: const TextStyle(
                                              color: Color(0xFF0CBC8B),
                                              fontSize: 14,
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                  widget.debitHistory.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.credit_score_outlined,
                              color: const Color(0xffC3A66D).withOpacity(0.5),
                              size: 35,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "You don’t have any transactions yet",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      : ListView.builder(
                          itemCount: widget.debitHistory.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14.0, vertical: 12),
                              child: Container(
                                width: double.infinity,
                                height: height * 0.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: const Color(0xffC3A66D)
                                            .withOpacity(0.5))),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${widget.debitHistory[i]['created_at'].toString().split(' ')[0].toString().split('-')[2]}/${widget.debitHistory[i]['created_at'].toString().split(' ')[0].toString().split('-')[1]}/${widget.debitHistory[i]['created_at'].toString().split(' ')[0].toString().split('-')[0]}',
                                            style: TextStyle(
                                              fontFamily: "Nunito",
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 0.3),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11.sp,
                                            ),
                                          ),
                                          Text(
                                            'Request Submitted',
                                            style: TextStyle(
                                              fontFamily: "Nunito",
                                              color: Colors.red,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11.sp,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Dash(
                                                direction: Axis.vertical,
                                                length: height * 0.05,
                                                // 77.h,
                                                dashLength: 7.h,
                                                dashColor: const Color.fromRGBO(
                                                    0, 0, 0, 0.27)),
                                          ),
                                          Text(
                                            '${widget.debitHistory[i]['updated_at'].toString().split(' ')[0].toString().split('-')[2]}/${widget.debitHistory[i]['created_at'].toString().split(' ')[0].toString().split('-')[1]}/${widget.debitHistory[i]['created_at'].toString().split(' ')[0].toString().split('-')[0]}',
                                            style: TextStyle(
                                              fontFamily: "Nunito",
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 0.3),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11.sp,
                                            ),
                                          ),
                                          Text(
                                            widget.debitHistory[i]
                                                            ['transaction_id']
                                                        .toString()
                                                        .length >
                                                    15
                                                ? 'Txn Id : ${widget.debitHistory[i]['transaction_id'].toString().substring(0, 10)}'
                                                : 'Txn Id : ${widget.debitHistory[i]['transaction_id'].toString()}',
                                            style: TextStyle(
                                              fontFamily: "Nunito",
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 0.3),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11.sp,
                                            ),
                                          ),
                                          Text(
                                            'Transaction Completed',
                                            style: TextStyle(
                                              fontFamily: "Nunito",
                                              color: Colors.green,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '- ₹ ${widget.debitHistory[i]['amount']}',
                                            style: TextStyle(
                                              fontFamily: "Nunito",
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          // SizedBox(height: 10,),
                                          // GestureDetector(
                                          //   onTap: () {
                                          //     openFile(url: ,fileName: 'file.pdf');
                                          //   },
                                          //   child: Container(
                                          //     height: 31.h,
                                          //     width: 31.w,
                                          //     decoration: BoxDecoration(
                                          //         borderRadius: BorderRadius.circular(12).w,
                                          //         border: Border.all(
                                          //             width: 1.w,
                                          //             color: const Color.fromRGBO(195, 166, 109, 1))),
                                          //     child: Icon(Icons.download,size: 12,)
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Vsync implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick, debugLabel: 'MyTabBarTicker');
  }
}

// import 'package:flutter/material.dart';
//
// class MyTabBar extends StatefulWidget {
//   @override
//   _MyTabBarState createState() => _MyTabBarState();
// }
//
// class _MyTabBarState extends State<MyTabBar>
//     with SingleTickerProviderStateMixin {
//   TabController? _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     _tabController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Tab Bar'),
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: [
//             Tab(text: 'Credit'),
//             Tab(text: 'Debit'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           // Widgets for Credit Tab
//           Center(
//             child: Text('Credit Tab'),
//           ),
//           // Widgets for Debit Tab
//           Center(
//             child: Text('Debit Tab'),
//           ),
//         ],
//       ),
//     );
//   }
// }
