/////////////////////////////////////////////////////////////////////////////////////
//                        Super Magic Square Сomplexity O(N)                       //
//                         Copyright (c) 2019, hammerlok                           //
//                            mr.grimmaxel@gmail.com                               //
//                                    *****                                        //
// This software is provided 'as-is', without any express or implied warranty.     //
// In no event will the authors be held liable for any damages arising from the    //
// use of this software.                                                           //
// Permission is granted to anyone to use this software for any purpose,           //
// including commercial applications, and to alter it and redistribute it          //
// freely, subject to the following restrictions :                                 //
//                                                                                 //
// 1. The origin of this software must not be misrepresented; you must not claim   //
//    that you wrote the original software. If you use this software in a product, //
//    an acknowledgment in the product documentation is required.                  //
//                                                                                 //
// 2. Altered source versions must be plainly marked as such, and must not be      //
//    misrepresented as being the original software.                               //
//                                                                                 //
// 3. This notice may not be removed or altered from any source distribution.      //
/////////////////////////////////////////////////////////////////////////////////////
// FILE:     sms.cpp                                                               //
// AUTHOR:   hammerlok                                                             //
// CREATED:  28-Dec-2019                                                           //
// VERSIONS: 1.0 Released 28-Dec-2019                                              //
/////////////////////////////////////////////////////////////////////////////////////

using namespace std;

#include <iostream>

void calcSuperMagicSquare(int* arr, int size);
void printSuperMagicSquare(int* arr, int size);

int main( int argc, const char* argv[] ) {
	
	cout << "Input square size " << endl;
	int size;
	cin >> size; cin.ignore();

	if( size % 2 == 0 ) {
		cout << "Icorrect size!\n shoud be odd" << endl;

		return 0;
	}

	int* smsArr = new int[size * size];
	if (smsArr == 0) {
		cout << "mem alloc failed" << endl;
		return 0;
	}

	calcSuperMagicSquare(smsArr, size);
	printSuperMagicSquare(smsArr, size);

	free(smsArr);

	return 0;
}

void calcSuperMagicSquare(int* arr, int size) {
	int k = 1;
	int ps = size * size + 1;
	int m = size / 2;
	for (int d = 0; d < m; ++d) {
		int mij = size - d - 1;
		for (int j = d + 1; j <= m; ++j) { //TL
			arr[d * size + j] = k;
			arr[mij * size + j] = ps - k;
			++k;
		}
		for (int i = d + 1; i < m; ++i) { //RT
			arr[i * size + mij] = k;
			arr[i * size + d] = ps - k;
			++k;
		}
		for (int j = m + 1; j < mij; ++j) { //BR
			arr[mij * size + j] = k;
			arr[d * size + j] = ps - k;
			++k;
		}
		{ // RBC
			arr[mij * size + mij] = k;
			arr[d * size + d] = ps - k;
			++k;
		}
		{ // LM
			arr[m * size + d] = k;
			arr[m * size + mij] = ps - k;
			++k;
		}
		{ // LBC
			arr[mij * size + d] = k;
			arr[d * size + mij] = ps - k;
			++k;
		}
		for (int i = m + 1; i < mij; ++i) { //LB
			arr[i * size + d] = k;
			arr[i * size + mij] = ps - k;
			++k;
		}
	}

	arr[m * size + m] = k++;
}

void printSuperMagicSquare(int* arr, int size) {
	for (int i = 0; i < size; ++i) {
		int offset = i * size;
		for (int j = 0; j < size; ++j, ++offset) {
			cout << arr[offset] << "\t";
		}
		cout << endl;
	}
}