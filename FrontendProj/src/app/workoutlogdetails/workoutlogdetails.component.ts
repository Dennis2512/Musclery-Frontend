import { Component, OnInit } from "@angular/core";
import { Router } from "@angular/router";
import { RouterExtensions } from "nativescript-angular/router";
import { RadSideDrawer } from "nativescript-ui-sidedrawer";
import * as app from "tns-core-modules/application";
import { AuthService } from "../services/auth.service";
import { TrainingService } from "../services/training.service";


@Component({
    selector: "WorkoutlogDetails",
    templateUrl: "./workoutlogdetails.component.html",
    styleUrls: ["./workoutlogdetails.component.css"]
})
export class WorkoutlogDetailsComponent implements OnInit {
public data: any[] = [];
    constructor(private router: RouterExtensions, private as: AuthService, private ts: TrainingService) {
        // Use the component constructor to inject providers.
    }

    ngOnInit(): void {
        // Init your component properties here
    }

    // async fetch(){
    //     const token = await this.as.user.getIdToken();
    //     console.log(token);
    //     this.data = await this.ts.getWorkouts(token);
    //     console.log(this.data);
    // }

    onDrawerButtonTap(): void {
        const sideDrawer = <RadSideDrawer>app.getRootView();
        sideDrawer.showDrawer();
    }

    saveTraining(){
        this.router.navigateByUrl("workoutlog");
    }
}
