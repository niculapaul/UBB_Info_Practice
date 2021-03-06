package Model.Utils;

import java.util.Stack;

public interface IStack<T> {
    void push(T elem);
    T pop();
    boolean isEmpty();
    T peek();
    String toString();
    Stack<T> getStack();
    void clear();
}
