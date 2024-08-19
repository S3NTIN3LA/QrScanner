import 'package:flutter/material.dart';

void navegar(Widget pagina, BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => pagina),
  );
}
