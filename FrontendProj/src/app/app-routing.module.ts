import { NgModule } from "@angular/core";
import { Routes } from "@angular/router";
import { NativeScriptRouterModule } from "nativescript-angular/router";
import { PersonalDataComponent } from "./personal-data/personal-data.component";
import { WorkoutlogDetailsComponent } from "./workoutlogdetails/workoutlogdetails.component";

const routes: Routes = [
    { path: "", redirectTo: "/login", pathMatch: "full" },
    {
        path: "home",
        loadChildren: () =>
            import("~/app/home/home.module").then((m) => m.HomeModule),
    },
    {
        path: "search",
        loadChildren: () =>
            import("~/app/search/search.module").then((m) => m.SearchModule),
    },
    {
        path: "featured",
        loadChildren: () =>
            import("~/app/featured/featured.module").then(
                (m) => m.FeaturedModule
            ),
    },
    {
        path: "settings",
        loadChildren: () =>
            import("~/app/settings/settings.module").then(
                (m) => m.SettingsModule
            ),
    },
    {
        path: "login",
        loadChildren: () =>
            import("~/app/login/login.module").then((m) => m.LoginModule),
    },
    {
        path: "workoutlog",
        loadChildren: () =>
            import("~/app/workoutlog/workoutlog.module").then(
                (m) => m.WorkoutlogModule
            ),
    },
    {
        path: "caloriecounter",
        loadChildren: () =>
            import("~/app/caloriecounter/caloriecounter.module").then(
                (m) => m.CaloriecounterModule
            ),
    },
    {
        path: "bmicalculator",
        loadChildren: () =>
            import("~/app/bmicalculator/bmicalculator.module").then(
                (m) => m.BmicalculatorModule
            ),
    },
    {path: "details", component: WorkoutlogDetailsComponent
},
    {path: "personalData", component: PersonalDataComponent}
];

@NgModule({
    imports: [NativeScriptRouterModule.forRoot(routes)],
    exports: [NativeScriptRouterModule],
})
export class AppRoutingModule {}
