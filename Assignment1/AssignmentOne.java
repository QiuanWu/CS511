/*
 * Qiuan Wu, Chenyu Zhao
 * CS511 HW1
 * I pledge my honor that I have abided by the Stevens Honor System
 * 
 */

import java.util.*;

public class AssignmentOne {
    
    public static List<Integer> lprimes(List<Integer[]> intervals) {
        List<PrimeFinder> resultList = new ArrayList<PrimeFinder>();
        List<Integer> results = new ArrayList<Integer>();
        Thread threads[] = new Thread[intervals.size()];
        
        // Start new threads
        for (int i = 0; i < intervals.size(); i++) {
            resultList.add(new PrimeFinder(intervals.get(i)[0], intervals.get(i)[1]));
            threads[i] = new Thread(resultList.get(i));
            threads[i].start();
        }

        // Wait for other threads to end
        for (int i = 0; i < threads.length; i++) {
            try {
                threads[i].join();
            }
            catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        // Combine resultList to results
        for (PrimeFinder l : resultList) {
            results.addAll(l.getPrimesList());
        }

        return results;
    }

    public static void main(String args[]) {
        if (args.length < 2) {
            System.out.println("Please give at least 2 number arguments!");
            return;
        }
        
        // Check increasing
        for (int i = 1; i < args.length; i++) {
            if (Integer.valueOf(args[i-1]) >= Integer.valueOf(args[i])) {
                System.out.println("Arguments should have an increasing order!");
                return;
            }
        }

        AssignmentOne obj = new AssignmentOne();    
        List<Integer[]> Intervals = new ArrayList<Integer[]>();
        for (int i = 0; i < args.length - 1; i++) {
            Integer[] pair = new Integer[2];
            pair[0] = Integer.valueOf(args[i]);
            pair[1] = Integer.valueOf(args[i+1]);
            Intervals.add(pair);
        }
        System.out.println(obj.lprimes(Intervals));
        return;
    }

}