#! /usr/bin/env python3

import csv
import sys
import re

from dataclasses import dataclass
from collections import Counter

lib_name    = "Intel_FPGA"
part_name   = "EP2C5F484"

@dataclass
class Pin:
    bank:           str
    vrefb_group:    str
    pin_name_func:  str
    optional_func:  str
    config_func:    str
    f484_pin:       str
    f672_pin:       str
    dqs_x8_484:     str 
    dqs_x16_484:    str
    dqs_x8_672:     str
    dqs_x16_672:    str

    def pin_name(self):
        name = self.pin_name_func
        if self.config_func != '' and self.pin_name_func != self.config_func:
            name = name + "/" + self.config_func
        if self.optional_func != '' and self.optional_func != self.config_func:
            name = name + "/" + self.optional_func

        name = re.sub(r'\(\d+\)', '',name)

        return name

f484_col    = 5

pins = []


with open(sys.argv[1], newline='',encoding = "ISO-8859-1") as csvfile:
    data = csv.reader(csvfile, delimiter = '\t')

    for line_nr, row in enumerate(data):    
        if line_nr<4:
            continue
    
        #print(line_nr, len(row), ','.join(row), row[f484_col])

        if row[f484_col] == '':
            continue
        
    
        print(line_nr, len(row), ','.join(row), row[f484_col])
        bank, vrefb_group, pin_name_func, optional_func, config_func, f484_pin, f672_pin, dqs_x8_484, dqs_x16_484, dqs_x8_672, dqs_x16_672 = row[0:11]

        pin = Pin(bank, vrefb_group, pin_name_func, optional_func, config_func, f484_pin, f672_pin, dqs_x8_484, dqs_x16_484, dqs_x8_672, dqs_x16_672)

        pins.append(pin)

config_pins = (p for p in pins if p.config_func != '')
for p in config_pins:
    print(p)

with open(lib_name + ".symgen", "wt") as libfile:
    # Global defaults
    print(f"""
#
# Global Defaults
#
%lib {lib_name}
%fill back
%line 10
""", file=libfile)

    # FPGA
    print(f"""
COMP {part_name} U
DESC Altera FPGA
""", file=libfile)

    banks = sorted(Counter([pin.bank for pin in pins]))
    print(banks)

    for bank in banks:


        bank_pins = (p for p in pins if p.bank == bank)
        bank_pins = sorted(bank_pins, key=lambda p: p.pin_name())

        gnd_pins = sorted( (p for p in bank_pins if p.pin_name_func.startswith("GND")), key=lambda p: p.pin_name_func)
        vcc_pins = sorted( (p for p in bank_pins if p.pin_name_func.startswith("VCC")), key=lambda p: p.pin_name_func)

        config_pins = list((p for p in bank_pins if p.config_func != ''))
    
        if bank != '':
            print(f"""UNIT WIDTH 2000 LABEL {bank}""", file=libfile)
        else:
            print(f"""UNIT WIDTH 2000""", file=libfile)

        prev_pin = vcc_pins[0].pin_name_func
        for pin in vcc_pins:
            if pin.pin_name_func != prev_pin:
                print(f"""SPC L""", file=libfile)
            print(f"""{pin.f484_pin} {pin.pin_name()} PI L""", file=libfile)
            prev_pin = pin.pin_name_func

        for pin in gnd_pins:
            if pin.pin_name_func != prev_pin:
                print(f"""SPC L""", file=libfile)
            print(f"""{pin.f484_pin} {pin.pin_name()} PI L""", file=libfile)
            prev_pin = pin.pin_name_func
        
        if len(gnd_pins) > 0:
            print(f"""SPC L""", file=libfile)

        for pin in config_pins:
            print(f"""{pin.f484_pin} {pin.pin_name()} B L""", file=libfile)

        for pin in bank_pins:
            if pin in gnd_pins + vcc_pins + config_pins:
                continue
            print(f"""{pin.f484_pin} {pin.pin_name()} B L""", file=libfile)


    print(f"""
END
""", file=libfile)

