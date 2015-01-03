#!/bin/bash
cd proprietary/system
echo '# GApps dependencies'
echo 'PRODUCT_COPY_FILES += \'

for file in $(find -name "*" -type f); do

	echo vendor/google/products/proprietary/system$file:system$file':google \'
done
echo
echo 'PRODUCT_PACKAGES += \'

for file in $(find -name "*.apk" -type f); do
	apk_name=$(basename $file)
	module_name=${apk_name//\.apk/}
	echo $module_name' \'
done
cd ../..
