#include "Menu.h"
#include "Settings.h"
#include "RelayManager.h"
#include "MenuItemManager.h"
#include "SystemInfo.h"
#include <Arduino.h>

static Relay* selectedRelay = nullptr;
static char displayBuffer[17];  // For formatted display strings

static void updateTimeoutDisplay(Display& display) {
    if (selectedRelay) {
        snprintf(displayBuffer, sizeof(displayBuffer), "Timeout: %lus", selectedRelay->timeout / 1000UL);
        display.showMessage("Set Timeout", displayBuffer);
    }
}

static void updateDebounceDisplay(Display& display) {
    if (selectedRelay) {
        snprintf(displayBuffer, sizeof(displayBuffer), "Debounce: %lums", selectedRelay->debounce);
        display.showMessage("Set Debounce", displayBuffer);
    }
}

// Updated action handlers with display feedback
static void increaseTimeout(Display& display) {
    if (selectedRelay) {
        selectedRelay->timeout = min(selectedRelay->timeout + 30000UL, Settings::getMaxTimeout());
        settingsChanged = true;
        updateTimeoutDisplay(display);
    }
}

static void decreaseTimeout(Display& display) {
    if (selectedRelay) {
        selectedRelay->timeout = max(selectedRelay->timeout - 30000UL, 30000UL);
        settingsChanged = true;
        updateTimeoutDisplay(display);
    }
}

static void increaseDebounce(Display& display) {
    if (selectedRelay) {
        selectedRelay->debounce = min(selectedRelay->debounce + 10, Settings::getMaxDebounce());
        settingsChanged = true;
        updateDebounceDisplay(display);
    }
}

static void decreaseDebounce(Display& display) {
    if (selectedRelay) {
        selectedRelay->debounce = max(selectedRelay->debounce - 10, Settings::getMinDebounce());
        settingsChanged = true;
        updateDebounceDisplay(display);
    }
}

static void selectRelay(Relay& relay, Display& display) {
    selectedRelay = &relay;
    snprintf(displayBuffer, sizeof(displayBuffer), "%s Selected", relay.name);
    display.showMessage("Relay", displayBuffer);
}

// Updated menu action handlers
static void selectBlueRelay(Display& display) { selectRelay(relays[BLUE], display); }
static void selectGreenRelay(Display& display) { selectRelay(relays[GREEN], display); }
static void selectYellowRelay(Display& display) { selectRelay(relays[YELLOW], display); }
static void selectRedRelay(Display& display) { selectRelay(relays[RED], display); }

static void toggleLogging(Display& display) {
    Settings::setLoggingEnabled(!Settings::getLoggingEnabled());
    display.showMessage("Logging", Settings::getLoggingEnabled() ? "Enabled" : "Disabled");
}

static void toggleDebug(Display& display) {
    Settings::setDebugEnabled(!Settings::getDebugEnabled());
    display.showMessage("Debug", Settings::getDebugEnabled() ? "Enabled" : "Disabled");
}

static void saveSettings(Display& display) {
    Settings::save();
    display.showMessage("Settings", "Saved!");
}

static void resetSettings(Display& display) {
    Settings::reset();
    display.showMessage("Settings", "Reset!");
}

static void showUptime(Display& display) {
    char buffer[17];
    unsigned long uptime = SystemInfo::getUptime();
    unsigned long hours = uptime / 3600;
    unsigned long minutes = (uptime % 3600) / 60;
    unsigned long seconds = uptime % 60;
    snprintf(buffer, sizeof(buffer), "%02lu:%02lu:%02lu", hours, minutes, seconds);
    display.showMessage("Uptime", buffer);
}

static void showMemory(Display& display) {
    char buffer[17];
    snprintf(buffer, sizeof(buffer), "%lu bytes", SystemInfo::getFreeMemory());
    display.showMessage("Free Memory", buffer);
}

static void showCPULoad(Display& display) {
    char buffer[17];
    snprintf(buffer, sizeof(buffer), "%.1f%%", SystemInfo::getCPULoad());
    display.showMessage("CPU Load", buffer);
}

static void resetSystemStats(Display& display) {
    SystemInfo::resetStats();
    display.showMessage("System Stats", "Reset");
}

Menu::Menu(Display& d) : display(d), root(nullptr), current(nullptr), active(false) {
    MenuItemManager::initialize();
    buildMenu();
}

Menu::~Menu() {
    MenuItemManager::cleanup();
}

void Menu::buildMenu() {
    // Create main menu items
    root = MenuItemManager::createItem("Main Menu");
    MenuItem* settings = MenuItemManager::createItem("Settings");
    MenuItem* relays = MenuItemManager::createItem("Relays");
    MenuItem* system = MenuItemManager::createItem("System");
    
    // Create settings submenu
    MenuItem* logging = MenuItemManager::createItem("Toggle Logging", [this]() { toggleLogging(display); });
    MenuItem* debug = MenuItemManager::createItem("Toggle Debug", [this]() { toggleDebug(display); });
    MenuItem* save = MenuItemManager::createItem("Save Settings", [this]() { saveSettings(display); });
    MenuItem* reset = MenuItemManager::createItem("Reset Settings", [this]() { resetSettings(display); });
    
    // Create relay submenu
    MenuItem* blue = MenuItemManager::createItem("Blue Relay", [this]() { selectBlueRelay(display); });
    MenuItem* green = MenuItemManager::createItem("Green Relay", [this]() { selectGreenRelay(display); });
    MenuItem* yellow = MenuItemManager::createItem("Yellow Relay", [this]() { selectYellowRelay(display); });
    MenuItem* red = MenuItemManager::createItem("Red Relay", [this]() { selectRedRelay(display); });
    
    // Create relay config submenu
    MenuItem* timeout = MenuItemManager::createItem("Timeout");
    MenuItem* incTimeout = MenuItemManager::createItem("Inc Timeout", [this]() { increaseTimeout(display); });
    MenuItem* decTimeout = MenuItemManager::createItem("Dec Timeout", [this]() { decreaseTimeout(display); });
    MenuItem* debounce = MenuItemManager::createItem("Debounce");
    MenuItem* incDebounce = MenuItemManager::createItem("Inc Debounce", [this]() { increaseDebounce(display); });
    MenuItem* decDebounce = MenuItemManager::createItem("Dec Debounce", [this]() { decreaseDebounce(display); });
    
    // Link main menu items
    root->child = settings;
    settings->next = relays;
    relays->next = system;
    system->prev = relays;
    relays->prev = settings;
    
    // Link settings submenu
    settings->child = logging;
    logging->next = debug;
    debug->next = save;
    save->next = reset;
    reset->prev = save;
    save->prev = debug;
    debug->prev = logging;
    
    // Link relay submenu
    relays->child = blue;
    blue->next = green;
    green->next = yellow;
    yellow->next = red;
    red->prev = yellow;
    yellow->prev = green;
    green->prev = blue;
    
    // Link relay config items
    blue->child = timeout;
    timeout->next = debounce;
    debounce->prev = timeout;
    
    timeout->child = incTimeout;
    incTimeout->next = decTimeout;
    decTimeout->prev = incTimeout;
    
    debounce->child = incDebounce;
    incDebounce->next = decDebounce;
    decDebounce->prev = incDebounce;
    
    // Link system submenu
    system->child = uptime;
    uptime->next = memory;
    memory->next = cpuLoad;
    cpuLoad->next = resetStats;
    resetStats->prev = cpuLoad;
    cpuLoad->prev = memory;
    memory->prev = uptime;

    // Set parent relationships
    settings->parent = root;
    relays->parent = root;
    system->parent = root;
    
    logging->parent = settings;
    debug->parent = settings;
    save->parent = settings;
    reset->parent = settings;
    
    blue->parent = relays;
    green->parent = relays;
    yellow->parent = relays;
    red->parent = relays;
    
    timeout->parent = blue;
    debounce->parent = blue;
    
    incTimeout->parent = timeout;
    decTimeout->parent = timeout;
    incDebounce->parent = debounce;
    decDebounce->parent = debounce;

    uptime->parent = system;
    memory->parent = system;
    cpuLoad->parent = system;
    resetStats->parent = system;
    
    current = root;
}

void Menu::handleAction(MenuAction action) {
    switch (action) {
        case ENTER_MENU:
            active = true;
            current = root;
            break;
            
        case EXIT_MENU:
            active = false;
            current = root;
            break;
            
        case NEXT_ITEM:
            if (current->next) current = current->next;
            break;
            
        case PREV_ITEM:
            if (current->prev) current = current->prev;
            break;
            
        case SELECT_ITEM:
            if (current->child) {
                current = current->child;
            } else if (current->action) {
                executeAction();
            }
            break;
            
        case CHANGE_VALUE:
            if (current->action) executeAction();
            break;
            
        default:
            break;
    }
    
    show();
}

void Menu::show() {
    if (!active) return;
    showCurrentItem();
}

void Menu::executeAction() {
    if (current->action) {
        current->action();
    }
}

void Menu::showCurrentItem() {
    const char* parentName = current->parent ? current->parent->name : "";
    display.showMessage(parentName, current->name);
}