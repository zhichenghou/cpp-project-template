#include <iostream>
#include "base.h"

void base() {
	// std::cout << "Enter two numbers: " << std::endl;
	// int v1 = 0, v2 = 0;
	// std::cin >> v1 >> v2;
	// std::cout << "The sum of " << v1 << " and " << v2 
	// 		  << " is " << v1 + v2 << std::endl;

	int sum = 0;
	int val = 1;
	while (val < 10) {
		sum += val;
		++val;
	}
	std::cout << "sum of 1 to 10 is " << sum << std::endl;

	sum = 0;
	for (int i = 0; i < 10; ++i){
		sum += i;
	}
	std::cout << "sum of 1 to 10 is " << sum << std::endl;

	// sum = 0;
	// while (std::cin >> val){
	// 	sum += val;
	// }

	// std::cout << "Sum of values is " << sum << std::endl;

}