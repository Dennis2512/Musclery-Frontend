import { NgModule, NO_ERRORS_SCHEMA } from "@angular/core";
import { NativeScriptCommonModule } from "nativescript-angular/common";

import { WorkoutlogRoutingModule } from "./workoutlog-routing.module";
import { WorkoutlogComponent } from "./workoutlog.component";

@NgModule({
    imports: [NativeScriptCommonModule, WorkoutlogRoutingModule],
    declarations: [WorkoutlogComponent],
    schemas: [NO_ERRORS_SCHEMA],
})
export class WorkoutlogModule {}
