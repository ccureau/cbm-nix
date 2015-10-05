#include "tty.h"

void main() {
  unsigned char i;

  for (i=1; i<255; ++i) {
    tty_putc('#');
  }
}
