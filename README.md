
## Install Alire
- Download Alire .zip from https://alire.ada.dev/
- Decompress the zip file. `unzip alr-*.zip`
- Either add the created bin directory to your path, or move the `alr` binary into somewhere already on your path

## Compile
Creates a binary in the `bin` directory
```
alr build
```
The first time you build, the toolchain assistant may ask you about your toolchain.  For now, pick the defaults. 

### Run
Will also rebuild, if necessary. 
```
alr run
```
