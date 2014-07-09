Peripheral
===

Here are all the peripherals for the CPU:

* DataMem Module
* Timer
* 32 Register File
* Instruction ROM
* I/O device, leds, switch, digits, UART

#### DamtaMem Module
This module serves as the memory, including all the data and peripherals. The address are allocated as following:

(0xXXXXXXXX <- sth. means read<br />
 0xXXXXXXXX -> sth. measn write)


* [0x00000000, 0x00000400) <-> Data Memory

* [0x40000000, 0x4000000C) <-> Timer <br />
  0x40000000 <-> TH <br />
  0x40000004 <-> TL <br />
  0x40000008 <-> [2:0]TCON <br />

* 0x4000000C <-> [7:0]LEDs

* 0x40000010 <- [7:0]SWITCH

* 0x40000014 <-> [11:0]DIGITS

* [0x40000018, 0x40000024) <-> UART <br />
  0x40000018 <-> [7:0]UART_TXD <br />
  0x4000001C <- [7:0]UART_RXD <br />
  0x40000020 <- [2:0]UART_CON; 0x40000020 -> TX_EN

All the implements are based on the requirement except the `UART_CON`, and here is the detail.

Instead of the original `UART_CON`, I set the `UART_CON` to 3 bits

* 0 bit: `TX_EN`, an impluse will tell the UART to send the data stored in `UART_TXD`(0x40000018)
* 1 bit: `RX_EFF`, 1 if the data in `UART_RXD`(0x4000001c) hasn't been read
* 2 bit: `TX_STATUS`, 1 if the UART_Sender is available

So in order to get some data from UART_RX, you should use a loop, here is an example in pseudo-code:

    while (true) {
      if (RX_EFF == 1) {
        READ_MEM(0x4000001c);
        break;
      }
    }

However, it is a little complicated to use the UART to send some data, and an example is always better than thousands of words:

    // first write the data to 0x40000018
    WRITE_MEM(0x40000018, DATA_TO_BE_SENT);
    while (true) {
      // check if the UART_Sender is available
      if (TX_STATIUS) {
        // tell teh UART to send the data
        WRITE_MEM(0X40000020, 1);
        break
      }
    }

####Timer Module

The Timer is used to generates break. During the break the CPU will stop executing the instruction of the user and jumps to some particular place in Instruction Memory. In this project the CPU will use the break to generates scanning signal to drive the digits.

####RegisterFile Module

Initialize the `$sp` to 0x3ffffffc.

####Instruction ROM Module

This module is waiting for more updates. Maybe we can use the assembler to generate the ROM automatically.

####I/O Devices

Nothing speciall. They are matched to some address in Peripheral Module.
