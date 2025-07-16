package users;

import com.intuit.karate.junit5.Karate;

public class UsersRunnerTest {
    @Karate.Test
    Karate testUsers() {
        return Karate.run().relativeTo(getClass());
    }
}
