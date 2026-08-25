import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:islamyapp/Features/introduction_view/introction_view.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/cubit/cubit/reciters_cubit.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/cubit/cubit_radio/fetch_redios_cubit.dart';
import 'package:islamyapp/Features/presentation/view/time/cubit_time/pary_timecubit.dart';

void main() async {
  // WidgetsBinding widgetBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting("ar");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => FetchRediosCubit()..getRadio(),
          ),
          BlocProvider(
            create: (BuildContext context) => RecitersCubit()..getReciter(),
          ),
          BlocProvider(
            create: (BuildContext context) => ParyTimecubit()..fetchpraytime(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData.dark().copyWith(
            textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'Janna LT',
              //  textTheme: GoogleFonts.cairoTextTheme(ThemeData.dark().textTheme),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const IntroctionView(),
        ),
      ),
    );
  }
}
