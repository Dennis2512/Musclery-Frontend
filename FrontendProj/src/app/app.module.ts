import { NgModule, NO_ERRORS_SCHEMA } from "@angular/core";
import { NativeScriptModule } from "nativescript-angular/nativescript.module";
import { NativeScriptUISideDrawerModule } from "nativescript-ui-sidedrawer/angular";

import { AppRoutingModule } from "./app-routing.module";
import { AppComponent } from "./app.component";


import * as firebase from "nativescript-plugin-firebase";
import { NativeScriptHttpClientModule } from "nativescript-angular";
import { WorkoutlogDetailsModule } from "./workoutlogdetails/workoutlogdetails.module";
import { PersonalDataModule } from "./personal-data/personal-data.module";

//firebase = require("nativescript-plugin-firebase");

firebase
    .init()
    .then(() => console.log("--- Firebase Connection Success ---"))
    .catch((e) => console.log("--- ERROR: " + e));

@NgModule({
    bootstrap: [AppComponent],
    imports: [
        AppRoutingModule,
        NativeScriptModule,
        NativeScriptUISideDrawerModule,
        NativeScriptHttpClientModule,
        WorkoutlogDetailsModule, 
        PersonalDataModule
    ],
    declarations: [AppComponent],
    schemas: [NO_ERRORS_SCHEMA],
})
export class AppModule { }
