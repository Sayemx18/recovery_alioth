#!/system/bin/sh
# set some props, depending on device

load_CN()
{
    resetprop "ro.product.model" "K40S"
    resetprop "ro.product.odm.model" "K40S"
    resetprop "ro.product.system.model" "K40S"
    resetprop "ro.product.vendor.model" "K40S"
    resetprop "ro.product.system_ext.model" "K40S"
    resetprop "ro.product.product.model" "K40S"
    resetprop "ro.product.brand" "Xiaomi"
    resetprop "ro.product.odm.brand" "Xiaomi"
    resetprop "ro.product.system.brand" "Xiaomi"
    resetprop "ro.product.system_ext.brand" "Xiaomi"
    resetprop "ro.product.product.brand" "Xiaomi"
    resetprop "ro.product.vendor.brand" "Xiaomi"
}

load_global()
{
    resetprop "ro.product.model" "F4"
    resetprop "ro.product.odm.model" "F4"
    resetprop "ro.product.system.model" "F4"
    resetprop "ro.product.vendor.model" "F4"
    resetprop "ro.product.system_ext.model" "F4"
    resetprop "ro.product.product.model" "F4"
    resetprop "ro.product.brand" "POCO"
    resetprop "ro.product.odm.brand" "POCO"
    resetprop "ro.product.system.brand" "POCO"
    resetprop "ro.product.system_ext.brand" "POCO"
    resetprop "ro.product.product.brand" "POCO"
    resetprop "ro.product.vendor.brand" "POCO"
}

variant=$(getprop ro.boot.hwc)
echo $variant

case $variant in
    "CN")
        load_CN;
        ;;
    *)
        load_global;
        ;;
esac

exit 0
#
