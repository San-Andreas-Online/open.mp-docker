native printf(const format[], {Float, _}:...);
native SendRconCommand(const cmd[]);

main()
{
	printf("  ___  _ __   ___ _ __    _ __ ___  _ __        ___  ___ _ ____   _____ _ __  ");
	printf(" / _ \\| '_ \\ / _ \\ '_ \\  | '_ ` _ \\| '_ \\ _____/ __|/ _ \\ '__\\ \\ / / _ \\ '__| ");
	printf("| (_) | |_) |  __/ | | |_| | | | | | |_) |_____\\__ \\  __/ |   \\ V /  __/ |    ");
	printf(" \\___/| .__/ \\___|_| |_(_)_| |_| |_| .__/      |___/\\___|_|    \\_/ \\___|_|    ");
	printf("      |_|                          |_|                                        ");

	printf("ERROR: gamemode not found. Please check the config.json file and make sure the gamemode is set correctly.");
	printf("Remember to change the rcon.password in the config.json file to prevent unauthorized access and allow the gamemode to load.");

	SendRconCommand("exit");

	return 1;
}