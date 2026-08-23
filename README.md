# WCH-SDK
SDK for developing with WCH's MCUs.

### About
Writing software for WCH's MCUs can be a hassle due to the need for using
Moun River Studio IDE. This project aims to separate the SDK from the IDE
by taking out the HAL & adding CMake support for the HAL & the toolchain.

This allows for:
- Fixing bugs, etc in the HAL that can be then easily propagated.
- Eliminating the dependence on any one IDE.
- Contribution by people to improve documentation, fix bugs, etc.

**NOTE**: This project is NOT associated with WCH but their support
would be invaluable for making software development on their platform
more accessible.
