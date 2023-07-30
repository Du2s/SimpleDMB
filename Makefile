TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SimpleDMB

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = SimpleDMB

SimpleDMB_FILES = main.m DMBAppDelegate.m DMBRootViewController.m
SimpleDMB_FRAMEWORKS = UIKit CoreGraphics
SimpleDMB_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/application.mk
