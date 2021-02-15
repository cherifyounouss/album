package validation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validation {


    public static HashMap<String, List<String>> validate(ValidationPair... pairsToValidate) {
        HashMap<String, List<String>> errors = new HashMap<>();
        for (ValidationPair pair : pairsToValidate) {
            String stringToValidate = pair.getStringToValidate();
            ArrayList<String> exceptions = new ArrayList<>();
            for (Rules rule : pair.getRules()) {
                if (!validate(stringToValidate, rule))
                    exceptions.add(rule.message);
            }
            if (!exceptions.isEmpty())
                errors.put(stringToValidate, exceptions);
        }
        return errors;
    }

    private static boolean validate(String aString, Rules rule) {
        if (rule == Rules.ALPHA)
            return validateAlpha(aString);
        if (rule == Rules.EMAIL_TYPE)
            return validateEmail(aString);
        if (rule == Rules.NUMERIC)
            return validateNumeric(aString);
        return false;
    }

    private static boolean validateAlpha(String aString) {
        return aString.matches("[a-zA-Z\\s]+");
    }

    private static boolean validateNumeric(String aString) {
        return aString.matches("[0-9]+");
    }

    private static boolean validateEmail(String aString) {
        Pattern pattern = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(aString);
        return matcher.find();
    }
}