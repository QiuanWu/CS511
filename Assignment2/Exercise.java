package Assignment2;

/*
 * Name: Qiuan Wu, Chenyu Zhao
 * I pledge my honor that I have abided by the Stevens Honor System
 */

import java.util.*;

public class Exercise {

    private ApparatusType at;
    private Map<WeightPlateSize,Integer> weight;
    private int duration;


    public Exercise(ApparatusType at, Map<WeightPlateSize,Integer> weight, int duration) {
        this.at = at;
        this.weight = weight;
        this.duration = duration;
    }
    
    public static Exercise generateRandom(Map<WeightPlateSize, Integer> weight) {
        
        // Generate random number of plates for each size
        int num_3kg;
        int num_5kg;
        int num_10kg;
        Random random = new Random();
        Map<WeightPlateSize, Integer> resultweight = new HashMap<WeightPlateSize, Integer>();

        num_3kg = random.nextInt(11);
        num_5kg = random.nextInt(11);
        num_10kg = random.nextInt(11);

        /*
         * Source: https://stackoverflow.com/questions/9470104/select-random-java-variable-is-this-possible
         * This randomly selects a variable set to value > 0
         */
        if (num_3kg == 0 && num_5kg == 0 && num_10kg == 0) {
            int i = random.nextInt()%3;
            switch (i) {
                case 0:
                    num_3kg = random.nextInt(10) + 1;
                case 1:
                    num_5kg = random.nextInt(10) + 1;
                case 2:
                    num_10kg = random.nextInt(10) + 1;
                default:
                    break;
            }
        }
        resultweight.put(WeightPlateSize.SMALL_3KG, num_3kg);
        resultweight.put(WeightPlateSize.MEDIUM_5KG, num_5kg);
        resultweight.put(WeightPlateSize.LARGE_10KG, num_10kg);
 
        // Generate random duration for each exercise
        int duration_milli = random.nextInt(100) + 10;
        Exercise newExercise = new Exercise(ApparatusType.getRandomApparatusType(), resultweight, duration_milli);
        return newExercise; 
    }

    public int getDuration() {
		return this.duration;
    }
    
    public ApparatusType getApparatusType() {
		return this.at;
    }
    
    public Map<WeightPlateSize,Integer> getWeight() {
        return this.weight;
    }

}
