Peripheral
===

This file contains all the peripherals, including the RAM, ROM, UART, LEDs, Switch, etc.

Notice that I have changed the UART peripheral. The `UART_CON` now only contains 3bit, and programmer can only modify the 0 bit, which is the `TX_EN` to tell the UART module to send the data.

And if the program want to send some data by UART, it should use a loop to check if the `UART_Sender` module is available.

It's kind fo messy and now the CPU can "see" the UART, but I haven't found any other good idea...
