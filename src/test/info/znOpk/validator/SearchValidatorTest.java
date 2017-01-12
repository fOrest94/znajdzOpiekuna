package info.znOpk.validator;

import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.util.Assert;

/**
 * Created by DuduŚ on 2017-01-04.
 */

@RunWith(MockitoJUnitRunner.class)
public class SearchValidatorTest extends TestCase {

    private static String PROPER_ZIP_CODE = "zipCode";
    private static String PROPER_TOWN = "town";

    @InjectMocks
    private SearchValidator searchValidator = new SearchValidator();

    @Test
    public void testCheckDetailsResearchValues() throws Exception {

        String[] ADDRESS1 = searchValidator.checkDetailsResearchValues("random1");
        String[] ADDRESS2 = searchValidator.checkDetailsResearchValues("simple1");

        Assert.isNull(ADDRESS1);
        Assert.notNull(ADDRESS2);
    }

    @Test
    public void testCheckAddress() throws Exception {

        org.junit.Assert.assertEquals(PROPER_TOWN, searchValidator.checkAddress("Kobierzyn"));
        org.junit.Assert.assertEquals(PROPER_ZIP_CODE, searchValidator.checkAddress("38-200"));
    }
}