import { Component, OnInit } from "@angular/core";
import { RadSideDrawer } from "nativescript-ui-sidedrawer";
import * as app from "tns-core-modules/application";
import { alert, prompt } from "tns-core-modules/ui/dialogs";
import * as firebase from "nativescript-plugin-firebase";
import { TrainingService } from "../services/training.service";
import { AuthService } from "../services/auth.service";
import { RouterExtensions } from "nativescript-angular";
import { ThrowStmt } from "@angular/compiler";

@Component({
    selector: "Login",
    templateUrl: "./login.component.html",
    styleUrls: ["./login.component.css"],
})
export class LoginComponent implements OnInit {
    isLoggingIn = true;
    constructor(private ts: TrainingService, private as: AuthService, private router: RouterExtensions) {
        // Use the component constructor to inject providers.
    }

    toggleForm() {
        this.isLoggingIn = !this.isLoggingIn;
    }
    async submit() {
        console.log("hello world");
        if (this.isLoggingIn) {
            //perform Login
            await this.as.login();
            this.router.navigateByUrl("/home");
        } else {
            this.router.navigateByUrl("/personalData");
            console.log("fail");
        }
    }

    ngOnInit(): void {
        // Init your component properties here.
    }

    //functions in login.html code

    onDrawerButtonTap(): void {
        const sideDrawer = <RadSideDrawer>app.getRootView();
        sideDrawer.showDrawer();
    }

    forgotPassword() {
        prompt({
            title: "Forgot Password",
            message:
                "Enter the email address you used to register for Musclery to reset your password.",
            defaultText: "",
            okButtonText: "Ok",
            cancelButtonText: "Cancel",
        }).then((data) => {
            if (data.result) {
                // Call the backend to reset the password
                alert({
                    title: "Musclery",
                    message:
                        "Your password was successfully reset. Please check your email for instructions on choosing a new password.",
                    okButtonText: "Ok",
                });
            }
        });
    }
}
