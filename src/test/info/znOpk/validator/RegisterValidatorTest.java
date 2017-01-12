package info.znOpk.validator;

import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.runners.MockitoJUnitRunner;

/**
 * Created by DuduŚ on 2017-01-04.
 */
@RunWith(MockitoJUnitRunner.class)
public class RegisterValidatorTest extends TestCase {

    private static final String INPUT = "778";
    private static final String INPUT1 = "s78";

    @Test
    public void testIsTheSame() throws Exception {

        RegisterValidator registerValidator = new RegisterValidator();
        registerValidator.isTheSame(INPUT, INPUT);

        assertTrue(registerValidator.isTheSame(INPUT, INPUT));
        assertFalse(registerValidator.isTheSame(INPUT, INPUT1));
    }

}

