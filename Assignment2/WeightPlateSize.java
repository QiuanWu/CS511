package Assignment2;

/*
 * Name: Qiuan Wu, Chenyu Zhao
 * I pledge my honor that I have abided by the Stevens Honor System
 */

import java.util.*;

public enum WeightPlateSize {
    SMALL_3KG, MEDIUM_5KG, LARGE_10KG;

    /* 
     * Source: https://stackoverflow.com/questions/1972392/pick-a-random-value-from-an-enum 
     * This generates a random WeightPlateSize
     */
    private static final List<WeightPlateSize> VALUES = Collections.unmodifiableList(Arrays.asList(values()));
    private static final int SIZE = VALUES.size();
    private static final Random RANDOM = new Random();

    public static WeightPlateSize getRandomWeightPlateSize() {
        return VALUES.get(RANDOM.nextInt(SIZE));
    }
}; 
