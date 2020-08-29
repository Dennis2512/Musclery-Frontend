import { NgModule, NO_ERRORS_SCHEMA } from "@angular/core";
import { NativeScriptCommonModule } from "nativescript-angular/common";

import { CaloriecounterRoutingModule } from "./caloriecounter-routing.module";
import { CaloriecounterComponent } from "./caloriecounter.component";

@NgModule({
    imports: [NativeScriptCommonModule, CaloriecounterRoutingModule],
    declarations: [CaloriecounterComponent],
    schemas: [NO_ERRORS_SCHEMA],
})
export class CaloriecounterModule {}
