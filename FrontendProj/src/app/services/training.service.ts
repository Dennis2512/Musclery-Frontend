import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Http } from "tns-core-modules";

@Injectable({ providedIn: "root" })
export class TrainingService {
    public workouts = null;

    constructor(private http: HttpClient) {}

    async getWorkouts(token: string) {
        console.log(token);
        this.workouts = await this.http
            .get(
                "https://europe-west2-muclery6669.cloudfunctions.net/training",
                { headers: { ["authorization"]: "Bearer " + token } }
            )
            .toPromise();

        console.log(this.workouts.data);
    }
}
