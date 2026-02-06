Phil, what about this layout?

- Rename repo to "odp-platform-qemu-sbsa"
- Root contains only components (ec, tf-a, uefi), common, and support like git stuff, main build, container, etc.
- Common Folder
  - Platform - Nothing yet, but if we need some config for say the qemu build or some config that spans all components
  - qemu - This is the qemu build submodule.  Will it work for all components?  What about EC, does it need a special QEMU?
  - build.sh - This is to do anything needed at compilation time in this folder.  qemu is a submodule, so we need the script outside that folder to compile it.
- uefi folder
  - The edk2 folder is a submodule to tianocore
  - Platform - All files in the edk2 platform and osi repos were copied here.  For now it's kind of ugly, but most of these files can be removed and boiled down to just a small platform config.  Remove the bloat of PCDs, a parser, dec file, etc. and provide very simple asl to clearly show the data needed.
    - Bin directory are binaries from the osi repo, maybe these do need to be a submodule?  Or are you building them in the tfa?  Can we remove them?
    - Drivers has your modifications already in place, no need to patch since those files are not a submodule
  - build.sh does just the UEFI stuff and leaves the binaries in a ./Build folder
- ec, tf-a, etc. folders
  - submodule for core code
  - Platform directory for all config for the specific component
- build.sh was updated to just call the component build scripts then stitch the bootchain
