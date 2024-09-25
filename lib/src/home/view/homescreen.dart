import 'package:fashion_app/src/Products/widgets/explore_products.dart';
import 'package:fashion_app/src/home/controllers/home_tab_notifier.dart';
import 'package:fashion_app/src/home/widgets/categories-list.dart';
import 'package:fashion_app/src/home/widgets/custombar.dart';
import 'package:fashion_app/src/home/widgets/homeheader.dart';
import 'package:fashion_app/src/home/widgets/homeslider.dart';
import 'package:fashion_app/src/home/widgets/ometabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabcontroller;

  int _currenttabindex = 0;

  @override
  void initState() {
    _tabcontroller = TabController(length: hometab.length, vsync: this);
    _tabcontroller.addListener(_handleselection);
    // TODO: implement initState
    super.initState();
  }

  void _handleselection() {
    final controller = Provider.of<hometabnotofier>(context, listen: false);

    if (_tabcontroller.indexIsChanging) {
      setState(() {
        _currenttabindex = _tabcontroller.index;
      });
      controller.setindex(hometab[_currenttabindex]);
    }
  }

  @override
  void dispose() {
    _tabcontroller.addListener(_handleselection);
    _tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(110), child: CustomAppBar()),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        children: [
          SizedBox(
            height: 10,
          ),
          HomeSlider(),
          SizedBox(
            height: 7,
          ),
          HomeHeader(),
          SizedBox(
            height: 15.h,
          ),
          HomeCateoriesList(),
          SizedBox(
            height: 10.h,
          ),
          Hometabs(
            tabController: _tabcontroller,
          ),
          SizedBox(
            height: 15.h,
          ),
          ExploreProducts(),
          SizedBox(
            height: 150.h,
          ),
        ],
      ),
    );
  }
}

List<String> hometab = ["All", "popular", "Unisex", "Men", "Women", "kid"];
