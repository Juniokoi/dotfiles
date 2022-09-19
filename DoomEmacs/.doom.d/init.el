
(doom!
       :completion
       company           ; the ultimate code completion backend
       (ivy               ; a search engine for love and life
        +fonts
        +childframe)

       :ui
       doom              ; what makes DOOM look the way it does
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       (emoji +unicode)  ; 🙂
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       indent-guides     ; highlighted indent columns
       (ligatures +extras)         ; ligatures and symbols to make your code pretty again
       modeline          ; snazzy, Atom-inspired modeline, plus API
       neotree           ; a project drawer, like NERDTree for vim
       ophints           ; highlight the region an operation acts on
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       tabs              ; a tab bar for Emacs
       treemacs          ; a project drawer, like neotree but cooler
       unicode           ; extended unicode support for various languages
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows
       workspaces        ; tab emulation, persistence & separate workspaces
       zen               ; distraction-free coding or writing

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       (format +onsave)  ; automated prettiness
       multiple-cursors  ; editing in many places at once
       parinfer          ; turn lisp into python, sort of
       rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to
       word-wrap         ; soft wrapping with language-aware indent

       :emacs
       (dired +icons)             ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       (ibuffer +icons)         ; interactive buffer management
       (undo + tree)              ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :term
       eshell            ; the elisp shell that works everywhere
       shell             ; simple shell REPL for Emacs
       term              ; basic terminal emulator for Emacs
       vterm             ; the best terminal emulation in Emacs

       :checkers
       syntax              ; tasing you for every semicolon you forget
       grammar           ; tasing grammar mistake every you make

       :tools
       direnv
       docker
       editorconfig      ; let someone else argue about tabs vs spaces
       ein               ; tame Jupyter notebooks with emacs
       (eval +overlay)     ; run code, run (also, repls)
       gist              ; interacting with github gists
       lookup              ; navigate your code and its documentation
       lsp               ; M-x vscode
       magit             ; a git porcelain for Emacs
       make              ; run make tasks from Emacs
       rgb               ; creating color strings
       terraform         ; infrastructure as code
       tree-sitter       ; syntax and parsing, sitting in a tree...
       upload            ; map local to remote projects via ssh/ftp

       :os
       (:if IS-MAC macos)  ; improve compatibility with macOS
       tty               ; improve the terminal Emacs experience

       :lang
       (cc +lsp)         ; C > C++ == 1
       ;;clojure           ; java with a lisp
       common-lisp       ; if you've seen one lisp, you've seen them all
       ;;coq               ; proofs-as-programs
       csharp            ; unity, .NET, and mono shenanigans
       data              ; config/data formats
       (dart +flutter)   ; paint ui and not much else
       elixir            ; erlang done right
       emacs-lisp        ; drown in parentheses
       ;;(go +lsp)         ; the hipster dialect
       (graphql +lsp)    ; Give queries a REST
       (haskell +lsp)    ; a language that's lazier than I am
       (json +lsp)              ; At least it ain't XML
       (java
        +meghanada
        +lsp)       ; the poster child for carpal tunnel syndrome
       (javascript +lsp)        ; all(hope(abandon(ye(who(enter(here))))))
       kotlin            ; a better, slicker Java(Script)
       latex             ; writing papers in Emacs has never been so fun
       (lua               ; one-based indices? one-based indices
        +lsp)
       markdown          ; writing docs for people to ignore
       nix               ; I hereby declare "nix geht mehr!"
       (org
        +publish
        +journal
        +pretty)              ; organize your plain life in plain text
       php               ; perl's insecure younger brother
       python            ; beautiful is better than ugly
       rest              ; Emacs as a REST client
       (ruby +rails)     ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       rust              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       (scheme +guile)   ; a fully conniving family of lisps
       sh                ; she sells {ba,z,fi}sh shells on the C xor
       (web +lsp)               ; the tubes
       yaml              ; JSON, but readable

       :config
       literate
       (default +bindings +smartparens))
