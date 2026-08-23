# Use -std=gnu99 & -std=gnu++11
set(CMAKE_C_STANDARD_COMPUTED_DEFAULT 99)
set(CMAKE_CXX_STANDARD_COMPUTED_DEFAULT 11)
set(C_EXTENSIONS ON)
set(CXX_EXTENSIONS ON)

add_compile_options(-DCore_V5F=1 -march=rv32imac_zba_zbb_zbc_zbs_xw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common)
add_link_options(-march=rv32imac_zba_zbb_zbc_zbs_xw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -T "${CMAKE_CURRENT_LIST_DIR}/V5F/Ld/Link_v5f.ld" -nostartfiles -Xlinker --gc-sections -Wl,-Map,"CH32H417QEU_V5F.map" --specs=nano.specs --specs=nosys.specs)

file(
	GLOB_RECURSE
	CH32H417_SDK_V5F_SRC_FILES
		${CMAKE_CURRENT_LIST_DIR}/HAL/Startup/startup_ch32h417_v5f.S
		${CMAKE_CURRENT_LIST_DIR}/HAL/**/*.c
		${CMAKE_CURRENT_LIST_DIR}/V5F/**/*.c
)
add_library(CH32H417_SDK_V5F STATIC ${CH32H417_SDK_V5F_SRC_FILES})
target_include_directories(
	CH32H417_SDK_V5F
	PUBLIC
		${CMAKE_CURRENT_LIST_DIR}/HAL/Debug
		${CMAKE_CURRENT_LIST_DIR}/HAL/Core
		${CMAKE_CURRENT_LIST_DIR}/HAL/Peripheral/inc
		${CMAKE_CURRENT_LIST_DIR}/HAL/Common
		${CMAKE_CURRENT_LIST_DIR}/V5F/User
)

# Use GCC for compiling this assembly source file
set_property(SOURCE ${CMAKE_CURRENT_LIST_DIR}/HAL/Startup/startup_ch32h417_v5f.S PROPERTY LANGUAGE C)
