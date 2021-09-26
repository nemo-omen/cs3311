#include <iostream>
#include <string>
#include <cstring>
#include <list>
#include <iterator>
#include <random>

using namespace std;

class HashTable {
  private:
    static const int buckets = 10;
    list<pair<int, string>> table[buckets];

  public:
    bool isEmpty() const;
    int hashFunction(int bucketSize);
    void insertItem(int id, string tag);
    void insertItem(pair<int, string> val);
    void removeItem(int id);
    
    void printItem(int id);
    void printTable();
};

bool HashTable::isEmpty() const {
  int sum{};
  for (int i{}; i < buckets; i++) {
    sum += table[i].size();
  }

  if(!sum) {
    return true;
  }

  return false;
}

int HashTable::hashFunction(int id) {
  return (id % buckets);
}

void HashTable::insertItem(int id, string tg) {
  int index = hashFunction(id);
  pair<int, string> item;
  item.first = id;
  item.second = tg;
  table[index].push_back(item);
}

void HashTable::insertItem(pair<int, string> val) {
  insertItem(val.first, val.second);
}

void HashTable::removeItem(int id) {
  int index = hashFunction(id);
  list<pair<int, string> >::iterator i;

  for(i = table[index].begin(); i != table[index].end(); i++) {
    if(i->first == id) {
      break;
    }
  }

  if(i != table[index].end()) {
    table[index].erase(i);
  }
}

void HashTable::printItem(int id) {
  cout << "Maybe later!" << endl;
}

void HashTable::printTable() {
  for(int i{}; i < buckets; i++) {
    if(table[i].size() == 0) {
      cout << "[" << i << "]" << " --> " << "{}" << endl;
    } else {
      cout << "[" << i << "]";
      for(auto x : table[i]) {
        cout << " --> " << "{ ID: " << x.first << ", tag: " << x.second << " }";
      }
      cout  << endl;
    }
  }
  return;
}

pair<int, string> generatePair() {
  random_device rd;
  mt19937 gen(rd());
  uniform_int_distribution<> dist(100, 999);
  uniform_int_distribution<> dista(0, 25);

  pair<int, string> val;
  int id = dist(gen);
  const int MAX = 26;

  string alpha[MAX] = {
    "a", "b", "c", "d", "e", "f", 
    "g", "h", "i", "j", "k", "l",
    "m", "n", "o", "p", "q", "r",
    "s", "t", "u", "v", "w", "x",
    "y", "z"
  };

  string tag = "";
  for(int i = 0; i < 3; i++) {
    tag = tag + alpha[dista(gen) % MAX];
  }
  val.first = id;
  val.second = tag;
  return val;
}

int main(int argc, const char** argv) {
  HashTable h;
  int itemIds[30];

  for(int i = 0; i < 30; i++) {
    pair val = generatePair();
    h.insertItem(val);
    itemIds[i] = val.first;
  }

  cout << "Before delete:" << endl;
  h.printTable();

  for(int i = 0; i < 25; i++) {
    h.removeItem(itemIds[i]);
  }

  cout << "\nAfter delete: " << endl;
  h.printTable();

  return 0;
}