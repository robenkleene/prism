complete -c prism -l blame-code-style -x -d "Style string for the code section of a git blame line"
complete -c prism -l blame-format -x -d "Format string for git blame commit metadata"
complete -c prism -l blame-palette -x -d "Background colors used for git blame lines"
complete -c prism -l blame-separator-format -x -d "Separator between the blame format and the code section of a git blame line"
complete -c prism -l blame-separator-style -x -d "Style string for the blame-separator-format"
complete -c prism -l blame-timestamp-format -x -d "Format of git blame timestamp in raw git output received by prism"
complete -c prism -l color-only -d "Do not alter the input structurally in any way"
complete -c prism -l commit-decoration-style -x -d "Style string for the commit hash decoration"
complete -c prism -l commit-regex -x -d "Regular expression used to identify the commit line when parsing git output"
complete -c prism -l commit-style -x -d "Style string for the commit hash line"
complete -c prism -l dark -d "Use default colors appropriate for a dark terminal background"
complete -c prism -l default-language -x -d "Default language used for syntax highlighting"
complete -c prism -l diff-highlight -d "Emulate diff-highlight"
complete -c prism -l diff-so-fancy -d "Emulate diff-so-fancy"
complete -c prism -l diff-stat-align-width -x -d "Width allocated for file paths in a diff stat section"
complete -c prism -l features -x -d "Names of prism features to activate"
complete -c prism -l file-added-label -x -d "Text to display before an added file path"
complete -c prism -l file-copied-label -x -d "Text to display before a copied file path"
complete -c prism -l file-decoration-style -x -d "Style string for the file decoration"
complete -c prism -l file-modified-label -x -d "Text to display before a modified file path"
complete -c prism -l file-removed-label -x -d "Text to display before a removed file path"
complete -c prism -l file-renamed-label -x -d "Text to display before a renamed file path"
complete -c prism -l file-style -x -d "Style string for the file section"
complete -c prism -l file-transformation -x -d "Sed-style command transforming file paths for display"
complete -c prism -l grep-context-line-style -x -d "Style string for non-matching lines of grep output"
complete -c prism -l grep-file-style -x -d "Style string for file paths in grep output"
complete -c prism -l grep-line-number-style -x -d "Style string for line numbers in grep output"
complete -c prism -l grep-match-line-style -x -d "Style string for matching lines of grep output"
complete -c prism -l grep-match-word-style -x -d "Style string for the matching substrings within a matching line of grep output"
complete -c prism -l grep-separator-symbol -x -d "Separator symbol printed after the file path and line number in grep output"
complete -c prism -l hunk-header-decoration-style -x -d "Style string for the hunk-header decoration"
complete -c prism -l hunk-header-file-style -x -d "Style string for the file path part of the hunk-header"
complete -c prism -l hunk-header-line-number-style -x -d "Style string for the line number part of the hunk-header"
complete -c prism -l hunk-header-style -x -d "Style string for the hunk-header"
complete -c prism -l hunk-label -x -d "Text to display before a hunk header"
complete -c prism -l hyperlinks -d "Render commit hashes, file names, and line numbers as hyperlinks"
complete -c prism -l hyperlinks-commit-link-format -x -d "Format string for commit hyperlinks"
complete -c prism -l hyperlinks-file-link-format -x -d "Format string for file hyperlinks"
complete -c prism -l inline-hint-style -x -d "Style string for short inline hint text"
complete -c prism -l inspect-raw-lines -xa "true false" -d "Kill-switch for --color-moved support"
complete -c prism -l keep-plus-minus-markers -d "Prefix added/removed lines with a +/- character"
complete -c prism -l light -d "Use default colors appropriate for a light terminal background"
complete -c prism -l line-buffer-size -x -d "Size of internal line buffer"
complete -c prism -l line-fill-method -xa "ansi spaces" -d "Line-fill method in side-by-side mode"
complete -c prism -l line-numbers -s n -d "Display line numbers next to the diff"
complete -c prism -l line-numbers-left-format -x -d "Format string for the left column of line numbers"
complete -c prism -l line-numbers-left-style -x -d "Style string for the left column of line numbers"
complete -c prism -l line-numbers-minus-style -x -d "Style string for line numbers in the old (minus) version of the file"
complete -c prism -l line-numbers-plus-style -x -d "Style string for line numbers in the new (plus) version of the file"
complete -c prism -l line-numbers-right-format -x -d "Format string for the right column of line numbers"
complete -c prism -l line-numbers-right-style -x -d "Style string for the right column of line numbers"
complete -c prism -l line-numbers-zero-style -x -d "Style string for line numbers in unchanged (zero) lines"
complete -c prism -l list-languages -d "List supported languages and associated file extensions"
complete -c prism -l list-syntax-themes -d "List available syntax-highlighting color themes"
complete -c prism -l map-styles -x -d "Map styles encountered in raw input to desired output styles"
complete -c prism -l max-line-distance -x -d "Maximum line pair distance parameter in within-line diff algorithm"
complete -c prism -l max-line-length -x -d "Truncate lines longer than this"
complete -c prism -l merge-conflict-begin-symbol -x -d "String marking the beginning of a merge conflict region"
complete -c prism -l merge-conflict-end-symbol -x -d "String marking the end of a merge conflict region"
complete -c prism -l merge-conflict-ours-diff-header-decoration-style -x -d "Style string for the decoration of the header above the 'ours' merge conflict diff"
complete -c prism -l merge-conflict-ours-diff-header-style -x -d "Style string for the header above the 'ours' branch merge conflict diff"
complete -c prism -l merge-conflict-theirs-diff-header-decoration-style -x -d "Style string for the decoration of the header above the 'theirs' merge conflict diff"
complete -c prism -l merge-conflict-theirs-diff-header-style -x -d "Style string for the header above the 'theirs' branch merge conflict diff"
complete -c prism -l minus-empty-line-marker-style -x -d "Style string for removed empty line marker"
complete -c prism -l minus-emph-style -x -d "Style string for emphasized sections of removed lines"
complete -c prism -l minus-non-emph-style -x -d "Style string for non-emphasized sections of removed lines that have an emphasized section"
complete -c prism -l minus-style -x -d "Style string for removed lines"
complete -c prism -l navigate -d "Activate diff navigation"
complete -c prism -l navigate-regex -x -d "Regular expression defining navigation stop points"
complete -c prism -l no-gitconfig -d "Do not read any settings from git config"
complete -c prism -l pager -x -d "Which pager to use"
complete -c prism -l paging -xa "auto always never" -d "Whether to use a pager when displaying output"
complete -c prism -l parse-ansi -d "Display ANSI color escape sequences in human-readable form"
complete -c prism -l plus-emph-style -x -d "Style string for emphasized sections of added lines"
complete -c prism -l plus-empty-line-marker-style -x -d "Style string for added empty line marker"
complete -c prism -l plus-non-emph-style -x -d "Style string for non-emphasized sections of added lines that have an emphasized section"
complete -c prism -l plus-style -x -d "Style string for added lines"
complete -c prism -l raw -d "Do not alter the input in any way"
complete -c prism -l relative-paths -d "Output all file paths relative to the current directory"
complete -c prism -l right-arrow -x -d "Text to display with a changed file path"
complete -c prism -l show-colors -d "Show available named colors"
complete -c prism -l show-config -d "Display the active values for all Prism options"
complete -c prism -l show-syntax-themes -d "Show example diff for available syntax-highlighting themes"
complete -c prism -l show-themes -d "Show example diff for available prism themes"
complete -c prism -l side-by-side -s s -d "Display diffs in side-by-side layout"
complete -c prism -l syntax-theme -xa "(prism --list-syntax-themes | cut -f 2)" -d "The syntax-highlighting theme to use"
complete -c prism -l tabs -x -d "The number of spaces to replace tab characters with"
complete -c prism -l true-color -xa "auto always never" -d "Whether to emit 24-bit RGB color codes"
complete -c prism -l whitespace-error-style -x -d "Style string for whitespace errors"
complete -c prism -l width -s w -x -d "The width of underline/overline decorations"
complete -c prism -l word-diff-regex -x -d "Regular expression defining a 'word' in within-line diff algorithm"
complete -c prism -l wrap-left-symbol -x -d "End-of-line wrapped content symbol"
complete -c prism -l wrap-max-lines -x -d "How often a line should be wrapped if it does not fit"
complete -c prism -l wrap-right-percent -x -d "Threshold for right-aligning wrapped content"
complete -c prism -l wrap-right-prefix-symbol -x -d "Pre-wrapped content symbol"
complete -c prism -l wrap-right-symbol -x -d "End-of-line wrapped content symbol"
complete -c prism -l zero-style -x -d "Style string for unchanged lines"
complete -c prism -l help -s h -d "Print help information"
complete -c prism -l version -s V -d "Print version information"
