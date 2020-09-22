import { NgModule, NO_ERRORS_SCHEMA } from "@angular/core";
import { NativeScriptCommonModule } from "nativescript-angular/common";

import { WorkoutlogDetailsRoutingModule } from "./workoutlog-routing.module";
import { WorkoutlogDetailsComponent } from "./workoutlog.component";

@NgModule({
    imports: [NativeScriptCommonModule, WorkoutlogDetailsRoutingModule],
    declarations: [WorkoutlogDetailsComponent],
    schemas: [NO_ERRORS_SCHEMA],
})
export class WorkoutlogModule {}
