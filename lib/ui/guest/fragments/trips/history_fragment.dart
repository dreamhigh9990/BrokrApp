// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../models/super_model.dart';
import '../../../../utils/theme_utils.dart';
import '../../../widgets/item_card.dart';

import '../../pages/home/widgets/tab_buttoms_widget.dart';

class HistoryFragment extends StatefulWidget {
  final List<List<SuperModel>> list;
   int groupValue;

     HistoryFragment({required this.list, super.key ,required this.groupValue} );

  @override
  State<HistoryFragment> createState() => _HistoryFragmentState();
}

class _HistoryFragmentState extends State<HistoryFragment> {
  final _duration = const Duration(milliseconds: 300);

  bool showFab = false;


  @override
  Widget build(BuildContext context) => Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AnimatedSlide(
        duration: _duration,
        offset: showFab ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: _duration,
          opacity: showFab ? 1 : 0,
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: ThemeUtils.colorPurple,
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/list_icon.svg',
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Add',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.white, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 1,
                  color: Colors.white,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/filter_icon.svg'),
                        const SizedBox(width: 10),
                        Text(
                          'Filter',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: ThemeUtils.paddingScaffoldx025,
        child:Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
           
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: ThemeUtils.paddingScaffoldx025,
                    itemCount: widget.list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: Get.context!.height * 0.20,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: GestureDetector(
                          onTap: () {
                          
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: ItemCardTrip(
                                 titleButton: "Cancel",
                              title: "PAST",
                              margin: EdgeInsets.only(
                                left: ThemeUtils.borderShadowAppBar,
                                right: ThemeUtils.borderShadowAppBar,
                              ),
                              superModel: widget.list[widget.groupValue][index],
                              changedFavorite: () {},
                             isBoat: widget.groupValue== 2 ? true : false,
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ));
}
