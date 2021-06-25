import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:formulario/materiaData.dart';

class MateriaWidget extends StatefulWidget {
  final MateriaData materiaData;
  MateriaWidget(this.materiaData);
  @override
  State<StatefulWidget> createState() {
    return MateriaWidgetState(materiaData);
  }
}

class MateriaWidgetState extends State<MateriaWidget> {
  MateriaData materiaData;
  Image _iconWidget;
  MateriaWidgetState(this.materiaData) {
    _iconWidget = Image.asset(materiaData.iconPath);
    try {
      _iconWidget = Image.asset(materiaData.iconPath);
    } catch (e) {
      _iconWidget = Image.asset('assets/icon/appIcon.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Ink(
          child: Column(
            children: [
              materiaBoxWidget,
              materiaTitleWidget,
            ],
          ),
        ),
        onTap: () {
          if (!(materiaData.formule.isEmpty && materiaData.subMaterie.isEmpty))
            Navigator.push(context, materiaData.getMateriaPage());
        },
      ),
    );
  }

  Widget get materiaBoxWidget => Expanded(
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Color(materiaData.colorValue),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFF1E5DD).withAlpha(100),
                  offset: Offset(-20, 10),
                ),
                BoxShadow(
                  color: Color(0xFFF1E5DD).withAlpha(100),
                  offset: Offset(-20, 0),
                ),
                BoxShadow(
                  color: Color(0xFFF1E5DD).withAlpha(100),
                  offset: Offset(0, 10),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Hero(
                tag: materiaData.materiaTitle,
                child: _iconWidget,
              ),
            ),
          ),
        ),
      );
  Widget get materiaTitleWidget => Padding(
        padding: EdgeInsets.only(top: 7),
        child: Container(
          alignment: Alignment.center,
          child: AutoSizeText(
            materiaData.materiaTitle.toUpperCase(),
            wrapWords: false,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Brandon-Grotesque-black',
              letterSpacing: 0.2,
              shadows: [
                Shadow(
                  color: Colors.grey[600],
                  offset: Offset(-3, 0),
                ),
              ],
              color: Colors.white,
            ),
          ),
        ),
      );
}
