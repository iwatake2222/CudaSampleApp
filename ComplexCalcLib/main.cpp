/*
* Note:
* To switch output type (dll/exe), Project Configuration Properties -> Configuration Type
* *.exe for unit test
* *.dll for dll library
*/
#include "stdio.h"
#include "stdlib.h"

#include "complexCalc.h"

using namespace CudaLib;

void unitTest()
{
	int n = 10;

	printf("original result\n");
	complexCalcOriginal(n);

	printf("new result\n");
	complexCalcFast(n);
}

void unitTest2()
{
	int n = 4;
	int *in, *out;

	allocManaged(&in, n * sizeof(int));
	allocManaged(&out, n * sizeof(int));

	for (int i = 0; i < n; i++) {
		in[i] = i;
		out[i] = 0;
	}
	
	printf("original result\n");
	complexCalc2Original(in, out, n);
	for (int i = 0; i < n; i++) {
		printf("out[%d] = %d\n", i, out[i]);
	}

	printf("new result\n");
	complexCalc2Fast(in, out, n);
	for (int i = 0; i < n; i++) {
		printf("out[%d] = %d\n", i, out[i]);
	}
	
	freeManaged(in);
	freeManaged(out);
}

int main()
{
	unitTest();
	unitTest2();

	getchar();
	return 0;
}

