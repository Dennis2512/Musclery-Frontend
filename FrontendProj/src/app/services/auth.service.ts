//firebase importienren und Login speichern --> injectable, sodass man in der ganzen App weiß wer angemeldet ist.
import { Injectable } from "@angular/core";
import * as firebase from "nativescript-plugin-firebase";

@Injectable({ providedIn: "root" })
export class AuthService {
    user: firebase.User;
    constructor() {}

    async login() {
        const options: firebase.LoginOptions = {
            type: firebase.LoginType.PASSWORD,
            passwordOptions: {
                email: "lukas_blank@outlook.de",
                password: "passwort",
            },
        };
        this.user = await firebase.login(options);
        console.log("Email: " + this.user.email);
    }
}
