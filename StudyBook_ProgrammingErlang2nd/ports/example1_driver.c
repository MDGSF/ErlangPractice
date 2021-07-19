#include <stdio.h>
#include <stdlib.h>

typedef unsigned char byte;

int read_cmd(byte *buf);
int write_cmd(byte *buf, int len);
int sum(int x, int y);
int twice(int x);

int main() {
  byte buff[100] = {0};
  while (read_cmd(buff) > 0) {
    int fn = buff[0];
    int result = 0;

    if (fn == 1) {
      int arg1 = buff[1];
      int arg2 = buff[2];
      result = sum(arg1, arg2);
    } else if (fn == 2) {
      arg1 = buff[1];
      result = twice(arg1);
    } else {
      exit(EXIT_FAILURE);
    }

    buff[0] = result;
    write_cmd(buff, 1);
  }
  return 0;
}
