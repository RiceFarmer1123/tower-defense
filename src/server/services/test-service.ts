import { Service, OnStart, OnInit } from "@flamework/core";

@Service({})
export class Bruh implements OnStart, OnInit {
	//OnInit
	//Runs before the game initiates, OnStart waits for the game to fully be loaded
	constructor() {}
	onInit() {
		warn("");
	}

	onStart() {}
}
