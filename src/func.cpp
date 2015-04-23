#include <iostream>
#include "func.h"

using namespace std;

void testFunc(){
	int c = simpleSum(10, 3);
	cout << c << endl;

	for (int i = 0; i < 10; ++i){
		cout << staticCnt() << endl;
	}
}

int simpleSum(int a, int b){
	return a + b;
}

size_t staticCnt(){
	static size_t cnt = 0;
	return ++cnt;
}

