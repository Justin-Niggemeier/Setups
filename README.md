# Neovim
If you want the easy way, just clone this git and the the compiled nvim folder, copy it to your '$HOME'-Directory. 
If you like to keep a newer Versions, you will have to compile nvim on your own or pull a newer **already compiled** Version from the **Neovim-Repository**

> [!IMPORTANT]
>**Be sure to include a new Export in your .bashrc/.zshrc to your nvim installation: export PATH="$HOME/$YOUR_NVIM_FILENAME/bin:$PATH", if you did'nt install it diretcly onto the $HOME directory, be sure to change it acordingly. I like to use ".neovim" so it'll be hidden**

_If you did'nt install it diretcly onto the $HOME Repository, be sure to change it acordingly. I like to use ".neovim" so it'll be hidden_

# Getting my Plugins
_This was written by me in a very lightway manner. Things dont load unless they have to. I'll explain where and when such things happen, and how you can change them, if you dont like it this way_

Feel free to write your own 'Plugins', but feel even more free to just use mine. I used **Lazy-vim**, a package manager, that takes care of your plugins, as long as you provide the code. Just keep that in mind, if you want to add more files yourself. 

_Lazy is written in lua, you don't really need to understand it, but it's adviced, if you are planing on changing things, apart from the ones I show you_

Just copy the nvim directory into $HOME/.config, this will automatically load all the plugins and install them with the next start. 

# Plugins
I provide you with the most important ones, as I like things _lightweight_. The market of plugins is just as big as you may know it from VSCode, and you can easily add them. 

## Treesitter
_Treesitter is just to make you Code look good. It is an extremely fast Code parser. With it, vim parses the same way as emacs, and now you lost the last reason, why you'd prefer emacs over vim_

It just makes code be colored right. There is more to it. More, that does not really matter.
**Catpuccin** basicaly does the same thing, just that it is a Theme, that I enjoy.

## Neo-Tree
_Don't use it, if you are new to the cluster. Just dont keep reeding about this, as I think it will take some nesecary skills away from you_

A pretty looking file tree with some useful twists. Pretty selfexplainatory:
Its real fast at editing file strucutres
Open it with 'C-n' and you can:
- open files with >Enter
- open in vertical-split with >s
- open in horizontal-split with >S
- goto the upper dir with >Backspace
- add a new file with >a
- delete a file with >d
- rename a file with >r
- "Strg+c" a file with >y
- "Strg+x" a file with >x
- paste the file with >c
- move the file with >m

  #Hotkeys
- 'C-n' : Toggle the neotree. Also loads the plugin
- 's' : Open File in vertical split
- 'S' : Open File in horizontal split
- 'bs' : cd .., sets the Tree one directory back, just try it.
- 'a' : add new file
- 'd' : delete file
- 'r': rename file
- 'y' : Strg + c
- 'x' : Strg + x
- 'm' : move selected file
- 'p' : Paste the file, regarding if you used 'y' or 'x'
