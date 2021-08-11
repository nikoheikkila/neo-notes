# Neo Notes

This is my personal notetaking application composed with UNIX philosophy in mind. Tools required and used for this application are listed below:

- Fish shell, because it's nicer than Bash and ZSH
- NeoVim (`nvim`) for writing notes
- Fuzzy finder (`fzf`) for viewing the note listing interactively
- Glow (`glow`) for previewing the Markdown notes on the listing view
- Ripgrep (`rg`) for searching

The tools will remain locked to these for the foreseaable future because making every software configurable is wasteful. Your mileage may vary so do fork this repo and modify the script as needed.

## Installation

Having installed the aforementioned tools, you should clone the repository and symlink the `note.fish` to your Fish shell's function directory.

```bash
# Copying

cp -a note.fish $HOME/.config/fish/functions/

# Symlinking
ln -sf note.fish $HOME/.config/fish/functions/note.fish
```

## Usage

The tool is aimed to be very simple to use. It assumes the notes will live inside `~/Notes` and will attempt to create the directory if it doesn't exist. Feel free to use your preferred tool for synchronizing the directory to other machines.

- create a new note: `note new` (title is prompted)
- create a new note with title: `note new 'My Title'`
- list saved notes: `note list`
- search notes for a phrase `note search 'Thing'`
- open the note directory in editor: `note all`

