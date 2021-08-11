function note -d 'A terminal-based note management tool' -a action -a target
  function print_help
    echo "Usage: note <command> <options>\n"
    echo "Commands:"
    echo "- a, all: open all notes"
    echo "- n, new: add a new note with note title as 2nd argument"
    echo "- l, list: list and edit written notes"
    echo "- s, search: search for text within the notes"
  end

  function all_notes
    nvim $NOTES_PATH
  end

  function add_note -a title
    if test -z $title
      set title (read -l -P "Title: ")
    end

    set -l lowercase_title (string replace -a -r '\s' '-' $title | string lower)
    set -l date (date "+%Y-%m-%d")
    set -l filename "$NOTES_PATH/$date-$lowercase_title.md"
    nvim $filename
  end

  function list_notes
    find $NOTES_PATH -type f -name '*.md' | fzf \
      --ansi -m \
      --header "e = edit, x = delete, y = yank, CTRL-R = reload" \
      --preview 'glow -s dark {}' \
      --bind 'e:execute(nvim {})' \
      --bind 'x:execute-silent(rm -f {})' \
      --bind 'y:execute-silent(pbcopy < {})'
  end

  function search_notes -a phrase
    rg -S -C 5 $phrase $NOTES_PATH
  end

  set -x NOTES_PATH "$HOME/Notes"

  if test ! -d $NOTES_PATH
    mkdir -p $NOTES_PATH
  end

  if test -z $action
    list_notes
    return 0
  end

  switch $action
    case a all
      all_notes
    case n new
      add_note $target
    case l list
      list_notes
    case s search
      search_notes $target
    case '*'
      print_help
  end
end
