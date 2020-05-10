package util;

public class InputScriptInjection {
    public String ScriptInjection(String str){
        String match = "[\"\'<>;\\{\\}]";
        str = str.replaceAll(match, "");
        System.out.println(str);
        return str;
    }
}
