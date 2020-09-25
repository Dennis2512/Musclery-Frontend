import { NgModule, NO_ERRORS_SCHEMA } from "@angular/core";
import { NativeScriptCommonModule } from "nativescript-angular/common";

import { CaloriecounterRoutingModule } from "./caloriecounter-routing.module";
import { NativeScriptUIChartModule } from "nativescript-ui-chart/angular";
import { CaloriecounterComponent } from "./caloriecounter.component";

@NgModule({
    imports: [NativeScriptCommonModule, CaloriecounterRoutingModule, 
        NativeScriptUIChartModule
    ],
    declarations: [CaloriecounterComponent],
    schemas: [NO_ERRORS_SCHEMA],
})
export class CaloriecounterModule {}
