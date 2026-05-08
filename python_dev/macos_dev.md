# MacOS Dev


<br>

## Homebrew

* Install Using command here: https://brew.sh

* At the end, the command asked to add the follwoing line to .zprofile.

    ```bash
    eval "$(/opt/homebrew/bin/brew shellenv)"
    ```

<br>

## macOS Virtual Machine Install Using Tart


* Following steps here: https://osxdaily.com/2025/10/06/create-a-macos-tahoe-vm-with-tart

* More about tart: https://www.linkedin.com/pulse/understanding-tart-virtualization-developer-friendly-tool-singh-f1esc/

    ```

    brew install cirruslabs/cli/tart

    tart clone ghcr.io/cirruslabs/macos-tahoe-vanilla:latest my-tahoe-vanilla-vm

    tart run my-tahoe-vanilla-vm

    ```


