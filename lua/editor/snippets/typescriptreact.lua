local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("rsc", fmt([[
    const {} = () => {{
      return <div>{}</div>;
    }};

    export default {};
  ]], {
    i(1, "ComponentName"),
    rep(1),
    rep(1),
  })),
  s("rnsafe", fmt([[
    import {{ StyleSheet, Text }} from "react-native";
    import {{ SafeAreaView }} from "react-native-safe-area-context";

    const {} = () => {{
      return <SafeAreaView style={{styles.container}}>
        <Text>{}</Text>
      </SafeAreaView>
    }};

    const styles = StyleSheet.create({{
      container: {{
        flex: 1,
        justifyContent: "center",
        alignItems: "center",
        backgroundColor: "#fff"
      }}
    }})

    export default {};
    ]], {
    i(1, "ComponentName"),
    rep(1),
    rep(1),
  }))
}
