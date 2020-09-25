import { NgModule, NO_ERRORS_SCHEMA } from "@angular/core";
import { NativeScriptCommonModule } from "nativescript-angular/common";

import { PersonalDataRoutingModule } from "./personal-data-routing.module";
import { PersonalDataComponent } from "./personal-data.component";

@NgModule({
    imports: [NativeScriptCommonModule, PersonalDataRoutingModule],
    declarations: [PersonalDataComponent],
    schemas: [NO_ERRORS_SCHEMA],
})
export class PersonalDataModule {}
