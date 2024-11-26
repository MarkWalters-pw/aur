function(declare_shared_library NAME LIB)
	add_library(${NAME} INTERFACE)
	set_property(TARGET ${NAME} PROPERTIES INTERFACE_LINK_LIBRARIES ${LIB})
	target_include_directories(${NAME} SYSTEM INTERFACE ${ARGN})
endfunction()

set(ebus_sdk_MAJOR_VERSION 3)
set(ebus_sdk_MINOR_VERSION 1)
set(ebus_sdk_PATCH_VERSION 14)
set(ebus_sdk_VERSION ${ebus_sdk_MAJOR_VERSION}.${ebus_sdk_MINOR_VERSION}.${ebus_sdk_PATCH_VERSION})

set(ebus_sdk_INCLUDE_DIRS "/opt/ebus-sdk/include")

declare_shared_library(ebus-sdk::base            "/opt/ebus-sdk/lib/libPvBase.so"              ${ebus_sdk_INCLUDE_DIRS})
declare_shared_library(ebus-sdk::buffer          "/opt/ebus-sdk/lib/libPvBuffer.so"            ${ebus_sdk_INCLUDE_DIRS})
declare_shared_library(ebus-sdk::converters      "/opt/ebus-sdk/lib/libPtConvertersLib.so"     ${ebus_sdk_INCLUDE_DIRS})
declare_shared_library(ebus-sdk::device          "/opt/ebus-sdk/lib/libPvDevice.so"            ${ebus_sdk_INCLUDE_DIRS})
declare_shared_library(ebus-sdk::gui             "/opt/ebus-sdk/lib/libPvGUI.so"               ${ebus_sdk_INCLUDE_DIRS})
declare_shared_library(ebus-sdk::gui-utils       "/opt/ebus-sdk/lib/libPvGUIUtils.so"          ${ebus_sdk_INCLUDE_DIRS})
declare_shared_library(ebus-sdk::network         "/opt/ebus-sdk/lib/libEbNetworkLib.so"        ${ebus_sdk_INCLUDE_DIRS})
declare_shared_library(ebus-sdk::persistence     "/opt/ebus-sdk/lib/libPvPersistence.so"       ${ebus_sdk_INCLUDE_DIRS})
declare_shared_library(ebus-sdk::serial          "/opt/ebus-sdk/lib/libPvSerial.so"            ${ebus_sdk_INCLUDE_DIRS})
declare_shared_library(ebus-sdk::stream          "/opt/ebus-sdk/lib/libPvStream.so"            ${ebus_sdk_INCLUDE_DIRS})
declare_shared_library(ebus-sdk::stream-raw      "/opt/ebus-sdk/lib/libPvStreamRaw.so"         ${ebus_sdk_INCLUDE_DIRS})
declare_shared_library(ebus-sdk::transmitter-raw "/opt/ebus-sdk/lib/libPvTransmitterRaw.so"    ${ebus_sdk_INCLUDE_DIRS})
declare_shared_library(ebus-sdk::transport-layer "/opt/ebus-sdk/lib/libEbTransportLayerLib.so" ${ebus_sdk_INCLUDE_DIRS})
declare_shared_library(ebus-sdk::utils           "/opt/ebus-sdk/lib/libPtUtilsLib.so"          ${ebus_sdk_INCLUDE_DIRS})
declare_shared_library(ebus-sdk::virtual-device  "/opt/ebus-sdk/lib/libPvVirtualDevice.so"     ${ebus_sdk_INCLUDE_DIRS})