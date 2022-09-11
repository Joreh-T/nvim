#include <iostream>
#include <cstdio>
using namespace std;

template <class NameType, class AgeType>
class Person {
public:
    NameType m_Name;
    AgeType  m_Age;

public:
    Person(NameType name, AgeType age) {
        this->m_Name = name;
        this->m_Age = age;
    }
    void showPerson() {
        cout << "name:" << this->m_Name << " "
             << "age:" << this->m_Age << endl;
    }
};

void test() {
    Person<string, int> p1("Tom", 20);
    p1.showPerson();
}

int main(void) {
    test();
    return 0;
}
