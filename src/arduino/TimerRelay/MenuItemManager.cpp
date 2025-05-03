#include "MenuItemManager.h"

MenuItem* MenuItemManager::items[MAX_ITEMS];
int MenuItemManager::itemCount = 0;

void MenuItemManager::initialize() {
    itemCount = 0;
}

MenuItem* MenuItemManager::createItem(const char* name, void (*action)()) {
    if (itemCount >= MAX_ITEMS) return nullptr;
    MenuItem* item = new MenuItem(name, action);
    items[itemCount++] = item;
    return item;
}

void MenuItemManager::cleanup() {
    for (int i = 0; i < itemCount; i++) {
        delete items[i];
    }
    itemCount = 0;
}