#!/bin/bash

sudo sed -i 's/^#LID_SLEEP=true/LID_SLEEP=true/g' /etc/default/acpi-support
