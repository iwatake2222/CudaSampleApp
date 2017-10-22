#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include "stdio.h"
#include "stdlib.h"

#include "complexCalc.h"

namespace CudaLib
{
#if 0
}	// indent guard
#endif

void complexCalcOriginal(int n)
{
	for (int i = 0; i < n; i++) {
		printf("processing heavy work (%d / %d)\n", i, n);
	}
}

void complexCalc2Original(int *in, int*out, int n)
{
	for (int i = 0; i < n; i++) {
		out[i] = in[i] * 2;
	}
}

void allocManaged(int **p, int size)
{
	cudaMallocManaged(p, size);
}

void freeManaged(int *p)
{
	cudaFree(p);
}

__global__ void complexCalcFastLoop(int n)
{
	int i = threadIdx.x;
	if (i < n) {
		printf("processing heavy work (%d / %d)\n", i, n);
	}
}

void complexCalcFast(int n)
{
	complexCalcFastLoop << <1, n >> > (n);
	cudaDeviceSynchronize();
}

__global__ void complexCalc2FastLoop(int *in, int*out, int n)
{
	int i = threadIdx.x;
	if (i < n) {
		out[i] = in[i] * 2;
	}
}

void complexCalc2Fast(int *in, int*out, int n)
{
	complexCalc2FastLoop << <1, n >> > (in, out, n);
	cudaDeviceSynchronize();
}

}