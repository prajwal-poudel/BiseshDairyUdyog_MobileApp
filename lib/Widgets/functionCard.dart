import 'package:bisesh_dairy_udyog_app/Pages/Summary.dart';
import 'package:bisesh_dairy_udyog_app/Provider/functionalProvider.dart';
import 'package:flutter/material.dart';

Widget functionCard(BuildContext context, FunctionDetail data, int index) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;

  return Material(
    color: Colors.grey[200],
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 2,
    child: MaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      splashColor: Theme.of(context).primaryColor.withOpacity(0.4),
      onPressed: () {
        switch (index) {
          case 1:
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => Summary()));
            break;
        }
        // print(index);
        // switch (index) {
        //   case 0:

        //     // Navigator.pushNamed(context, "/our_information");

        //     Navigator.of(context)
        //         .push(CustomPageRoute(child: OurInformation()));
        //     break;

        //   case 1:
        //     // Navigator.pushNamed(context, "/yojanatathaparyojana");
        //     lunchInApp("com.example.tourism_app");
        //     break;

        //   case 2:
        //     lunchInApp("com.example.hello_mayor");
        //     break;

        //   case 3:
        //     // Navigator.pushNamed(context, "/tabpage");

        //     Navigator.of(context).push(CustomPageRoute(child: TabPages()));

        //     break;

        //   case 4:
        //     // Navigator.pushNamed(context, "/nagarkpalika_woda_patra");

        //     Navigator.of(context)
        //         .push(CustomPageRoute(child: NagarpalikaWodaPatra()));

        //     break;

        //   // case 8:
        //   //   Navigator.pushNamed(context, "/nagarpalika_profile");
        //   //   break;

        //   case 5:
        //     // Navigator.pushNamed(context, "/revenue");

        //     Navigator.of(context).push(CustomPageRoute(child: Revenue()));

        //     break;

        //   case 6:
        //     // Navigator.pushNamed(context, "/bivhakharu");

        //     Navigator.of(context).push(CustomPageRoute(child: Bivhak()));

        //     break;

        //   case 7:
        //     // Navigator.pushNamed(context, "/yenKanunNerdeSeek");

        //     Navigator.of(context).push(CustomPageRoute(child: YenKanun()));
        //     break;

        //   case 8:
        //     // Navigator.pushNamed(context, "/employee");

        //     Navigator.of(context).push(CustomPageRoute(child: Employee()));
        //     break;

        //   case 9:
        //     // Navigator.pushNamed(context, "/import_number_list_page");

        //     Navigator.of(context)
        //         .push(CustomPageRoute(child: ImportantNumberList()));
        //     break;

        //   default:
        //     print("To Be Created !!");
        //     break;
        // }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: deviceHeight * 0.02,
          ),
          Container(
            height: deviceHeight * 0.1,
            // color: Colors.red,
            child: ClipRRect(
              child: Image.asset(
                data.functionImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                data.functionName,
                maxLines: 2,
                style: TextStyle(
                    decorationStyle: TextDecorationStyle.dotted,
                    fontSize: deviceWidth * 0.035),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
