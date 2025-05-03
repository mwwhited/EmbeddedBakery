#ifndef MENU_ITEM_MANAGER_H
#define MENU_ITEM_MANAGER_H

#include "Menu.h"

class MenuItemManager {
public:
    static void initialize();
    static MenuItem* createItem(const char* name, void (*action)() = nullptr);
    static void cleanup();
    
private:
    static const int MAX_ITEMS = 32;
    static MenuItem* items[MAX_ITEMS];
    static int itemCount;
};