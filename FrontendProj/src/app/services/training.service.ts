import { getLocaleFirstDayOfWeek } from "@angular/common";
import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Training } from "../models/training";

@Injectable({ providedIn: "root" })
export class TrainingService {
    constructor(private http: HttpClient) {}

    async getWorkouts(token: string): Promise<Training[]> {
        console.log(token);
        const res: any = await this.http
            .get(
                "https://europe-west2-muclery6669.cloudfunctions.net/training",
                { headers: { ["authorization"]: "Bearer " + token } }
            )
            .toPromise();

        //Promise in Training geparst
        const workouts: Training[] = [];
        res.data.forEach((element) => {

            console.log(element.date);

            workouts.push(
                new Training(
                    element.id,
                    element.name,
                    new Date(element.date._seconds*1000),
                    element.exercises
                )
 
            );
        });
        console.log("RESPONSE: " + workouts[0].getDateString() + "");
        console.log("WORKOUTS: " + workouts);
        return workouts;
    }

    //what add Workout should do:
    //1. create empty Workout and give ID
    //2.
    async addWorkout(token: string) {
        const res: any = await this.http
            .post(
                "https://europe-west2-muclery6669.cloudfunctions.net/training",
                {
                },
                { headers: { ["authorization"]: "Bearer " + token } }
            )
            .toPromise();

            console.log(res);
            const temp = new Date(res.data.date._seconds*1000);
            return new Training(res.id, res.data.name, temp, res.data.exercises);
    }

    //what update workout should do:
    //1. change a Workout
}
