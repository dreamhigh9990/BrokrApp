// ignore_for_file: library_private_types_in_public_api

import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import '../../../../../models/super_model.dart';
import '../../../fragments/trips/booked_fragment.dart';
import '../../../fragments/trips/history_fragment.dart';
import '../../../fragments/trips/pending_fragment.dart';




class TripsFragment extends StatefulWidget {
  const TripsFragment({super.key});

  @override
  _TripsFragmentState createState() => _TripsFragmentState();
}

class _TripsFragmentState extends State<TripsFragment> {
  List<List<SuperModel>> list = [];
  @override
  void initState() {
    list.add(SuperModel.getCars());
    list.add(SuperModel.getStay());
    list.add(SuperModel.getYacht());
    list.add(SuperModel.getBoat());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                leading: Container(),
                elevation: 0,
                centerTitle: true,
                title:  const AutoSizeText(
                  "Trips",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
                backgroundColor: Colors.white,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(48),
                  child: Column(
                    children:  [
                    const  Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      TabBar(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        indicatorColor: ThemeUtils.colorPurple,
                        labelColor: ThemeUtils.colorPurple,
                        unselectedLabelColor: ThemeUtils.colorTripsGrey,
                        tabs: const [
                          Tab(text: 'Booked'),
                          Tab(text: 'Pending'),
                          Tab(text: 'History'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              body: TabBarView(
                children: [
                  BookedFragment(list: list),
                  PendingFragment(list: list),
                  HistoryFragment(list: list)
                ],
              ),
            )),
      );
}
