//
//  main.c
//  Snippet2
//
//  Created by Bradley Ross on 2/23/21.
//

#include <stdio.h>
void recurse(int i);
int main(int argc, const char * argv[]) {
    // insert code here...
    recurse(10);
    printf("Hello, World!\n");
    return 0;
}
void recurse(int i) {
    int j;
    if (i == 10){
        j = 10;
        printf("i %d j %d \n", i, j);
        recurse(i-1);
    } else {
    if (i == 0) {
        return;
    } else {
        j = j * i;
        printf("i %d j %d \n", i, j);
            recurse(i-1);
    }
   
    }
    
}
