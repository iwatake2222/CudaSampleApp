#pragma once

namespace CudaLib
{
#if 0
}	// indent guard
#endif

	
#ifdef DLL_EXPORT
__declspec(dllexport) void complexCalcOriginal(int n);
__declspec(dllexport) void complexCalcFast(int n);
__declspec(dllexport) void allocManaged(int **p, int size);
__declspec(dllexport) void freeManaged(int *p);
__declspec(dllexport) void complexCalc2Original(int *in, int*out, int n);
__declspec(dllexport) void complexCalc2Fast(int *in, int*out, int n);
#else
__declspec(dllimport) void complexCalcOriginal(int n);
__declspec(dllimport) void complexCalcFast(int n);
__declspec(dllimport) void allocManaged(int **p, int size);
__declspec(dllimport) void freeManaged(int *p);
__declspec(dllimport) void complexCalc2Original(int *in, int*out, int n);
__declspec(dllimport) void complexCalc2Fast(int *in, int*out, int n);
#endif

}
