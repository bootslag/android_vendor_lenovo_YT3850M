#!/system/bin/sh
# Copyright (c) 2013, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

LOG_TAG="install-app"
LOG_NAME="${0}:"

loge ()
{
  /system/bin/log -t $LOG_TAG -p e "$LOG_NAME $@"
}

logi ()
{
  /system/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
}
ANYSHARE_FLAG_ROW=$(getprop persist.sys.anyshare_row)
ANYSHARE_FLAG_PRC=$(getprop persist.sys.anyshare_prc)
YAHOO_FLAG=$(getprop persist.sys.yahoo_install)
NETFLIX_FLAG=$(getprop persist.sys.netflix_install)
MCAFEE_FLAG=$(getprop persist.sys.mcafee_install)
FASKAREN_FLAG=$(getprop persist.sys.faskaren_install)
UNEXT_FLAG=$(getprop persist.sys.unext_install)
ZHUYINIME_FLAG=$(getprop persist.sys.zhuyinIME_install)
LENOVOMGR_FLAG=$(getprop persist.sys.lenovomgr_install)
LENOVOSERVICE_FLAG=$(getprop persist.sys.lservice_install)
LENOVOMALL_FLAG=$(getprop persist.sys.lenovomall_install)
LENOVOGAME_FLAG=$(getprop persist.sys.lenovogame_install)
SOGOUINPUT_FLAG=$(getprop persist.sys.sogouinput_install)
AMAP_FLAG=$(getprop persist.sys.amap_install)
COUNTRY=$(getprop ro.product.countrycode)
# copy system pre-install app to /data/app/
if [ 0 -eq $ANYSHARE_FLAG_ROW ]; then
	setprop persist.sys.anyshare_row 1
    busybox cp /system/pre-install/AnyShare-Lenovo-Pad-ROW-2.6.33_HD.apk /data/app/AnyShare-Lenovo-Pad-ROW-2.6.33_HD.apk
    busybox chmod 0644 /data/app/AnyShare-Lenovo-Pad-ROW-2.6.33_HD.apk
	logi "copy AnyShare app to data/app ok"
fi

if [ 0 -eq $ANYSHARE_FLAG_PRC ]; then
	setprop persist.sys.anyshare_prc 1
    busybox cp /system/pre-install/AnyShare-Lenovo-Pad-BUPRELOAD-2.6.33_HD.apk /data/app/AnyShare-Lenovo-Pad-BUPRELOAD-2.6.33_HD.apk 
    busybox chmod 0644 /data/app/AnyShare-Lenovo-Pad-BUPRELOAD-2.6.33_HD.apk
	logi "copy AnyShare app to data/app ok"
fi

if [ 0 -eq $LENOVOMGR_FLAG ]; then
	setprop persist.sys.lenovomgr_install 1
    busybox cp /system/pre-install/LenovoPhonemgr_1219.apk /data/app/LenovoPhonemgr_1219.apk 
    busybox chmod 0644 /data/app/LenovoPhonemgr_1219.apk
	logi "copy lenovomgr app to data/app ok"
fi

if [ 0 -eq $LENOVOSERVICE_FLAG ]; then
	setprop persist.sys.lservice_install 1
    busybox cp /system/pre-install/LenovoServiceV3.3.5_preload_1219.apk /data/app/LenovoServiceV3.3.5_preload_1219.apk 
    busybox chmod 0644 /data/app/LenovoServiceV3.3.5_preload_1219.apk
	logi "copy lenovoservice app to data/app ok"
fi

if [ 0 -eq $LENOVOMALL_FLAG ]; then
	setprop persist.sys.lenovomall_install 1
    busybox cp /system/pre-install/LenovoMallPad_1221.apk /data/app/LenovoMallPad_1221.apk 
    busybox chmod 0644 /data/app/LenovoMallPad_1221.apk
	logi "copy lenovomall app to data/app ok"
fi

if [ 0 -eq $SOGOUINPUT_FLAG ]; then
	setprop persist.sys.sogouinput_install 1
    busybox cp /system/pre-install/SogouInput_Build__20160510_android_oem_lenovo.apk /data/app/SogouInput_Build__20160510_android_oem_lenovo.apk 
    busybox chmod 0644 /data/app/SogouInput_Build__20160510_android_oem_lenovo.apk
	logi "copy sogouinput app to data/app ok"
fi

if [ 0 -eq $AMAP_FLAG ]; then
	setprop persist.sys.amap_install 1
    busybox cp /system/pre-install/amap_7.2.3.S012_Lenovo_C01110001008.apk /data/app/amap_7.2.3.S012_Lenovo_C01110001008.apk 
    busybox chmod 0644 /data/app/amap_7.2.3.S012_Lenovo_C01110001008.apk
	logi "copy amap app to data/app ok"
fi

if [ "$COUNTRY" = "JP" ]; then
	if [ 0 -eq $YAHOO_FLAG ]; then
		setprop persist.sys.yahoo_install 1
		busybox cp /system/pre-install/YJTop_v10.1.14_lenovo_2015oct-release.apk /data/app/YJTop_v10.1.14_lenovo_2015oct-release.apk
		busybox chmod 0644 /data/app/YJTop_v10.1.14_lenovo_2015oct-release.apk
		logi "copy Yahoo app to data/app ok"
	fi
fi

if [ "$COUNTRY" = "TW" ] || [ "$COUNTRY" = "HK" ]; then
	if [ 0 -eq $ZHUYINIME_FLAG ]; then
		setprop persist.sys.zhuyinIME_install 1
		busybox cp /system/pre-install/signed-ZhuyinIME-arm-2.1.1.81390282-API_14.apk /data/app/signed-ZhuyinIME-arm-2.1.1.81390282-API_14.apk
		busybox chmod 0644 /data/app/signed-ZhuyinIME-arm-2.1.1.81390282-API_14.apk
		logi "copy Yahoo app to data/app ok"
	fi
fi

if [ 0 -eq $NETFLIX_FLAG ]; then
	setprop persist.sys.netflix_install 1
    busybox cp /system/pre-install/netflix-3.14-100-5440-release.apk /data/app/netflix-3.14-100-5440-release.apk 
    busybox chmod 0644 /data/app/netflix-3.14-100-5440-release.apk
	logi "copy Netflix app to data/app ok"
fi

if [ 0 -eq $MCAFEE_FLAG ]; then
	setprop persist.sys.mcafee_install 1
    busybox cp /system/pre-install/MMS_Dbuild.type_Release.apk /data/app/MMS_Dbuild.type_Release.apk 
    busybox chmod 0644 /data/app/MMS_Dbuild.type_Release.apk
	logi "copy MCAfee app to data/app ok"
fi

if [ "$COUNTRY" = "JP" ]; then
	if [ 0 -eq $FASKAREN_FLAG ]; then
		setprop persist.sys.faskaren_install 1
		busybox cp /system/pre-install/FSKAREN.apk /data/app/FSKAREN.apk 
		busybox chmod 0644 /data/app/FSKAREN.apk
		logi "copy FSKAREN app to data/app ok"
	fi

	if [ 0 -eq $UNEXT_FLAG ]; then
		setprop persist.sys.unext_install 1
		busybox cp /system/pre-install/U-NEXT.apk /data/app/U-NEXT.apk 
		busybox chmod 0644 /data/app/U-NEXT.apk
		logi "copy U-NEXT app to data/app ok"
	fi
fi

if [ "$COUNTRY" = "RU" ]; then	
		busybox rm -rf /data/app/ES_File_Explorer_3.2.5_oem_c35adcd.apk
		busybox rm -rf /data/app/netflix-3.14-100-5440-release.apk
		busybox rm -rf /system/pre-install/netflix-3.14-100-5440-release.apk
		busybox rm -rf /data/app/SYNTit_icon_1.1.28.apk
fi

		busybox rm -rf /data/app/GameWorld.apk
		busybox rm -rf /system/pre-install/GameWorld.apk



