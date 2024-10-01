# Usage

The gui and cli have the same functionality, use either one is ok.

gui.exe reads config1.ini and config2.ini.\
cli.exe reads config.ini.

Just double-click or use cmd to run cli.exe, no other parameters are required.\
Please make sure config.ini is set up before starting cli.exe.

Default timeout of game window search is 40 seconds.\
Default timeout of game window adjust is 20 seconds.

# Error Handling

Invalid parameters: Indicates errors with the window title, width, height, left, or top parameters.\
ShellExecuteError: Indicates failure to run start.bat. Please search online for the specific error code.\
Window not found: Indicates an incorrect window title, which should be the name of the game process.

# Development

Project source files are located in cli/gui folder.\
Please use Delphi Lazarus to build to project.