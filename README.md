# Cuda sample code for Visual Studio 2017
Sample project to use CUDA code with normal C/C++ console application as DLL library

## Environment
 - Windows 10 64bit
 - Visual Studio 2017 (vs_community__1955304111.1508236056)
 - Cuda 9.0 (cuda_9.0.176_win10)

## Project structure
### CudaLib project
 - contains cuda source code(.cu) and provides DLL library
 - creates dll file (when Configuration Type is Dynamic Library (.dll))
 - creates exe file (when Configuration Type is Application (.exe))
	- this is for unit test

### MyApp project
 - is the main application
 - this project uses DLL
 - normal C/C++ Console application (no need specific configurations for CUDA)


## Note for CUDA install and setting
 - Make sure you install "Windows 10 SDK(10.0.15063.0) for Desktop C++" when you install Visual Studio, otherwise you will see "cannot open file 'gdi32.lib' error"
 - Whenever you change project settings in Visual Studio, don't forget to change the settings for all the Platforms(x64/x86, Debug/Release)

## How to start this from scratch
- Create a normal Windows Console Application (can be any such as Desktop App, C# project, WPF, .NET as logn as it can use DLL)
- Add a new CUDA project into the solution
	- Add New Project -> NVIDIA -> CUDA 9.0 -> CUDA 9.0 Runtime
- Write your CUDA code and test it in the CUDA project
- Export your CUDA function as DLL in the CUDA project
	- Add preprocessor definitions to the CUDA project
		- Project -> Properties -> C/C++ -> Preprocessor -> Preprocessor Definitions
		- "DLL_EXPORT"	(this can be any)
	- Make header file with "__declspec(dllexport)"
	- Change project type
		- Project -> Properties -> General -> Configuration Type
		- Dynamic Library (.dll)

- Config the main project (Windows Console Application in this case)
	- Include path
		- C/C++ -> General -> Additional Include Directories
		- ../ComplexCalcLib
	- Library path
		- Linker -> Input -> Additional Dependencies
		- ../x64/Debug/ComplexCalcLib.lib


