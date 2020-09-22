import { NgModule, NO_ERRORS_SCHEMA } from "@angular/core";
import { NativeScriptCommonModule } from "nativescript-angular/common";

import { WorkoutlogDetailsRoutingModule } from "./workoutlogdetails-routing.module";
import { WorkoutlogDetailsComponent } from "./workoutlogdetails.component";

@NgModule({
    imports: [NativeScriptCommonModule, WorkoutlogDetailsRoutingModule],
    declarations: [WorkoutlogDetailsComponent],
    schemas: [NO_ERRORS_SCHEMA],
})
export class WorkoutlogDetailsModule {}
