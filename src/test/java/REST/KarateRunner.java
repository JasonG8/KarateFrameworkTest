package REST;

import com.intuit.karate.junit5.Karate;

public class KarateRunner {

    @Karate.Test
    Karate testSample() {
        return Karate.run("classpath:REST/KarateTest.feature").tags("@casoPost");
    }

}