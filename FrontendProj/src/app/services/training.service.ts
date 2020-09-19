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
            workouts.push(
                new Training(
                    element.id,
                    element.name,
                    element.date,
                    element.exercises
                )
            );
        });
        console.log("RESPONSE: " + res);
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
                    id: null,
                    training: new Training(), //später echtes Training
                },
                { headers: { ["authorization"]: "Bearer " + token } }
            )
            .toPromise();
    }

    //what update workout should do:
    //1. change a Workout
}
