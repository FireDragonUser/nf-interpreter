#
# Copyright (c) .NET Foundation and Contributors
# See LICENSE file in the project root for full license information.
#

# set include directories
list(APPEND STM32H7_CubePackage_INCLUDE_DIRS ${CMAKE_BINARY_DIR}/STM32H7_CubePackage_Source/Drivers/CMSIS/Device/ST/STM32H7xx/Include)
list(APPEND STM32H7_CubePackage_INCLUDE_DIRS ${CMAKE_BINARY_DIR}/STM32H7_CubePackage_Source/Drivers/STM32H7xx_HAL_Driver/Inc)

# source files
set(STM32H7_CubePackage_SRCS

    # add HAL files here as required

    # SPIFFS
    stm32h7xx_hal_dma.c
    stm32h7xx_hal_qspi.c
)

foreach(SRC_FILE ${STM32H7_CubePackage_SRCS})
    set(STM32H7_CubePackage_SRC_FILE SRC_FILE-NOTFOUND)
    find_file(STM32H7_CubePackage_SRC_FILE ${SRC_FILE}
        PATHS 

        ${CMAKE_BINARY_DIR}/STM32H7_CubePackage_Source/Drivers/STM32H7xx_HAL_Driver/Src

        CMAKE_FIND_ROOT_PATH_BOTH
    )
    # message("${SRC_FILE} >> ${STM32H7_CubePackage_SRC_FILE}") # debug helper
    list(APPEND STM32H7_CubePackage_SOURCES ${STM32H7_CubePackage_SRC_FILE})
endforeach()


include(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(STM32H7_CubePackage DEFAULT_MSG STM32H7_CubePackage_INCLUDE_DIRS STM32H7_CubePackage_SOURCES)
