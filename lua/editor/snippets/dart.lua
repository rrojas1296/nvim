local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- StatelessWidget
  s("statelessW", fmt([[
    class {} extends StatelessWidget {{
      const {}({{super.key}});

      @override
      Widget build(BuildContext context) {{
        return {};
      }}
    }}
  ]], {
    i(1, "MyWidget"),
    rep(1),
    i(0, "Container()"),
  })),

  -- StatefulWidget
  s("statefulW", fmt([[
    class {} extends StatefulWidget {{
      const {}({{super.key}});

      @override
      State<{}> createState() => _{}State();
    }}

    class _{}State extends State<{}> {{
      @override
      Widget build(BuildContext context) {{
        return {};
      }}
    }}
  ]], {
    i(1, "MyWidget"),
    rep(1),
    rep(1),
    rep(1),
    rep(1),
    rep(1),
    i(0, "Container()"),
  })),
  s("mateapp", fmt([[
    import 'package:flutter/material.dart';

    void main() => runApp(const MyApp());

    class MyApp extends StatelessWidget {{
      const MyApp({{super.key}});

      @override
      Widget build(BuildContext context) {{
        return MaterialApp(
          title: '{}',
          home: Scaffold(
            appBar: AppBar(
              title: const Text('{}'),
            ),
            body: const Center(
              child: Text('{}'),
            ),
          ),
        );
      }}
    }}
  ]], {
    i(1, "Material App"),
    i(2, "Material App Bar"),
    i(0, "Hello World"),
  })),
}
