NAME = hotplug_monitor
VERSION = 1.0

all:

install:
	install -Dm 0644 hotplug_monitor.rules -t /etc/udev/rules.d
	install -Dm 0644 hotplug_monitor.service -t /lib/systemd/system
	install -Dm 0755 hotplug_monitor.sh -t /usr/local/bin

uninstall:
	rm -f /etc/udev/rules.d/hotplug_monitor.rules
	rm -f /lib/systemd/system/hotplug_monitor.service
	rm -f /usr/local/bin/hotplug_monitor.sh
