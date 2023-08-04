# AutoLaunch

A simple Objective-C based application which adds your app to login items under system setting for macOS Ventura.

## File Structure

- `main.m`: Contains the main function that initialises the application
- `AppDelegate.m`: Initialises the window and contains functions for registering/unregistering applications for auto launch 

## Building the Project

1. Open Terminal and navigate to the root directory of the project.

 2. ```sh
	mkdir build 
	cd build
	cmake .. -GXcode
  	cmake --build .
	```

## Running the Project

Launch the project using:

```sh
open Debug/Executable.app
```

