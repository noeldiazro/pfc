import spidev

class mcp4802:
    '''This class controls the MCP4802 DAC'''
    def __init__(self):
        self.__spi = spidev.SpiDev()
        self.__spi.open(0,1)

    def set_dac_value(self, value):
        self.__spi.xfer2([(value//16)|0b10110000,(value%16)<<4])
