import 'package:flutter/material.dart';
import 'package:islamyapp/Features/introduction_view/widget/custom_stack.dart';
import 'package:islamyapp/Features/presentation/view/quran/widgets/custom_list_v.iew.dart';
import 'package:islamyapp/Features/presentation/view/quran/widgets/custom_sliver_list.dart';
import 'package:islamyapp/Features/presentation/view/quran/widgets/custom_text_filed.dart';
import 'package:islamyapp/core/utils/styles.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final TextEditingController _searchController = TextEditingController();
  final searchFocusNode = FocusNode();
  bool isSearch = false;
  List<int> filterSura = [];

  @override
  void initState() {
    searchFocusNode.addListener(() {
      setState(() {
        isSearch = searchFocusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomStack(),
                CustomTextfield(
                  controller: _searchController,
                  focusNode: searchFocusNode,
                  onChanged: (value) {
                    setState(() {
                      isSearch = value.isNotEmpty;
                    });
                  },
                ),
                const SizedBox(height: 10),
                if (!isSearch)
                  Text(
                    "Most Recently ",

                    style: Styles.textStylew16,
                    textAlign: TextAlign.start,
                  ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isSearch) const Customlistview(),

                if (!isSearch)
                  Text(
                    "Suras List ",
                    style: Styles.textStylew16,
                    textAlign: TextAlign.start,
                  ),
              ],
            ),
          ),
          if (isSearch)
            CustomSliverList(searchQuery: _searchController.value.text),
        ],
      ),
    );
  }
}
