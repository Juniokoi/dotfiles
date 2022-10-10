# .dotfiles || Junio KOI

> All my Linux and apps custom files for themes or specific configs.

## Intro
Here I show you my precious, where I keep all the settings needed to keep a pretty Linux setup. 
Generally I use Arch Linux distros, more specifically the Manjaro or EndeavourOS ones  

Manjaro is the best choice for those who wants to get started with ArchLinux, and EndeavourOS are for those who are more expert. :triangular_flag_on_post: *this is totally not beginner friendly*.  
Anyway, as this is not a distro specific setup, you can use my .conf files freely



## How to install
To implement the settings I strongly recommend using the GNU Tool: [Stow](https://www.gnu.org/software/stow/)  
After installing in your machine and cloning this repo in your system, you just have to
go inside this folder with `cd /path/to/repo` and use `stow Kitty/`  

If stow shows an error saying the file already exists *(and probably will)*, you will have to remove the original file  

This is possible in many ways, but I recommend creating a backup placing a tilda(~) in the end of the file, like this:  
`mv $HOME/.config/kitty $HOME/.config/kitty~`  

or if is a boilerplate created by the app itself, you can force to remove the entire folder and throw it to the limbo, like this:  
`rm -rf ~/.config/kitty`
> NOTE :: Instead of Kitty you insert the config file you want.  
> and remember: this dotfiles **is not** focused on being universal, the settings  were created to fit **MY** preferences so use it if you know what you are doing  

>Inside each folder there is an README file showing how to use it properly (W.I.P)





### Anki settings
I also found a theme I love using in Anki (a flashcard system) that is focused on [Dracula](https://draculatheme.com/) 
<details> 
  <summary>
      Pics 
  </summary>
  <br>
<table>
  <tr>
    <th>
      Main Screen
    </th>
    <th>
      Card Template
    </th>
  </tr>
  
  <tr>
      <td>
        <img src="https://user-images.githubusercontent.com/53125029/170778251-7d8137f5-3555-4b19-8327-69417a6ccacb.png" width=100% height="auto">
      </td>
      <td>
        <img src="https://user-images.githubusercontent.com/53125029/170778261-60650c81-352e-4016-a895-7495a68daee0.png" width=100% height="auto">
      </td>
    </tr>
</table>
  
 </details> 
  
