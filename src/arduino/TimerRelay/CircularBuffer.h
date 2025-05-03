#ifndef CIRCULAR_BUFFER_H
#define CIRCULAR_BUFFER_H

template<typename T, int Size>
class CircularBuffer {
private:
    T buffer[Size];
    int head = 0;
    int tail = 0;
    bool full = false;

public:
    void push(const T& item) {
        buffer[head] = item;
        head = (head + 1) % Size;
        if (head == tail) {
            full = true;
            tail = (tail + 1) % Size;
        }
    }

    bool pop(T& item) {
        if (isEmpty()) {
            return false;
        }
        item = buffer[tail];
        tail = (tail + 1) % Size;
        full = false;
        return true;
    }

    T peek(int offset = 0) const {
        if (isEmpty() || offset >= size()) {
            return T();
        }
        return buffer[(tail + offset) % Size];
    }

    bool isEmpty() const {
        return !full && (head == tail);
    }

    bool isFull() const {
        return full;
    }

    int size() const {
        if (full) return Size;
        if (head >= tail) return head - tail;
        return Size + head - tail;
    }

    void clear() {
        head = tail = 0;
        full = false;
    }
};

#endif