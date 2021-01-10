SRCDIR := $(CURDIR)/src
KERNELDIR := /usr/src/linux/

ifneq ($(KERNELRELEASE),)
    obj-m := src/bossrc5.o
else
all:
	$(MAKE) -C $(KERNELDIR) M=$(shell pwd) modules
endif

clean:
	rm -rf $(SRCDIR)/*.o $(SRCDIR)/*.ko $(SRCDIR)/*.mod.c $(SRCDIR)/*.mod
	rm -rf $(SRCDIR)/.*.cmd
	rm -rf modules.order Module.symvers .modules.order.cmd .Module.symvers.cmd
