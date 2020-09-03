import { Component, OnInit } from "@angular/core";
import { RadSideDrawer } from "nativescript-ui-sidedrawer";
import * as app from "tns-core-modules/application";
import { alert, prompt } from "tns-core-modules/ui/dialogs";
import * as firebase from "nativescript-plugin-firebase";

@Component({
    selector: "Login",
    templateUrl: "./login.component.html",
    styleUrls: ["./login.component.css"],
})
export class LoginComponent implements OnInit {
    isLoggingIn = true;

    toggleForm() {
        this.isLoggingIn = !this.isLoggingIn;
    }
    async submit() {
        console.log("hello world");
        if (this.isLoggingIn) {
            //perform Login
            const options: firebase.LoginOptions = {
                type: firebase.LoginType.PASSWORD,
                passwordOptions: {
                    email: "lukas_blank@outlook.de",
                    password: "passwort",
                },
            };
            const user: firebase.User = await firebase.login(options);
            console.log("Email: " + user.email);
            const token = await user.getIdToken();
            console.log("Token: " + token);
        } else {
            //perform registration
            console.log("fail");
        }
    }
    constructor() {
        // Use the component constructor to inject providers.
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
