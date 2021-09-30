// Jeff Caldwell
// CS 3311
// Assignment 02

#include <iostream>
#include <string>
#include <list>
#include <iterator>

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
    pair<int, string> findItem(int id);
    
    void printItem(pair<int, string> it);
    void printTable();
};

/**
 * @brief Checks whether table member contains elements
 * 
 * @return true 
 * @return false 
 */
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

/**
 * @brief Simple mod hash function that returns the
 *        last digit of a given integer
 * 
 * @param id 
 * @return int 
 */
int HashTable::hashFunction(int id) {
  return (id % buckets);
}

/**
 * @brief Creates and inserts a pair into the table into
 *        the "row" that coincides with the hash
 *        of the item's ID
 * 
 * @param id 
 * @param tg 
 */
void HashTable::insertItem(int id, string tg) {
  int index = hashFunction(id);
  pair<int, string> item;
  item.first = id;
  item.second = tg;
  table[index].push_back(item);
}


/**
 * @brief Inserts a given pair into the hashtable
 * 
 * @param val 
 */
void HashTable::insertItem(pair<int, string> val) {
  insertItem(val.first, val.second);
}


/**
 * @brief Removes item whose ID matches the given ID
 * 
 * @param id 
 */
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

/**
 * @brief Returns a pair whose ID matches the given ID
 * 
 * @param id 
 * @return pair<int, string> 
 */
pair<int, string> HashTable::findItem(int id) {
  int index = hashFunction(id);
  list<pair<int, string> >::iterator i;
  pair<int, string> myRec;

  for(i = table[index].begin(); i != table[index].end(); i++) {
    if(i->first == id) {
      myRec.first = i->first;
      myRec.second = i->second;
    }
  }
    return myRec;
}

/**
 * @brief Simple print function for an item in the table
 * 
 * @param it  the item to print
 */
void HashTable::printItem(pair<int, string> it) {
  cout << "{" << it.first << ", " << it.second << "}" << endl;
}


/**
 * @brief Prints the whole table
 * 
 */
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

// Driver/test code
int main(int argc, const char** argv) {
  HashTable h;

  if(h.isEmpty()) {
    cout << "\nTable empty. Beginning insertion." << endl;
  } else {
    cout << "\nTable not empty. There's a problem!." << endl;
  }

  h.insertItem(110, "XYZ");
  h.insertItem(121, "ABC");
  h.insertItem(221, "DEF");
  h.insertItem(222, "HJK");
  h.insertItem(333, "FUI");
  h.insertItem(444, "RYU");
  h.insertItem(555, "ODU");
  h.insertItem(556, "GHI");
  h.insertItem(666, "JKL");
  h.insertItem(777, "ERW");
  h.insertItem(888, "UTI");
  h.insertItem(999, "FDH");

  cout << "\nFull Table: " << endl;
  h.printTable();

  cout << "\nItems with colliding IDs: " << endl;

  h.printItem(h.findItem(121));
  h.printItem(h.findItem(221));
  h.printItem(h.findItem(556));
  h.printItem(h.findItem(666));

  cout << "\nRemoving items with colliding IDs 121 & 556" << endl;

  h.removeItem(121);
  h.removeItem(556);

  cout << "\nItems after removal of one colliding item: " << endl;
  h.printItem(h.findItem(666));
  h.printItem(h.findItem(221));

  cout << "\nTable after colliding item removal: " << endl;
  h.printTable();

  if(!h.isEmpty()) {
    cout << "\nTable not empty. Operations successful." << endl;
  } else {
    cout << "\nTable empty. There's a problem!" << endl;
  }

  return 0;
}