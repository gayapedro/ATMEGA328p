To compile:

```zsh
avra blink.asm
```

To send to ATMEGA:

```zsh
sudo avrdude -p m328p -c stk500v1 -b 115200 -P /dev/ttyUSB0 -U flash:w:blink.hex
```
