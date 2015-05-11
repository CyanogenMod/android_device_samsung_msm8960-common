#!/system/bin/sh

# prevent boot led from overriding charging led
if [ `cat /sys/class/sec/led/led_pattern` = "6" ]; then
    echo 0 > /sys/class/sec/led/led_pattern
fi

/system/bin/toolbox rm /data/RS*.log

/system/bin/toolbox ln -s "/data/data/com.android.providers.telephony/shared_prefs/preferred-apn1.xml" "/data/data/com.android.providers.telephony/shared_prefs/preferred-apn.xml"
