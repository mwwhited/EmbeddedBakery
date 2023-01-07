#include "Encoding.h"

static long Encoding::BCD2Long(long bcd) {
  return
    (bcd & 0x0f) +
    (bcd >> 4 & 0x0f) * 10 +
    (bcd >> 8 & 0x0f) * 100 +
    (bcd >> 12 & 0x0f) * 1000 +
    (bcd >> 16 & 0x0f) * 10000 +
    (bcd >> 20 & 0x0f) * 100000 +
    (bcd >> 24 & 0x0f) * 1000000 +
    (bcd >> 28 & 0x0f) * 10000000
    ;
}

static long Encoding::Long2BCD(long digit) {
  return 
    (((digit / 10000000) % 10) << 28) |
    (((digit / 1000000) % 10) << 24) |
    (((digit / 100000) % 10) << 20) |
    (((digit / 10000) % 10) << 16) |
    (((digit / 1000) % 10) << 12) |
    (((digit / 100) % 10) << 8) |
    (((digit / 10) % 10) << 4) |
    (digit % 10);
}
