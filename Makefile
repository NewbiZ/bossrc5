SRCDIR := $(CURDIR)/src
ifneq ($(KERNELRELEASE),)
    obj-m := src/driver.o
else
    KERN_DIR ?= /usr/src/linux/
    PWD := $(shell pwd)
default:
	$(MAKE) -C $(KERN_DIR) M=$(PWD) modules
endif

clean:
	rm -rf \
		$(SRCDIR)/*.o \
		$(SRCDIR)/*.ko \
		$(SRCDIR)/*.mod.c \
		$(SRCDIR)/*.mod
	rm -rf \
		modules.order \
		Module.symvers \
		.modules.order.cmd \
		.Module.symvers.cmd
