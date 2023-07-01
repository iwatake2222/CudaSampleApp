#pragma once
#ifdef  DLL_EXPORT
/*Enabled as "export" while compiling the dll project*/
#define DLLEXPORT __declspec(dllexport)  
#else
/*Enabled as "import" in the Client side for using already created dll file*/
#define DLLEXPORT __declspec(dllimport)  
#endif

namespace CudaLib
{
#if 0
}	// indent guard
#endif


#ifdef DLL_EXPORT
DLLEXPORT void complexCalcOriginal(int *in, int *out, int n);
DLLEXPORT void complexCalcFast(int *hIn, int *hOut, int n);
DLLEXPORT void GetTestClass(long long *out);

#else
DLLEXPORT void complexCalcOriginal(int *in, int*out, int n);
DLLEXPORT void complexCalcFast(int *in, int*out, int n);
#endif

}