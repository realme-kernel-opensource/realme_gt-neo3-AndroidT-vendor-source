LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := bt_drv_$(BT_PLATFORM).ko
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_OWNER := mtk
LOCAL_INIT_RC := init.bt_drv.rc
LOCAL_REQUIRED_MODULES := wmt_drv.ko
include $(MTK_KERNEL_MODULE)

BT_OPTS := BT_PLATFORM=$(BT_PLATFORM) LOG_TAG=$(LOG_TAG)
#ifeq ($(BT_PLATFORM), $(filter $(BT_PLATFORM), 6873 6853 6833))
#  BT_OPTS += CFG_BT_PM_QOS_CONTROL=y
#endif
$(info $(LOG_TAG) BT_OPTS = $(BT_OPTS))
ifeq ($(MTK_BT_CHIP), $(filter $(MTK_BT_CHIP), MTK_CONSYS_MT6761 MTK_CONSYS_MT6765 MTK_CONSYS_MT6768 MTK_CONSYS_MT6779 MTK_CONSYS_MT6785 MTK_CONSYS_MT6853 MTK_CONSYS_MT6873 MTK_CONSYS_MT6833 MTK_CONSYS_MT6781 MTK_CONSYS_MT6855 MTK_CONSYS_MT6789))
  BT_OPTS += BT_ENABLE_LOW_POWER_DEBUG=y
endif
$(linked_module): OPTS += $(BT_OPTS)


