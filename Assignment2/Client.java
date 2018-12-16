package Assignment2;

/*
 * Name: Qiuan Wu, Chenyu Zhao
 * I pledge my honor that I have abided by the Stevens Honor System
 */

import java.util.*;
import java.lang.Runnable;

public class Client implements Runnable {
    private int id;
    private List<Exercise> routine;

    public Client(int id) {
        this.id = id;
        this.routine = new ArrayList<Exercise>();
    }

    public void addExercise(Exercise e) {
        routine.add(e);
    }

    public static Client generateRandom(int id, Map<WeightPlateSize, Integer> noOfWeightPlates) {
        Random random = new Random(); 
        Client client = new Client(id);
        int Num_Exercises = random.nextInt(6) + 15;
        int temp = Num_Exercises;
        while (temp > 0) {
            client.addExercise(Exercise.generateRandom(noOfWeightPlates));
            temp--;
        }
        return client;
    }

    @Override
    public void run() {
        try {
            //System.out.println("Start");
            // Grabbing the apparatus
            for (Exercise exe : routine) {
                
                Gym.m_grab.acquire();
                System.out.println("Client " + this.id + " has started grabing");
                if (exe.getApparatusType() == ApparatusType.LEGPRESSMACHINE) 
                    Gym.S_LEGPRESSMACHINE.acquire();
                if (exe.getApparatusType() == ApparatusType.BARBELL)
                    Gym.S_BARBELL.acquire();
                if (exe.getApparatusType() == ApparatusType.HACKSQUATMACHINE)
                    Gym.S_HACKSQUATMACHINE.acquire();
                if (exe.getApparatusType() == ApparatusType.LEGEXTENSIONMACHINE)
                    Gym.S_LEGEXTENSIONMACHINE.acquire();
                if (exe.getApparatusType() == ApparatusType.LEGCURLMACHINE)
                    Gym.S_LEGCURLMACHINE.acquire();
                if (exe.getApparatusType() == ApparatusType.LATPULLDOWNMACHINE) 
                    Gym.S_LATPULLDOWNMACHINE.acquire();
                if (exe.getApparatusType() == ApparatusType.PECDECKMACHINE)
                    Gym.S_PECDECKMACHINE.acquire();
                if (exe.getApparatusType() == ApparatusType.CABLECROSSOVERMACHINE) 
                    Gym.S_CABLECROSSOVERMACHINE.acquire();

                // Grabbing the weights
                for (int i = 0; i < exe.getWeight().get(WeightPlateSize.SMALL_3KG); i++)
                    Gym.S_3KG.acquire();
                for (int i = 0; i < exe.getWeight().get(WeightPlateSize.MEDIUM_5KG); i++)
                    Gym.S_5KG.acquire();
                for (int i = 0; i < exe.getWeight().get(WeightPlateSize.LARGE_10KG); i++)
                    Gym.S_10KG.acquire();
                
                Gym.m_grab.release();

                System.out.println("Client " + this.id + " has started working on: " + exe.getApparatusType() + " " + exe.getWeight());


                Thread.sleep(exe.getDuration());

                //System.out.println("Just Finished");
                System.out.println("Client " + this.id + " has finished with: " + exe.getApparatusType() + " " + exe.getWeight());
                Gym.m_release.acquire();
                //System.out.println("Putting back");
                if (exe.getApparatusType() == ApparatusType.LEGPRESSMACHINE) 
                    Gym.S_LEGPRESSMACHINE.release();
                if (exe.getApparatusType() == ApparatusType.BARBELL)
                    Gym.S_BARBELL.release();
                if (exe.getApparatusType() == ApparatusType.HACKSQUATMACHINE)
                    Gym.S_HACKSQUATMACHINE.release();
                if (exe.getApparatusType() == ApparatusType.LEGEXTENSIONMACHINE)
                    Gym.S_LEGEXTENSIONMACHINE.release();
                if (exe.getApparatusType() == ApparatusType.LEGCURLMACHINE)
                    Gym.S_LEGCURLMACHINE.release();
                if (exe.getApparatusType() == ApparatusType.LATPULLDOWNMACHINE) 
                    Gym.S_LATPULLDOWNMACHINE.release();
                if (exe.getApparatusType() == ApparatusType.PECDECKMACHINE)
                    Gym.S_PECDECKMACHINE.release();
                if (exe.getApparatusType() == ApparatusType.CABLECROSSOVERMACHINE) 
                    Gym.S_CABLECROSSOVERMACHINE.release();

                // Putting back the weight aftering using it
                for (int i = 0; i < exe.getWeight().get(WeightPlateSize.SMALL_3KG); i++)
                    Gym.S_3KG.release();
                for (int i = 0; i < exe.getWeight().get(WeightPlateSize.MEDIUM_5KG); i++)
                    Gym.S_5KG.release();
                for (int i = 0; i < exe.getWeight().get(WeightPlateSize.LARGE_10KG); i++)
                    Gym.S_10KG.release();
                
                Gym.m_release.release();

                System.out.println("Client " + this.id + " has put back: " + exe.getApparatusType() + " " + exe.getWeight());
            }
        } 
        catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}


