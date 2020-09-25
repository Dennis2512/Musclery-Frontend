import { NgModule } from "@angular/core";
import { Routes } from "@angular/router";
import { NativeScriptRouterModule } from "nativescript-angular/router";

import { PersonalDataComponent } from "./personal-data.component";

const routes: Routes = [
    { path: "", component: PersonalDataComponent}, 
    // {
    //     path: "/details", component: WorkoutlogDetailsComponent,
    // },
];

@NgModule({
    imports: [NativeScriptRouterModule.forChild(routes)],
    exports: [NativeScriptRouterModule]
})
export class PersonalDataRoutingModule { }
