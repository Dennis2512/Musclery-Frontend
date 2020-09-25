import { Component, OnInit } from "@angular/core";
import { RouterExtensions } from "nativescript-angular/router";
import { RadSideDrawer } from "nativescript-ui-sidedrawer";
import * as app from "tns-core-modules/application";
import { fontFamilyProperty } from "tns-core-modules/ui/page";
import { AuthService } from "../services/auth.service";
import { TrainingService } from "../services/training.service";

@Component({
    selector: "Workoutlog",
    templateUrl: "./workoutlog.component.html",
    styleUrls: ["./workoutlog.component.css"]
})
export class WorkoutlogComponent implements OnInit {
    public data: any[] = [];

    constructor(private ts: TrainingService, private as: AuthService, private router: RouterExtensions) {
        // Use the component constructor to inject providers.
    }

    ngOnInit(): void {
        // Init your component properties here.
        this.fetch();
    }

    async fetch() {
        const token = await this.as.user.getIdToken();
        console.log(token);
        this.data = await this.ts.getWorkouts(token);
        console.log(this.data);
    }

    onClick(workout: any): void {
        console.log(workout); 
        this.router.navigateByUrl("details");
        
    }
    

    async addWorkout() {
        const token = await this.as.user.getIdToken();
        this.data.push(await this.ts.addWorkout(token));
    }

    onDrawerButtonTap(): void {
        const sideDrawer = <RadSideDrawer>app.getRootView();
        sideDrawer.showDrawer();
    }
}
