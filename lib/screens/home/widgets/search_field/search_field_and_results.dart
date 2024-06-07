




import 'package:flutter/material.dart';
import 'package:poi_maps/common/styles/spacing_styles.dart';
import 'package:poi_maps/screens/home/widgets/search_field/search_results_list.dart';
import 'package:poi_maps/screens/home/widgets/search_field/search_text_field.dart';


class SearchFieldAndResults extends StatelessWidget {
  const SearchFieldAndResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        /// TextField for Search
        Padding(
          padding: HkSpacingStyle.homeSearchTextFieldPadding,
          child: HkSearchTextField(),
        ),

        /// Box to show the results while searching
        HkSearchResultsList()
      ],
    );
  }
}



