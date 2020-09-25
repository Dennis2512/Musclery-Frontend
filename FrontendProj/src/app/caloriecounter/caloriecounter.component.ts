import { Component, OnInit } from "@angular/core";
import { RadSideDrawer } from "nativescript-ui-sidedrawer";
import * as app from "tns-core-modules/application";

@Component({
    selector: "Caloriecounter",
    templateUrl: "./caloriecounter.component.html",
    styleUrls: ["/caloriecounter.component.css"]
})
export class CaloriecounterComponent implements OnInit {
    mealSource: { Meal: string, Amount: number, SecondVal: number, ThirdVal: number }[] = [
        { Meal: "Breakfast", Amount: 15, SecondVal: 14, ThirdVal: 24 },
        { Meal: "Lunch", Amount: 13, SecondVal: 23, ThirdVal: 25 },
        { Meal: "Dinner", Amount: 24, SecondVal: 17, ThirdVal: 23 }
    ];

    weightSource: { Month: string, Amount: number, SecondVal: number, ThirdVal: number }[] = [
        { Month: "Jan", Amount: 15, SecondVal: 14, ThirdVal: 24 },
        { Month: "Feb", Amount: 13, SecondVal: 23, ThirdVal: 25 },
        { Month: "Mar", Amount: 24, SecondVal: 17, ThirdVal: 23 }
    ];
    
    constructor() {
        // Use the component constructor to inject providers.
    }

    ngOnInit(): void {
        // Init your component properties here.
    }

    onDrawerButtonTap(): void {
        const sideDrawer = <RadSideDrawer>app.getRootView();
        sideDrawer.showDrawer();
    }
}
