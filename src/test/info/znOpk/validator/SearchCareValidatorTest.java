package info.znOpk.validator;

import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.runners.MockitoJUnitRunner;

/**
 * Created by DuduŚ on 2017-01-04.
 */

@RunWith(MockitoJUnitRunner.class)
public class SearchCareValidatorTest extends TestCase {

    private static final String PROPER_INPUT_VALUE = "778";
    private static final String BAD_INPUT_VALUE = "s78";

    @Test
    public void testIsNumeric() throws Exception {

        SearchCareValidator validator = new SearchCareValidator();

        assertTrue(validator.isNumeric(PROPER_INPUT_VALUE));
        assertFalse(validator.isNumeric(BAD_INPUT_VALUE));
    }

}