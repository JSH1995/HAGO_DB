package util;

public class StrTokenizer {
    private String message;
    private String divider;
    private java.util.StringTokenizer st;

    public StrTokenizer(String message, String divider) {
        this.message = message;
        this.divider = divider;
        st = new java.util.StringTokenizer(message, divider);
    }

    protected void stringTokenizerReset() {
        st = new java.util.StringTokenizer(message, divider);
    }

    public int getTokenSize() {
        stringTokenizerReset();
        return st.countTokens();
    }

    public String[] getTokens() {
        stringTokenizerReset();
        String[] strs = new String[getTokenSize()];
        for (int i = 0; i < strs.length; i++) {
            strs[i] = st.nextToken();
        }
        return strs;
    }

    public String getIndexToken(int start1) {
        stringTokenizerReset();
        String str = null;
        int j = 1;
        while (true) {
            if (start1 == j) {
                str = st.nextToken();
                break;
            }
            j++;
            st.nextToken();
        }
        return str;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getDivider() {
        return divider;
    }

    public void setDivider(String divider) {
        this.divider = divider;
    }
}
