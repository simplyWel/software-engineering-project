#include <iostream>
#include "../include/bib.hpp"
using namespace std;

int main() {
    cout << "Teste de Fatorial:" << endl;
    cout << "5! = "  << calcularFatorial(5) << endl;
    cout << "Teste de Soma: 3 + 4 = " << calcularSoma(3, 4) << endl;
    return 0;
}
