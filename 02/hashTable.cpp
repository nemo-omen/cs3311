#include <iostream>
#include <list>
#include <cstring>
using namespace std;

// Hashtable {id, tag}

class HashTable {
  private:
    static const int hashGroups = 10;
    list<pair<int, string>> table[hashGroups]; // List 1, Index 0, List 2, Index 1 ...

  public:
    bool isEmpty() const;
    int hashFunction(int key);
    void insertItem(int key, string value);
    void removeItem(int key);
    string searchTable(int key);
    void printTable();
    void printItem(int key);
};

bool HashTable::isEmpty() const {
  int sum{};
  for (int i{}; i < hashGroups; i++) {
    sum += table[i].size();
  }

  if(!sum) {
    return true;
  }

  return false;
}

int HashTable::hashFunction(int key) {
  return key % hashGroups;
}

void HashTable::insertItem(int key, string value) {
  int hashValue = hashFunction(key);
  auto& cell = table[hashValue];
  bool keyExists = false;
  auto bItr = begin(cell);

  for(; bItr != end(cell); bItr++) {
    if(bItr->first == key) {
      keyExists = true;
      bItr->second = value;
      cout << "[WARNING] Key exists. Value replaced." << endl;
      break;
    }
  }

  if(!keyExists) {
    cell.emplace_back(key, value);
  }

  return;
}

void HashTable::removeItem(int key) {
  int hashValue = hashFunction(key);
  auto& cell = table[hashValue];
  auto bItr = begin(cell);
  bool keyExists = false;

  for(; bItr != end(cell); bItr++) {
    if(bItr->first == key) {
      keyExists = true;
      bItr = cell.erase(bItr);
      cout << "[INFO] Pair removed." << endl;
      break;
    }
  }

  if(!keyExists) {
    cout << "[WARNING] Key not found. Pair not removed." << endl;
  }

  return;
}

string HashTable::searchTable(int key) {
  int hashValue = hashFunction(key);
  auto& cell = table[hashValue];
  auto bItr = begin(cell);
  bool keyExists = false;
  for(; bItr != end(cell); bItr++) {
    if(bItr->first == key) {
      keyExists = true;
      cout << "[INFO] Found pair - Key: " << bItr->first << ", Value: " << bItr->second << endl;
      return bItr->second;
    }
  }

  cout << "[WARNING] Item not found." << endl;
  return string("");
}

void HashTable::printTable() {
  for(int i{}; i < hashGroups; i++) {
    if(table[i].size() == 0) continue;

    auto bItr = table[i].begin();
    for(; bItr != table[i].end(); bItr++) {
      cout << "[INFO] Key: " << bItr->first << ", Value: " << bItr->second << endl;
    }
  }
  return;
}

int main(int argc, const char** argv) {
    HashTable HT;

    if(HT.isEmpty()) {
      cout << "Okay, starting with an empty table. Very good!" << endl;
    } else {
      cout << "Oops! Your table's not empty. There's a problem" << endl;
    }

    HT.insertItem(23, "ABC");
    HT.insertItem(45, "DEF");
    HT.insertItem(98, "GHI");
    HT.insertItem(98, "JKL");
    HT.insertItem(60, "MNO");
    HT.insertItem(50, "PQR");

    HT.printTable();

    HT.removeItem(45);
    HT.removeItem(23);

    HT.searchTable(98);

    if(HT.isEmpty()) {
      cout << "There's a problem. We've attempted to add multiple items to this table." << endl;
    } else {
      cout << "Looking good. We're not empty." << endl;
    }
    return 0;
}