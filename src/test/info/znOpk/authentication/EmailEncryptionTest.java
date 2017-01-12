package info.znOpk.authentication;

import junit.framework.TestCase;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.runners.MockitoJUnitRunner;

/**
 * Created by DuduŚ on 2017-01-05.
 */
@RunWith(MockitoJUnitRunner.class)
public class EmailEncryptionTest extends TestCase {

    private static String TESTED_EMAIL = "jasio2@wp.pl";

    @InjectMocks
    private EmailEncryption emailEncryption = new EmailEncryption();

    @Test
    public void testEncryptAndDecrypt() throws Exception {

        String temp = emailEncryption.encrypt(TESTED_EMAIL);
        Assert.assertEquals(TESTED_EMAIL, emailEncryption.decrypt(temp));

    }
}