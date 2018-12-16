package Assignment2;

/*
 * Name: Qiuan Wu, Chenyu Zhao
 * I pledge my honor that I have abided by the Stevens Honor System
 */

import java.util.*;

public enum ApparatusType {
	LEGPRESSMACHINE, BARBELL, HACKSQUATMACHINE, LEGEXTENSIONMACHINE, 
	LEGCURLMACHINE, LATPULLDOWNMACHINE, PECDECKMACHINE,
	CABLECROSSOVERMACHINE;
	
	/*
	 * Source: https://stackoverflow.com/questions/1972392/pick-a-random-value-from-an-enum
	 * This generates a random AppratusType
	 */
	private static final List<ApparatusType> VALUES = Collections.unmodifiableList(Arrays.asList(values()));
    private static final int SIZE = VALUES.size();
    private static final Random RANDOM = new Random();

    public static ApparatusType getRandomApparatusType() {
        return VALUES.get(RANDOM.nextInt(SIZE));
    }
}; 