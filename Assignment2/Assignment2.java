package Assignment2;

/*
 * Name: Qiuan Wu, Chenyu Zhao
 * I pledge my honor that I have abided by the Stevens Honor System
 */

/** start the simulation */
public class Assignment2 {
    public static void main ( String [] args ) {
        Thread thread = new Thread ( new Gym());
        thread.start ();
        try {
            thread.join ();
        } catch ( InterruptedException e) {
            // TODO Auto - generated catch block
            e.printStackTrace ();
        }
    }
}