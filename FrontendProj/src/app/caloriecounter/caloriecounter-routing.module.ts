import { NgModule } from "@angular/core";
import { Routes } from "@angular/router";
import { NativeScriptRouterModule } from "nativescript-angular/router";

import { CaloriecounterComponent } from "./caloriecounter.component";

const routes: Routes = [{ path: "", component: CaloriecounterComponent }];

@NgModule({
    imports: [NativeScriptRouterModule.forChild(routes)],
    exports: [NativeScriptRouterModule],
})
export class CaloriecounterRoutingModule {}
