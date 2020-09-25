import { Component, OnInit } from "@angular/core";
import { RouterExtensions } from "nativescript-angular/router";
import { RadSideDrawer } from "nativescript-ui-sidedrawer";
import * as app from "tns-core-modules/application";
import { fontFamilyProperty } from "tns-core-modules/ui/page";


@Component({
    selector: "personal",
    templateUrl: "./personal-data.component.html",
    styleUrls: ["./personal-data.component.css"]
})
export class PersonalDataComponent implements OnInit {
    public data: any[] = [];

    constructor(private router: RouterExtensions) {
        // Use the component constructor to inject providers.
    }

    ngOnInit(): void {
        // Init your component properties here.
    }

    onClick(): void {
        console.log("Hello"); 
        
    }


    onDrawerButtonTap(): void {
        const sideDrawer = <RadSideDrawer>app.getRootView();
        sideDrawer.showDrawer();
    }
}
