import { NgModule, NO_ERRORS_SCHEMA } from "@angular/core";
import { NativeScriptCommonModule } from "nativescript-angular/common";

import { BmicalculatorRoutingModule } from "./bmicalculator-routing.module";
import { BmicalculatorComponent } from "./bmicalculator.component";

@NgModule({
    imports: [NativeScriptCommonModule, BmicalculatorRoutingModule],
    declarations: [BmicalculatorComponent],
    schemas: [NO_ERRORS_SCHEMA],
})
export class BmicalculatorModule {}