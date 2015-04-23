#include <iostream>
#include "mystd.h"

using namespace std;

void stdstr(){
	string s = "hello ";
	cout << s <<  s.length() <<endl;

	for (auto &c : s){
		c = toupper(c);
	}
	cout << s << endl;
}

void stdvector(){
	vector<int> v;
	for (int i = 0; i < 10; ++i){
		v.push_back(i);
	}

	cout << v.size() << endl;
}

void stditerator(){
	vector<string> vs;

	for (int i = 0; i < 10; i++){
		vs.push_back(to_string(i));
	}
	for (auto it = vs.begin(); it != vs.end(); it++){
		cout << it->empty() << " " << *it << endl;
	}
}

void stdarray(){
	int a[10][10];
	int b[10];
	for (int i = 0; i < 10; i++){
		for (int j = 0; j < 10; j++){
			a[i][j] = i * 10 + j;
		}
		b[i] = i;
	}

	for (auto v : b){
		cout << v << " ";
	}
	cout << endl;

	for (int *p = begin(b); p != end(b); p++){
		cout << *p << " ";
	}
	cout << endl;

	for (auto &row : a){
		for (auto &col : row){
			cout << col << " | ";
		}
		cout << endl;
	}
}