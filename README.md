# @zee-bit's (dot)files

My dotfiles follow the convention from [`homeshick`](https://github.com/andsens/homeshick).

`homeshick` is a  git based dotfiles synchronizer utility. dotfiles are splitup into repositories called "castles". This repository is my primary castle. It has all the common and most used configs. Be mindful of the spelling, "homesick" vs "home**sh**ick". The former is the original tool implemented in ruby, and later in shell script.

In practice, you should be able to use the files as is, by getting them from the `/home` directory in this repository.

## Installation

1. Install [`homeshick`](https://github.com/andsens/homeshick) and source it:

   ```bash
   git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
   source ~/.homesick/repos/homeshick/homeshick.sh
   ```

   Later we would be able to use our alias `home` for `homeshick`, once we have loaded the first castle.

2. Get the castle that you need:

   ```bash
   homeshick clone https://github.com/zee-bit/dotfiles.git
   ```

## License

MIT © 2022 Zeeshan Equbal
