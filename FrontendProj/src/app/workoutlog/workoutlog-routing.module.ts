import { NgModule } from "@angular/core";
import { Routes } from "@angular/router";
import { NativeScriptRouterModule } from "nativescript-angular/router";

import { WorkoutlogComponent } from "./workoutlog.component";

const routes: Routes = [
    { path: "", component: WorkoutlogComponent }
];

@NgModule({
    imports: [NativeScriptRouterModule.forChild(routes)],
    exports: [NativeScriptRouterModule]
})
export class WorkoutlogRoutingModule { }
