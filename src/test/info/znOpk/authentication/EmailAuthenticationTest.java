package info.znOpk.authentication;

import info.znOpk.model.User;
import junit.framework.TestCase;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

/**
 * Created by DuduŚ on 2017-01-04.
 */
@RunWith(MockitoJUnitRunner.class)
public class EmailAuthenticationTest extends TestCase {

    @Mock
    private EmailEncryption emailEncryption;

    @InjectMocks
    private EmailAuthentication emailAuthentication = new EmailAuthentication();

    @Test
    public void testProperGenerateAndSendEmail() throws Exception {

        User user = new User(4L,"sewerdudek15@gmail.com","Kasia","Ropa");
        assertTrue(emailAuthentication.generateAndSendEmail(user));
    }

    @Test
    public void testBadGenerateAndSendEmail() throws Exception {

        User user = new User(4L,"","Kasia","Trzepak");
        assertFalse(emailAuthentication.generateAndSendEmail(user));
    }
}