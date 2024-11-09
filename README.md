# Dotfiles

A collection of personal dotfiles to set up and sync a development environment across different systems.

## Quick Start

1. **Clone this Repository**

    ```bash
    git clone https://github.com/yourusername/dotfiles.git
    cd dotfiles
    ```

2. **Run `link.sh` to Create Symbolic Links**

    Run the script to set up symbolic links for each dotfile in your home directory.

    ```bash
    ./link.sh
    ```

   - **Automatic Linking**: This script links each dotfile from the repository to your home directory, so your settings are always in sync.
   - **Skip Existing Files**: If a file already exists in your home directory, the script will skip it to avoid overwriting.

3. **Exclude Files with `.ignore`**

   To skip specific files during linking, list them in the `.ignore` file. `link.sh` will automatically ignore these files when creating links.


