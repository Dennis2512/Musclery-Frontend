import { NgModule, NO_ERRORS_SCHEMA } from "@angular/core";
import { NativeScriptModule } from "nativescript-angular/nativescript.module";
import { NativeScriptUISideDrawerModule } from "nativescript-ui-sidedrawer/angular";

import { SideNavBarRoutingModule } from "./side-nav-bar-routing.module";
import { SideNavBarComponent } from "./side-nav-bar.component";

@NgModule({
    bootstrap: [SideNavBarComponent],
    imports: [
        SideNavBarRoutingModule,
        NativeScriptModule,
        NativeScriptUISideDrawerModule,
    ],
    declarations: [SideNavBarComponent],
    schemas: [NO_ERRORS_SCHEMA],
})
export class AppModule {}
