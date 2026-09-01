import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamyapp/Features/presentation/view/quran/widgets/sura_detelis_screen.dart';
import 'package:islamyapp/core/utils/assets.dart';
import 'package:islamyapp/core/utils/styles.dart';

class CustomSura extends StatelessWidget {
  final int suraNamber;
  final String entitle;
  final String artitle;
  final String lEntitle;
  final String lArtitle;
  final String ayanumber;
  const CustomSura({
    super.key,
    required this.suraNamber,
    required this.entitle,
    required this.artitle,
    required this.lEntitle,
    required this.lArtitle,
    required this.ayanumber,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return SuraDetelisScreen(title: entitle, suraindex: suraNamber);
            },
          ),
        );
      },
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(DataAssets.suraNumber),
          Text("${suraNamber + 1}", style: Styles.textStylew14),
        ],
      ),
      title: Text(lEntitle, style: Styles.textStylew20),
      subtitle: Text(ayanumber, style: Styles.textStylew14),
      trailing: Text(lArtitle, style: Styles.textStylew20),
    );
  }
}
