import 'package:client/providers/my_funds_provider.dart';
import 'package:client/themes/colors.dart';
import 'package:client/widgets/fund_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RaiseFundScreen extends ConsumerStatefulWidget {
  const RaiseFundScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _RaiseFundScreenState();
  }
}

class _RaiseFundScreenState extends ConsumerState<RaiseFundScreen> {
  AppColors colors = AppColors();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var myFundsList = ref.watch(myFundsProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Raise Fund',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: colors.d1,
      ),
      body: Column(
        children: [
          Expanded(
            child: myFundsList.isNotEmpty?ListView.separated(
                itemBuilder: (context, index) =>
                    FundOption(fundDetails: myFundsList[index], idx: index),
                separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                itemCount: myFundsList.length): Center(child: Text('No crowdfunds hosted!', style: TextStyle(color: colors.l1),),),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.l2,
                minimumSize: Size(width * 0.85, height * 0.08),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              child: Text(
                'Raise funding',
                style: TextStyle(color: colors.l1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
