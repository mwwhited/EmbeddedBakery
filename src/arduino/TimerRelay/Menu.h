#ifndef MENU_H
#define MENU_H

#include "Display.h"
#include <Arduino.h>

enum MenuAction {
    NO_ACTION,
    ENTER_MENU,
    EXIT_MENU,
    NEXT_ITEM,
    PREV_ITEM,
    SELECT_ITEM,
    CHANGE_VALUE
};

class MenuItem {
public:
    const char* name;
    void (*action)();
    MenuItem* next;
    MenuItem* prev;
    MenuItem* parent;
    MenuItem* child;
    
    MenuItem(const char* n, void (*a)() = nullptr) 
        : name(n), action(a), next(nullptr), prev(nullptr), parent(nullptr), child(nullptr) {}
};

class Menu {
public:
    Menu(Display& display);
    ~Menu();
    void handleAction(MenuAction action);
    void show();
    bool isActive() const { return active; }
    
private:
    Display& display;
    MenuItem* root;
    MenuItem* current;
    bool active;
    
    void buildMenu();
    void executeAction();
    void showCurrentItem();
};

#endif // MENU_H