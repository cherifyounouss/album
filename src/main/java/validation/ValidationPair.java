package validation;

import java.util.ArrayList;
import java.util.List;

public class ValidationPair {

    private String aString;
    private List<Rules> rules;

    public ValidationPair(String aString) {
        this.aString = aString;
        rules = new ArrayList<>();
    }

    public ValidationPair(String aString, Rules ... rules) {
        this(aString);
        for (Rules rule: rules) {
            this.rules.add(rule);
        }
    }

    public void addRule(Rules rule) {
        rules.add(rule);
    }

    public List<Rules> getRules() {
        return  rules;
    }

    public String getStringToValidate() {
        return aString;
    }
}
