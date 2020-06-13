import 'package:flutter/material.dart';
import 'package:focustracker/views/telas/login.dart';

class BarraNavegacao extends StatelessWidget {

  final bool barraAdministrativa;

  BarraNavegacao(this.barraAdministrativa);

  @override
  Widget build(BuildContext context){
    const iconsColor = Colors.black;
    List<BottomNavigationBarItem> listaBotoes = <BottomNavigationBarItem> [
      BottomNavigationBarItem(
        title: Text(''),
        icon: IconButton(
          icon: Icon(Icons.trending_up),
          onPressed: () => Navigator.pushReplacementNamed(context, '/estatisticas'),
          color: iconsColor,
        )
      ),
      BottomNavigationBarItem(
        title: Text(''),
        icon: IconButton(
          icon: Icon(Icons.add_circle),
          onPressed: () => Navigator.pushReplacementNamed(context, '/denuncia'),
          color: iconsColor,
        )
      ),
      BottomNavigationBarItem(
        title: Text(''),
        icon: IconButton(
          icon: Icon(Icons.place),
          onPressed: () => Navigator.pushReplacementNamed(context, '/mapa'),
          color: iconsColor,
        ),
      ),
      BottomNavigationBarItem(
        title: Text(''),
        icon: IconButton(
          icon: Icon(Icons.person),
          onPressed: () => Navigator.pushReplacementNamed(context, '/conta'),
          color: iconsColor,
        ),
      )
    ];

    if(this.barraAdministrativa){
      listaBotoes.insert(0,
        BottomNavigationBarItem(
          title: Text(''),
          icon: IconButton(
          icon: Icon(Icons.format_list_bulleted),
          onPressed: () => Navigator.pushReplacementNamed(context, '/adm'),
          color: iconsColor,
        )
        )
      );
    }

    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: listaBotoes
    );
  }
}