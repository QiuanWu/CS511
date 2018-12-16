package Assignment2;

/*
 * Name: Qiuan Wu, Chenyu Zhao
 * I pledge my honor that I have abided by the Stevens Honor System
 */

import java.util.*;
import java.util.concurrent.Semaphore;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Gym implements Runnable {

    private static final int GYM_SIZE = 30;
    private static final int GYM_REGISTERED_CLIENTS = 10000;
    private Map<WeightPlateSize,Integer> noOfWeightPlates;
    private Set<Integer> clients; // for generating fresh client ids
    private ExecutorService executor;
    static Semaphore m_grab = new Semaphore(1);
    static Semaphore m_release = new Semaphore(1);

    // declare number of weightplates for different weight
    private static final int NUM_3KG = 110;
    private static final int NUM_5KG = 90;
    private static final int NUM_10KG = 75;

    // semaphores for appratus
    static Semaphore S_LEGPRESSMACHINE = new Semaphore(5);
    static Semaphore S_BARBELL = new Semaphore(5);
    static Semaphore S_HACKSQUATMACHINE = new Semaphore(5);
    static Semaphore S_LEGEXTENSIONMACHINE = new Semaphore(5);
    static Semaphore S_LEGCURLMACHINE = new Semaphore(5);
    static Semaphore S_LATPULLDOWNMACHINE = new Semaphore(5);
    static Semaphore S_PECDECKMACHINE = new Semaphore(5);
    static Semaphore S_CABLECROSSOVERMACHINE = new Semaphore(5);

    // semaphore for weightplates
    static Semaphore S_3KG = new Semaphore(NUM_3KG);
    static Semaphore S_5KG = new Semaphore(NUM_5KG);
    static Semaphore S_10KG = new Semaphore(NUM_10KG);
    

    
    public Gym() {
        // Initialize clients
        this.clients = new HashSet<Integer>();

        // Initialize noofWeightPlates
        this.noOfWeightPlates = new HashMap<>();
        this.noOfWeightPlates.put(WeightPlateSize.SMALL_3KG, NUM_3KG);
		this.noOfWeightPlates.put(WeightPlateSize.MEDIUM_5KG, NUM_5KG);
        this.noOfWeightPlates.put(WeightPlateSize.LARGE_10KG, NUM_10KG);

    }


    
    // Generate a random nonduplicate client ID between 1 and total clients number
    private int generateClientID () {
        Random randomClientID = new Random();
        int cid = 1;
        while (clients.contains(cid)) {
            cid = randomClientID.nextInt(GYM_REGISTERED_CLIENTS) + 1;
        }
        clients.add(cid);
        return cid;
    }

    private int generateClientIDseq () {
        int cid = 0;
        while (clients.contains(cid)) {
            cid++;
        }
        clients.add(cid);
        return cid;
    }


    @Override
    public void run(){
        System.out.println("Gym opened");
        executor = Executors.newFixedThreadPool (GYM_SIZE);
        for(int i = 0; i < GYM_REGISTERED_CLIENTS; i++) {
            Client client = Client.generateRandom(generateClientID(), noOfWeightPlates); 
            executor.execute(client);
        }
        executor.shutdown ();
    }
}
