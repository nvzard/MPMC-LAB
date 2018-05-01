#include<stdio.h>
#include<stdlib.h>

int main(){

    int SENSOR1[] = {110, 115, 114, 105, 120};
    int temp, hum;
    printf("Processing data from SENSOR1...\n");

    for(int i=0; i<5; i++){
        temp = (SENSOR1[i]/2) - 10;
        hum = (SENSOR1[i]/3);
        printf("DATA: %d\n", SENSOR1[i]);
        printf("TEMP: %d degree C\tHUMIDITY:%d percent\n\n", temp, hum);
    }

    return 0;
}
