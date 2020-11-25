REM http://xuan-wu.com/2012-11-19-Arudino-Uno-Bootloader

SETLOCAL

SET COMPORT=COM13

cd /d "C:\Program Files (x86)\Arduino\hardware\tools\avr\bin"

avrdude -P %COMPORT% -b 19200 -c stk500v1 -p m328p -v -e -U efuse:w:0x05:m -U hfuse:w:0xD6:m -U lfuse:w:0xFF:m

avrdude -P %COMPORT% -b 19200 -c stk500v1 -p m328p -vvvv -e -U flash:w:optiboot_atmega328.hex -U lock:w:0x0F:m

ENDLOCAL